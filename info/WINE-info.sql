-- Christopher Creber
-- ccreber@calpoly.edu

-- Q1

SELECT Appellation
FROM appellations
WHERE isAVA = "Yes";

-- Q2

SELECT DISTINCT grapes.Grape
FROM grapes, wine
WHERE Color = "White" AND Vintage = 2008 AND Score >= 90 AND grapes.Grape = wine.Grape
ORDER BY grape ASC;

-- Q3

SELECT DISTINCT appellations.Appellation, County
FROM appellations, wine
WHERE County = "Sonoma" AND appellations.Appellation = wine.Appellation
AND wine.Grape = "Grenache"
ORDER BY County ASC, Appellation ASC;

-- Q4

SELECT DISTINCT Vintage
FROM appellations, wine
WHERE wine.Grape = "Zinfandel" AND County = "Sonoma" AND Score > 92
AND appellations.Appellation = wine.Appellation;

-- Q5

SELECT Name, Vintage, Score, (Cases * 12 * Price) AS totalRevenue
FROM wine
WHERE Winery = "Carlisle" AND Grape = "Syrah"
ORDER BY totalRevenue DESC;

-- Q6

SELECT w1.Price + (w2.Price * 2) + w3.Price AS totalPrice
FROM wine w1, wine w2, wine w3
WHERE w1.Winery = "Kosta Browne" AND w1.Name = "Koplen Vineyard"
AND w1.Vintage = 2008 AND w1.Grape = "Pinot Noir"
AND w2.Winery = "Darioush" AND w2.Name = "Darius II"
AND w2.Vintage = 2007 AND w2.Grape = "Cabernet Sauvingnon"
AND w3.Winery = "Kistler" AND w3.Name = "McCrea Vineyard"
AND w3.Vintage = 2006 AND w3.Grape = "Chardonnay";
