-- Christopher Creber
-- ccreber@calpoly.edu
-- WINE

-- Q1. List all 2006 vintage wines from ‘Napa’ (any appellation within the county) whose total
-- revenue exceeds that of the 2006 ‘Appelation Series’2 ‘Paso Robles’ ‘Zinfandel’ from
-- ‘Rosenblum’ winery. For each wine report grape, winery and name??????, score and *revenue. Order
-- by revenue.

SELECT w.grape, w.winery, w.name, w.score, (12 * w.Cases * w.Price) AS revenue
FROM wine w2, wine w
INNER JOIN appellations a
ON a.Appellation = w.Appellation
WHERE a.County = "Napa"
AND w2.Name = "Appelation Series"
AND w2.Appellation = "Paso Robles"
AND w2.Grape = "Zinfandel"
AND w2.Winery = "Rosenblum"
AND 12 * w.Cases * w.Price > 12 * w2.Cases * w2.Price
ORDER BY revenue;

-- Q2. Find the average score of a ‘Paso Robles’ ‘Zinfandel’ (grape).

SELECT AVG(score)
FROM wine w
WHERE w.Appellation = "Paso Robles"
AND w.Grape = "Zinfandel";

-- Q3. Find the total revenue from all red wines made by ‘Kosta Browne’.

SELECT SUM(12 * Cases * Price)
FROM wine w
INNER JOIN grapes g
ON w.Grape = g.Grape
WHERE w.Winery = "Kosta Browne"
AND g.Color = "Red";

-- Q4. Find the average number of cases of a ‘Pinot Noir’ (name) produced from grapes sourced from the
-- ‘Central Coast’.

SELECT AVG(Cases)
FROM wine
WHERE name = "Pinot Noir";

-- Q5. Report the overall number of different red wines produced in ‘Russian River Valley’ during
-- the year when this AVA had a wine with a score of 98.

SELECT COUNT(*)
FROM wine w2, wine w
INNER JOIN grapes g
ON g.Grape = w.Grape
WHERE g.Color = "Red" AND w.Appellation = "Russian River Valley"
AND w2.Appellation = "Russian River Valley" AND w2.Score = 98
AND w.Vintage = w2.Vintage;
