-- Christopher Creber
-- ccreber@calpoly.edu

-- 1. (no subquery) For each full minute, report the total number of runners whose pace was between
-- that number of minutes and the next. (That is, how many runners ran the marathon at a pace
-- between 5 and 6 mins, how many at a pace between 6 and 7 mins, and so on).

SELECT MINUTE(Pace) AS min, COUNT(Pace)
FROM marathon
GROUP BY MINUTE(Pace);

-- 2. (no subquery) For each state whose representatives participated in the marathon, report the
-- number of runners from it who finished in top 10 in their gender-age group. (If a state did not
-- have runners in top 10s, exclude information about that state.) Sort the output in descending
-- order by the computed number.

SELECT State, COUNT(State)
FROM marathon
WHERE GroupPlace <= 10
GROUP BY State;

-- 3. Find the state with the largest number of participants.

SELECT State
FROM marathon
GROUP BY State
HAVING COUNT(State) >= ALL (SELECT COUNT(State)
FROM marathon
GROUP BY State);

-- 4. Find all towns in Rhode Island (‘RI’) which fielded more female runners than male runners for
-- the race. Report the names of towns.

SELECT m.Town
FROM marathon m
WHERE m.Sex = 'F'
GROUP BY m.Town
HAVING COUNT(*) > (SELECT COUNT(*)
FROM marathon m2
WHERE m2.Sex = 'M' AND m.Town = m2.Town
GROUP BY m2.Town);

-- 5. A “pace category” of runners consists of all runners who showed a pace that had the same full
-- minute value. For example, all runners who ran at the pace of 8 minutes and NN seconds (where
-- 0 ≤ NN ≤ 59) belong to the same pace category. Thus, the pace category is computed with
-- truncation rather than rounding. For each pace category, report the gender-age group with the
-- largest number of runners in it. (Gender-age groups are reported as a pair of gender and age
-- bracket). Report the results sorted in ascending order by the full minute of the pace.
-- Note: In other words, answer the query “Among all the runners who ran at the pace between
-- N and N + 1 minutes, find the most common gender-age group to which they belong” for each
-- possible [N, N +1] interval. Put another way: for each pace, group its participants by gender-age
-- and find the gender-age group with the largest number of participants.

SELECT MINUTE(Pace) AS min, Sex, AgeGroup
FROM marathon
GROUP BY MINUTE(Pace), Sex, AgeGroup
HAVING COUNT(Sex) >= ALL (SELECT COUNT(Sex)
FROM marathon
WHERE min = MINUTE(Pace)
GROUP BY MINUTE(Pace), Sex, AgeGroup)
AND COUNT(AgeGroup) >= ALL (SELECT COUNT(AgeGroup)
FROM marathon
WHERE min = MINUTE(Pace)
GROUP BY MINUTE(Pace), Sex, AgeGroup);

-- 6. For each state, report the gender-age group with the largest number of participants. Output the
-- state, the gender-age group, and the number of runners in the group in alphabetical order by
-- the state code. Report only information for the states where the largest number of participants
-- in a gender-age group is greater than one.

SELECT State, Sex, AgeGroup
FROM marathon m
GROUP BY State, Sex, AgeGroup
HAVING COUNT(Sex) >= ALL (SELECT COUNT(Sex)
FROM marathon
WHERE m.State = State
GROUP BY State, Sex, AgeGroup)
AND COUNT(AgeGroup) >= ALL (SELECT COUNT(AgeGroup)
FROM marathon
WHERE m.State = State
GROUP BY State, Sex, AgeGroup);

-- 7. Find the 30th fastest female runner. Report her overall place in the race and the full name.
-- Note: This must be done using a single SQL query that DOES NOT use the LIMIT clause (this
-- prohibition is covered by the “Well, almost No-Holds-Barred). Think of how this can be done.
-- Think of what it means for a row to represent the 30th fastest (female) runner.

SELECT Place, FirstName, LastName
FROM marathon m
WHERE Sex = 'F' AND 29 = (SELECT
            COUNT(*)
        FROM
            marathon m2
        WHERE
            m.RunTime > m2.RunTime AND Sex = 'F');

-- 8. For each town in New Hampshire, report the total number of male and the total number of
-- female runners. Both numbers shall be reported on the same line. If no runners of a specific
-- gender from the town participated in the marathon, report NULL.
-- Consider: What type of an operation is called for here? With what data?

SELECT m.Town,
COUNT(*) - (SELECT COUNT(*)
            FROM marathon
            WHERE State = "NH" AND Sex = 'F' AND Town = m.Town) AS men,
COUNT(*) - (SELECT COUNT(*)
            FROM marathon
            WHERE State = "NH" AND Sex = 'M' AND Town = m.Town) AS women
FROM marathon m
WHERE State = "NH"
GROUP BY m.Town
