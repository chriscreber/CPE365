-- Christopher Creber
-- ccreber@calpoly.edu
-- KATZENJAMMER

-- Q1. Find the number of times ‘Turid’ played ‘bass balalaika’ on Katzenjammer songs.

SELECT COUNT(*)
FROM instruments i
INNER JOIN band b
ON b.BandId = i.Bandmate
WHERE b.FirstName = "Turid" AND i.Instrument = "bass balalaika";

-- Q2. Find the number of times ‘Solveig’ was positioned center stage while ‘Marianne’ was playing
-- drums.

SELECT COUNT(*)
FROM instruments i
INNER JOIN band b
ON b.BandId = i.Bandmate,
performance p
INNER JOIN band b2
ON p.Bandmate = b2.BandId
WHERE i.Song = p.Song
AND b2.FirstName = "Solveig" AND p.StagePos = "center"
AND b.FirstName = "Marianne" AND i.Instrument = "drums";

-- Q3. Find the number of times ‘Solveig’ sang lead while ‘Marianne’ was performing out front
-- (‘left’, ‘right’ or ‘center’ stage).

SELECT COUNT(*)
FROM vocals v
INNER JOIN band b
ON b.BandId = v.Bandmate,
performance p
INNER JOIN band b2
ON p.Bandmate = b2.BandId
WHERE v.Song = p.Song
AND b2.FirstName = "Marianne"
AND (p.StagePos = "center" OR p.StagePos = "left" OR p.StagePos = "right")
AND b.FirstName = "Solveig" AND v.VocalType = "lead";

-- Q4. Find the total number of different instruments ‘Anne-Marit’ played on Katzenjammer songs.

SELECT COUNT(DISTINCT i.Instrument)
FROM instruments i
INNER JOIN band b
ON b.BandId = i.Bandmate
WHERE b.FirstName = "Anne-Marit";

-- Q5. List all the instruments that both ‘Marianne’ and ‘Turid’ played on (possibly different)
-- Katzenjammer songs.

SELECT DISTINCT Instrument
FROM instruments i
INNER JOIN band b
ON b.BandId = i.Bandmate
WHERE b.FirstName = "Marianne" OR b.FirstName = "Turid";

-- Q6. Find how many different performers played ‘guitar’.

SELECT COUNT(DISTINCT b.FirstName)
FROM instruments i
INNER JOIN band b
ON b.BandId = i.Bandmate
WHERE i.Instrument = "guitar";

-- Q7. Find on how many songs at least two performers played the same instrument.

SELECT COUNT(*)
FROM instruments i
INNER JOIN instruments i2
ON i.Song = i2.Song
INNER JOIN instruments i3
ON i.Song = i3.Song
INNER JOIN instruments i4
ON i.Song = i4.Song
WHERE i.Bandmate = 1 AND i2.Bandmate = 2 AND i3.Bandmate = 3 AND i4.Bandmate = 4
AND (i.Instrument = i2.Instrument OR i.Instrument = i3.Instrument
   OR i.Instrument = i4.Instrument OR i2.Instrument = i3.Instrument
   OR i2.Instrument = i4.Instrument OR i3.Instrument = i4.Instrument);

-- Q8. Find how many times the lead vocalist on a song played ‘bass balalaika’.

SELECT COUNT(*)
FROM instruments i
INNER JOIN vocals v
ON i.Song = v.Song AND i.Bandmate = v.Bandmate
WHERE v.VocalType = "lead" AND i.Instrument = "bass balalaika";
