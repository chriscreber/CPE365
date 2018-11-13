1. Find all customers who purchased, during the same trip to the bakery, two different ‘Croissant’s.
   Report first and last names of the customers in alphabetical order by their last name.

SELECT *
FROM
WHERE

2. Find all days on which either ‘ALMETA DOMKOWSKI’ made a purchase, or someone purchased a ‘Gongolais Cookie’. Sort dates in chronological order. Each date shall appear exactly once.

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

3. Report the total amount of money ‘NATACHA STENZ’ spent at the bakery during the month of October 2007.

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

4. Report the total amount of money spent by bakery customers in October 2007 on ‘Chocolate’- flavored items

SELECT sum(Price) TotalSpent
FROM receipts r
   JOIN items i
      ON r.RNumber = i.Receipt
   JOIN goods g
      ON i.Item = g.GId
WHERE saleDate BETWEEN "2007-10-01" AND "2007-10-31";
