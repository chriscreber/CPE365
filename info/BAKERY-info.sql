-- Jett Moy          Chris Creber
-- jlmoy             ccreber

-- 1

SELECT Flavor, Food, Price
FROM goods
WHERE Flavor = "Chocolate" AND Price < 5;


-- 2

SELECT Flavor, Food, Price
FROM goods
WHERE (Food = "Cookie" AND Price > 1.1) OR Flavor = "Lemon" OR (Flavor = "Apple" AND Food != "Pie")
ORDER BY Flavor, Food;

-- 3

SELECT DISTINCT FIrstName, LastName
FROM customers c
   JOIN receipts r
      ON c.CId = r.Customer
WHERE saleDate = "2007-10-03"
ORDER BY LastName;

-- 4

SELECT DISTINCT Flavor, Food
FROM receipts r
   JOIN items i
      ON r.RNumber = i.Receipt
   JOIN goods g
      ON i.Item = g.GId
WHERE saleDate = "2007-10-04" AND Food = "Cake"
ORDER BY Flavor;

-- 5

SELECT Flavor, Food, Price
FROM receipts r
   JOIN items i
      ON i.Receipt = r.RNumber
   JOIN goods g
      ON g.GId = i.Item
   JOIN customers c
      ON c.CId = r.Customer
WHERE saleDate = "2007-10-25" AND FirstName = "Ariane" AND LastName = "Cruzen";


-- 6

SELECT Flavor, Food
FROM receipts r
   JOIN items i
      ON r.RNumber = i.Receipt
   JOIN goods g
      ON i.Item = g.GId
   JOIN customers c
      ON r.Customer = c.CId
WHERE saleDate BETWEEN "2007-10-01" AND "2007-10-31"
   AND c.FirstName = "Kip" AND c.LastName = "Arnn" AND Food = "Cookie"
ORDER BY Flavor;
