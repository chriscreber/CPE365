-- 1. Find all chocolate-flavored items on the menu whose price is under $5.00. For each item output the flavor, the name (food type) of the item, and the price. Sort your output in descending order by price.
SELECT Flavor, Food, Price
FROM goods
WHERE Flavor = "Chocolate" AND Price < 5;


-- 2. Report the prices of the following items:
-- • any cookie priced above $1.10;
-- • any lemon-flavored items;
-- • any apple-flavored item except for the pie.
-- Output the flavor, the name (food type) and the price of each pastry. Sort the output in alphabetical order by the flavor and then the name.
SELECT Flavor, Food, Price
FROM goods
WHERE (Food = "Cookie" AND Price > 1.1) OR Flavor = "Lemon" OR (Flavor = "Apple" AND Food != "Pie")
ORDER BY Flavor, Food;

-- 3. Find all customers who made a purchase on October 3, 2007. Report the name of the customer (first, last). Sort the output in alphabetical order by the customer’s last name. Each customer name must appear at most once.
SELECT DISTINCT FirstName, LastName
FROM customers
WHERE Cid IN(SELECT Customer
            FROM receipts
            WHERE saleDate = "2007-10-03")
ORDER BY LastName;

-- 4. Find all different cakes purchased on October 4, 2007. Each cake (Flavor, Food) is to be listed once. Sort output in alphabetical order by the cake Flavor.
SELECT Flavor, Food
FROM goods
WHERE Gid IN(SELECT Item
            FROM receipts r JOIN items i ON r.RNumber = i.Receipt
            WHERE saleDate = "2007-10-04")
         AND Food = "Cake"
ORDER BY Flavor;

-- 5. List all pastries purchased by ‘ARIANE CRUZEN’ on October 25, 2007. For each pastry, specify its flavor and type, as well as the price. Output the pastries in the order in which they appear on the receipt (each pastry needs to appear the number of times it was purchased).
SELECT Flavor, Food, Price
FROM goods
WHERE Gid IN(SELECT Item
            FROM items
            WHERE items.Receipt IN(SELECT RNumber
                                 FROM receipts
                                 WHERE saleDate = '2007-10-25' AND Customer IN(SELECT Cid
                                       FROM customers
                                       WHERE FirstName = "Ariane" AND LastName = "Cruzen")));

-- 6. Find all types of cookies purchased by ‘KIP ARNN’ during the month of October, 2007. Report each cookie type (flavor, food type) exactly once in alphabetical order by flavor.
SELECT Flavor, Food
FROM goods
WHERE Gid IN(SELECT Item
            FROM items
            WHERE items.Receipt IN(SELECT RNumber
                                 FROM receipts
                              WHERE saleDate BETWEEN "2007-10-01" AND "2007-10-31" AND Customer
                              IN(SELECT Cid
                                 FROM customers
                                 WHERE FirstName = "Kip" AND LastName = "Arnn")))
   AND Food = "Cookie"
ORDER BY Flavor;

SELECT Food, Flavor
FROM goods g join (SELECT * FROM items i WHERE i.Receipt IN(SELECT RNumber from receipts where Customer IN(SELECT CId FROM customers WHERE FirstName = "Kip" AND LastName = "Arnn"))) AS o ON g.GId = o.Item
WHERE Food = "Cookie"
ORDER BY Flavor;
