-- Christopher Creber
-- ccreber@calpoly.edu

-- 1. (no subquery) For each wine score value above 88, report average price, the cheapest price, and
-- the most expensive price for a bottle of wine with that score (for all vintage years combined),
-- the total number of wines with that score and the total number of cases produced. Sort by the
-- wine score.

SELECT w.Score, AVG(w.Price), MIN(w.Price), MAX(w.Price), COUNT(*), SUM(w.Cases)
FROM wine w
WHERE w.Score > 88
GROUP BY w.Score
ORDER BY w.Score;

-- 2. (no subquery) For each appellation that produced more than two ‘Cabernet Sauvingnon’ wines
-- in 2007, report its name and county, the total number of ‘Cabernet Sauvingnon’ wines produced
-- in 2008, the average price of a bottle of ‘Cabernet Sauvingnon’ from that vintage, and
-- the total (known) number of bottles produced7
-- . Sort output in descending order by the number
-- of wines.

-- Ask about years and name/grape
SELECT w.Name, a.County, COUNT(w.Name), AVG(w.Price), SUM(w.Cases) * 12
FROM wine w
INNER JOIN appellations a
ON w.Appellation = a.Appellation
WHERE w.Name = "Cabernet Sauvignon" AND w.Vintage = 2007
GROUP BY a.County, w.Appellation
HAVING COUNT(w.Name) > 2
ORDER BY COUNT(*) DESC;

-- 3. Find the most popular grape (i.e., the grape that is used to make the largest number of wines)
-- in ‘San Luis Obispo County’. Report the name of the grape.

SELECT w.Grape
FROM wine w
GROUP BY w.Grape
HAVING COUNT(w.Grape) >= ALL (SELECT COUNT(w.Grape)
FROM wine w
GROUP BY w.Grape);

-- 4. Report the appellation responsible for the largest number of high-ranked wines (score of 93 and
-- above). Report just the name of the appellation.

SELECT a.Appellation, COUNT(a.Appellation)
FROM wine w
INNER JOIN appellations a
ON w.Appellation = a.Appellation
WHERE w.Score >= 93
GROUP BY w.Appellation
HAVING COUNT(w.Appellation) >= ALL (SELECT COUNT(a.Appellation)
FROM wine w
INNER JOIN appellations a
ON w.Appellation = a.Appellation
WHERE w.Score >= 93
GROUP BY w.Appellation);

-- 5. Two California AVAs, ‘Carneros’ and ‘Dry Creek Valley’ have a bragging rights contest
-- every year: the AVA that produces the highest-ranked wine among all the wines produced in
-- both AVAs wins. Based on the data in the database, output (as a single tuple) the number of
-- vintage years each AVA has won between 2005 and 2009 (you want the output to look like a
-- score of a game between the two AVAs. Only the vintage years where one AVA won count -
-- vintages when both AVAs had the same highest score should not be counted).

-- SELECT score1, score2
-- SUM(IF(YEAR(CheckOut) = 2010, DATEDIFF(CheckOut, CheckIn), DATEDIFF('2010-12-31', CheckIn))) AS totalNights
-- FROM wine w
-- WHERE w.Appellation = "Carneros"
-- AND Vintage >= 2005 AND Vintage <= 2009
-- GROUP BY w.Appellation
-- HAVING w.Score > ALL (SELECT Score
--                         FROM wine
--                         WHERE w.Appellation = "Dry Creek Valley"
--                         AND Vintage >= 2005 AND Vintage <= 2009
--                         GROUP BY w.Appellation);

-- Not done
SELECT COUNT(*), 5 - COUNT(*)
FROM wine w
WHERE w.Appellation = "Carneros"
AND Vintage >= 2005 AND Vintage <= 2009
AND w.Score > ALL (SELECT Score
                        FROM wine
                        WHERE w.Appellation = "Dry Creek Valley"
                        AND Vintage >= 2005 AND Vintage <= 2009);


-- 6. Find how many cases were produced of the most expensive red wine from ‘Napa’ county

SELECT w.Cases
FROM wine w
INNER JOIN appellations a
ON w.Appellation = a.Appellation
INNER JOIN grapes g
ON w.Grape = g.Grape
WHERE a.County = "Napa" AND g.Color = "Red"
GROUP BY a.County, w.Cases
HAVING MAX(w.Score) >= ALL (SELECT w.Score
   FROM wine w
   INNER JOIN appellations a
   ON w.Appellation = a.Appellation
   INNER JOIN grapes g
   ON w.Grape = g.Grape
   WHERE a.County = "Napa" AND g.Color = "Red");
