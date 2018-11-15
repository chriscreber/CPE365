-- Jett Moy                Chris Creber
-- jlmoy                   ccreber

-- 1

SELECT c.FirstName, c.LastName
FROM receipts r, items i, customers c, goods g
WHERE r.RNumber = i.Receipt AND i.Item = g.GId AND r.Customer = c.CId
   AND Food = "Croissant"
GROUP BY RNumber
HAVING COUNT(DISTINCT Flavor) > 1
ORDER BY c.LastName;

-- 2

SELECT DISTINCT saleDate
FROM receipts r
   JOIN items i
      ON r.RNumber = i.Receipt
   JOIN goods g
      ON i.Item = g.GId
   JOIN customers c
      ON c.CId = r.Customer
WHERE (c.FirstName = "ALMETA" AND c.LastName = "DOMKOWSKI")
   OR (Flavor = "Gongolais" AND Food = "Cookie")
ORDER BY saleDate;

-- 3

SELECT sum(Price) TotalSpent
FROM receipts r
   JOIN items i
      ON r.RNumber = i.Receipt
   JOIN goods g
      ON i.Item = g.GId
   JOIN customers c
      ON c.CId = r.Customer
WHERE (c.FirstName = "NATACHA" AND c.LastName = "STENZ")
   AND saleDate BETWEEN "2007-10-01" AND "2007-10-31";

-- 4

SELECT sum(Price) TotalSpent
FROM receipts r
   JOIN items i
      ON r.RNumber = i.Receipt
   JOIN goods g
      ON i.Item = g.GId
WHERE saleDate BETWEEN "2007-10-01" AND "2007-10-31" AND Flavor = "Chocolate";
