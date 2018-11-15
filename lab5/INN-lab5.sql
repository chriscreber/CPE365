-- Christopher Creber
-- ccreber@calpoly.edu
-- INN

-- Q1
SELECT rm.RoomName, rm.RoomId
FROM rooms rm
INNER JOIN reservations res1
ON rm.RoomId = res1.Room
INNER JOIN reservations res2
ON rm.RoomId = res2.Room
INNER JOIN reservations res3
ON rm.RoomId = res3.Room
WHERE DATE(res1.CheckIn) <= DATE("2010-06-15") AND DATE(res1.CheckOut) >= DATE("2010-06-15")
AND DATE(res2.CheckIn) <= DATE("2010-08-18") AND DATE(res2.CheckOut) >= DATE("2010-08-18")
AND DATE(res3.CheckIn) <= DATE("2010-12-12") AND DATE(res3.CheckOut) >= DATE("2010-12-12")
ORDER BY rm.RoomName;

-- Q2  Find the names of all people1
-- staying at the inn at the same time as ‘HERBERT FRYDAY’. Sort
-- the output in alphabetical order by last name.

SELECT res1.LastName, res1.FirstName
FROM reservations res, reservations res1
WHERE res.FirstName = "HERBERT" AND res.LastName = "FRYDAY"
AND !(res1.FirstName = "HERBERT" AND res1.LastName = "FRYDAY")
AND (((DATE(res1.CheckIn) <= DATE(res.CheckIn) AND DATE(res1.CheckOut) >= DATE(res.CheckIn))
OR (DATE(res1.CheckIn) <= DATE(res.CheckOut) AND DATE(res1.CheckOut) >= DATE(res.CheckOut)))
OR ((DATE(res.CheckIn) <= DATE(res1.CheckIn) AND DATE(res.CheckOut) >= DATE(res1.CheckIn))
OR (DATE(res.CheckIn) <= DATE(res1.CheckOut) AND DATE(res.CheckOut) >= DATE(res1.CheckOut))))
ORDER BY res1.LastName;

-- Q3
SELECT COUNT(*)
FROM reservations
WHERE MONTH(CheckIn) = 8 AND MONTH(CheckOut) = 8;

-- Q4
SELECT AVG(DATEDIFF(res.CheckOut, res.CheckIn))
FROM reservations res
INNER JOIN rooms rm
ON res.Room = rm.RoomId
WHERE rm.RoomName = "Interim but salutary"
AND res.CheckIn >= "2010-05-01" AND res.CheckOut <= "2010-08-31";

-- Q5
SELECT COUNT(DISTINCT DATEDIFF(res.CheckOut, res.CheckIn))
FROM reservations res
INNER JOIN rooms rm
ON res.Room = rm.RoomId
WHERE rm.RoomName = "Interim but salutary"
AND res.CheckOut >= "2010-07-01" AND res.CheckOut <= "2010-07-31";
