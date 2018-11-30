-- Christopher Creber
-- ccreber@calpoly.edu

-- 1. (no subquery) For each day of the week, report the total number of reservations that commenced
-- on it and the total revenue these reservations brought. Report days of week as ‘Monday’,
-- ‘Tuesday’, etc.5

-- Is this how to do revenue
SELECT DAYNAME(CheckIn) dayName, SUM(Rate * DATEDIFF(checkOut, CheckIn))
FROM reservations
GROUP BY dayName
ORDER BY dayName ASC;


-- 2. (no subquery) For each room report how many nights in 2010 the room was occupied. Report
-- the room code, the full name of the room, and the number of occupied nights. Sort in descending
-- order by occupied nights. (Note: it has to be number of nights in 2010 - the last reservation in
-- each room may and will go beyond ‘December 31, 2010’, so the “extra” nights in 2011 need to
-- be deducted or in some way eliminated).

SELECT rm.RoomName,
   SUM(IF(YEAR(CheckOut) = 2010, DATEDIFF(CheckOut, CheckIn), DATEDIFF('2010-12-31', CheckIn))) AS totalNights
FROM rooms rm
INNER JOIN reservations res
ON rm.RoomId = res.Room
WHERE YEAR(CheckIn) = 2010
GROUP BY rm.RoomName;


-- Note/Hint: While multiple solutions are possible, one solution uses SQL’s SIGN() built-in
-- function which returns -1 for negative numbers, +1 for positive numbers and 0 for 0. Another
-- uses SQL’s IF(<expr1>,<expr2>,<expr3>) operator which is similar to C’s ?: operator.
-- 3. Find the most popular room in the hotel. The most popular room is the room that had the
-- largest number of reservations. (Note: if there is a tie for the most popular room status, report all
-- such rooms.) Report the full name of the room, the room code, and the number of reservations.

SELECT rm.RoomName, rm.RoomId, COUNT(*)
FROM rooms rm
INNER JOIN reservations res
ON rm.RoomId = res.Room
GROUP BY rm.RoomName, rm.RoomId
HAVING COUNT(*) >= ALL (SELECT COUNT(*)
                        FROM rooms rm
                        INNER JOIN reservations res
                        ON rm.RoomId = res.Room
                        GROUP BY rm.RoomName, rm.RoomId);


-- 4. Find the room that has been occupied the largest number of days based on the reservations in
-- the database
-- . Report the room name, the room code, and the number of days it was occupied.

SELECT rm.RoomName, rm.RoomId, SUM(DATEDIFF(CheckOut, CheckIn))
FROM rooms rm
INNER JOIN reservations res
ON rm.RoomId = res.Room
GROUP BY rm.RoomName, rm.RoomId
HAVING SUM(DATEDIFF(CheckOut, CheckIn)) >= ALL (SELECT SUM(DATEDIFF(CheckOut, CheckIn))
FROM rooms rm
INNER JOIN reservations res
ON rm.RoomId = res.Room
GROUP BY rm.RoomName, rm.RoomId);

-- 5. Find the best month (i.e., the month with the highest total revenue). Report the month, the total
-- number of reservations and the revenue. For the purposes of the query, count the entire revenue
-- of a stay that commenced in one month and ended in another towards the earlier month (e.g.,
-- a September 29 - October 3 stay is counted as a September stay for the purpose of computing
-- September revenue).

SELECT MONTH(CheckIn) AS mon, COUNT(*) reserves, SUM(DATEDIFF(CheckOut, CheckIn) * Rate)
FROM rooms rm
INNER JOIN reservations res
ON rm.RoomId = res.Room
GROUP BY mon
HAVING SUM(DATEDIFF(CheckOut, CheckIn) * Rate) >= ALL (SELECT SUM(DATEDIFF(CheckOut, CheckIn) * Rate)
FROM rooms rm
INNER JOIN reservations res
ON rm.RoomId = res.Room
GROUP BY MONTH(CheckIn));


-- 6. For each room report whether it was occupied or unoccupied on July 4, 2010. Report the full
-- name of the room, the room code, and put either ‘Occupied’ or ‘Empty’ depending on whether
-- the room is occupied on that day. (The room is occupied if there is someone staying the night
-- of July 4, 2010. It is NOT occupied if there is a checkout on this day, but no checkin).
-- Produce your output in alphabetical order by room code.

SELECT rm.RoomName, rm.RoomId,
IF(SUM(IF(CheckIn <= '2010-04-07' AND CheckOut > '2010-04-07', 1, 0)) =1, 'Occupied', 'Empty') AS OccupationStatus
FROM rooms rm
INNER JOIN reservations res
ON rm.RoomId = res.Room
GROUP BY rm.RoomName, rm.RoomId
ORDER BY rm.RoomId;
