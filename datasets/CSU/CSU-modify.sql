-- Chris Creber
-- ccreber@calpoly.edu

-- 1 Keep in the table documenting campus enrollments by
-- discipline only the information about the following enrollments

-- Engineering majors from Cp Slo and Cp Pamona
-- Long Beach State enrollments for disciplines with more than 200 grad students
-- All enrollments in Computer and information Sciences for schools with more than 500 undergrad students
DELETE FROM discipline_enrollments
   WHERE !(discipline = 9 AND (campus = 20 OR campus = 14)) OR !(campus = 9 AND graduates > 200) OR !(campus = 7 AND undergraduates > 500);

-- 2 display TABLE
SELECT *
FROM discipline_enrollments
ORDER BY campus, discipline;

-- 3 Keep in table only fee > 2500, year is 2002 or  2004-06, and CP SLO/Pomona or SJSU

DELETE FROM fees
   WHERE fee <= 2500 AND (year = 2002 OR (year BETWEEN 2004 AND 2006))
