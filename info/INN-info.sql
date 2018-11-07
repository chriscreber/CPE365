-- Christopher Creber
-- ccreber@calpoly.edu
-- Lab 4

-- Q1 Is this the room code?

SELECT RoomName, RoomId
FROM rooms
WHERE Decor = 'modern' AND BasePrice < 160 AND Beds = 2;

-- Q2

SELECT LastName, CheckIn, CheckOut, Adults + Kids, Rate
FROM rooms r, reservations res
WHERE MONTH(CheckIn) = 07 AND MONTH(CheckOut) = 07
AND r.RoomName = 'Convoke and sanguine' AND res.Room = r.RoomId
ORDER BY CheckIn;

-- Q3

SELECT r.RoomName, res.CheckIn, res.CheckOut
FROM rooms r, reservations res
WHERE res.CheckIn <= '2010-02-06' AND res.CheckOut >= '2010-02-06' AND RoomId = Room
ORDER BY r.RoomName;

-- Q4

SELECT res.Code, res.CheckIn, res.CheckOut, r.RoomName, DATEDIFF(res.CheckOut, res.CheckIn) * Rate AS totalCost
FROM rooms r, reservations res
WHERE res.FirstName = "GRANT" AND res.LastName = "KNERIEN" AND RoomId = Room
ORDER BY res.CheckIn;

-- Q5

SELECT r.RoomName, res.Rate, DATEDIFF(res.CheckOut, res.CheckIn) AS nightsStayed, DATEDIFF(res.CheckOut, res.CheckIn) * Rate AS totalCost
FROM rooms r, reservations res
WHERE res.CheckIn = '2010-12-31'  AND RoomId = Room
ORDER BY DATEDIFF(res.CheckOut, res.CheckIn) DESC;

-- Q6

SELECT res.Code, r.RoomName, r.RoomId, res.CheckIn, res.CheckOut
FROM rooms r, reservations res
WHERE res.Adults = 4 AND r.Beds = 2 AND RoomId = Room
ORDER BY CheckIn, r.RoomId;
