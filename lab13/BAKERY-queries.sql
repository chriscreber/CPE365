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

3. Find the customers who never purchased a twist (‘Twist’) in October of 2007. Report their first and last names in alphabetical order by last name.

SELECT DISTINCT FirstName, DISTINCT LastName
FROM
WHERE saleDate BETWEEN "2007-10-01" AND "2007-10-31" AND Food = "Twist"
    AND NOT EXISTS(SELECT * FROM goods g
                    WHERE )
ORDER BY LastName;

4. For every type of Cake report the customer(s) who purchased it the largest number of times during the month of October 2007. Report the name of the pastry (flavor, food type), the name of the customer (first, last), and the number of purchases made. Sort the output in descending order on the number of purchases, then in alphabetical order by last name of the customer.
SELECT g.Flavor, g.Food, c.FirstName, c.LastName, COUNT(*) Purchases
FROM
WHERE Food = "Cake"
GROUP BY Food, c.FirstName, c.LastName
ORDER BY Purchases DESC, LastName;

5. Output the names of all customers who did not make a purchase between October 5 and October 11 (inclusive) of 2007. Output first and last names in alphabetical order by last name.
6. Output the names of all customers who made multiple purchases (more than one receipt) on the latest day in October on which they made a purchase. Report names (first, last) of the customers and the earliest day in October on which they made a purchase, sorted in chronological order.
7. Find out if the sales of ‘Chocolate’-flavored items (in terms of revenue) or the sales of ‘Croissants’ (of all flavors) were higher in October of 2007. Output the word ‘Chocolate’, if the sales of ‘Chocolate’-flavored items had higher revenue, or the word ‘Croissant’ if the sales of ‘Croissants’ had higher revenue.
    Note: This can be done in a number of ways. One way involves the CASE...WHEN clause inside
    the SELECT clause, while another uses SQL’s IF(<expr1>,<expr2>,<expr3>) operator which is similar to C’s ?: operator. But there are ways of building the output without the use of any “exotic” features.
