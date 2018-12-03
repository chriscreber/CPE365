-- Jett Moy            Chris Creber
-- jlmoy               ccreber

-- 1

SELECT Flavor, COUNT(Flavor) Types, AVG(Price)
FROM goods
GROUP BY Flavor
HAVING Types > 3;

-- 2

SELECT DAYNAME(saleDate) Day, COUNT(DISTINCT RNumber) Purchases,
    COUNT(*) Pastries, SUM(Price) DailyRev
FROM receipts r
    JOIN items i
    ON i.Receipt = r.RNumber
    JOIN goods g
    ON i.Item = g.GId
GROUP BY saleDate
HAVING saleDate BETWEEN "2007-10-08" AND "2007-10-15";

-- 3

SELECT FirstName, LastName
FROM customers c
WHERE NOT EXISTS(
    SELECT 'x'
    FROM receipts r JOIN items i ON r.RNumber = i.Receipt
        JOIN goods g ON i.Item = g.GId
    WHERE MONTHNAME(saleDate) = "October" AND YEAR(saleDate) = 2007
        AND Food = "Twist" AND c.CId = r.Customer)
ORDER BY LastName;


-- 4

SELECT a.Flavor, a.Food, a.FirstName, a.LastName, a.Purchases
FROM
    (SELECT  Flavor, Food, FirstName, LastName, count(*) Purchases
    FROM receipts r JOIN items i ON r.RNumber = i.Receipt
        JOIN goods g ON g.GId = i.Item
        JOIN customers c ON r.Customer = c.CId
    WHERE Food = "cake"
        AND MONTHNAME(saleDate) = "October" AND YEAR(saleDate) = 2007
    GROUP BY Flavor, Food, c.FirstName, c.LastName) a
    LEFT JOIN
    (SELECT  Flavor, Food, FirstName, LastName, count(*) Purchases
    FROM receipts r JOIN items i ON r.RNumber = i.Receipt
        JOIN goods g ON g.GId = i.Item
        JOIN customers c ON r.Customer = c.CId
    WHERE Food = "cake"
        AND MONTHNAME(saleDate) = "October" AND YEAR(saleDate) = 2007
    GROUP BY Flavor, Food, c.FirstName, c.LastName) b
    ON a.Flavor = b.Flavor AND a.Purchases < b.Purchases
WHERE b.Food IS NULL
ORDER BY a.Purchases DESC, a.LastName;

-- 5

SELECT FirstName, LastName
FROM customers c
WHERE c.CId NOT IN(SELECT DISTINCT r.Customer
                    FROM receipts r JOIN items i ON r.RNumber = i.Receipt
                    JOIN goods g ON i.Item = g.GId
                    WHERE saleDate BETWEEN "2007-10-05" AND "2007-10-11")
ORDER BY LastName;

-- 6

SELECT FirstName, LastName, FirstPurchase
FROM
    (SELECT saleDate, Customer, COUNT(RNumber) Transactions
    FROM receipts r
    GROUP BY Customer, saleDate
    HAVING Transactions > 1) a
    JOIN
    (SELECT Customer, MAX(saleDate) LastPurchase, MIN(saleDate) FirstPurchase
    FROM receipts r
    GROUP BY Customer) b
    ON a.saleDate = b.LastPurchase AND a.Customer = b.Customer
    JOIN customers c ON a.Customer = c.CId
ORDER BY FirstPurchase;

-- 7

SELECT IF(Chocolate > Croissants, "Chocolate", "Croissants") HighestRevenue
FROM
    (SELECT SUM(Price) Chocolate
    FROM receipts r JOIN items i ON r.RNumber = i.Receipt
        JOIN goods g ON i.Item = g.GId
    WHERE Flavor = "Chocolate"
        AND MONTHNAME(saleDate) = "October" AND YEAR(saleDate) = 2007) a,
    (SELECT SUM(Price) Croissants
    FROM receipts r JOIN items i ON r.RNumber = i.Receipt
        JOIN goods g ON i.Item = g.GId
    WHERE Food = "Croissant"
        AND MONTHNAME(saleDate) = "October" AND YEAR(saleDate) = 2007) b;
