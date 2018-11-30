-- Christopher Creber
-- ccreber@calpoly.edu

-- 1. (no subquery) Report how many different unique instruments each performer plays on songs
-- from ‘Le Pop’. Sort the output by the first name of the performers.

SELECT b.FirstName, COUNT(DISTINCT i.Instrument)
FROM albums a
INNER JOIN tracklist t
ON a.AId = t.AId
INNER JOIN instruments i
ON t.Song = i.Song
INNER JOIN band b
ON i.Bandmate = b.BandId
WHERE a.Title = "Le Pop"
GROUP BY b.FirstName
ORDER BY b.FirstName;

-- 2. (no subquery) For each performer, report the number of times they played more than one
-- instrument on the same song. Sort output in alphabetical order by first name of the performer
-- .

-- Not complete
SELECT b.FirstName, COUNT(b.FirstName)
FROM instruments i
INNER JOIN band b
ON i.Bandmate = b.BandId
GROUP BY i.Song, i.Bandmate
HAVING COUNT(i.Instrument) > 1
ORDER BY b.FirstName;

-- 3. Report the title (or titles) of the song(s) that involved the largest number of instruments played
-- by all performers combined (if there are multiple songs, report the titles in alphabetical order).

SELECT s.Title, COUNT(*)
FROM songs s
INNER JOIN instruments i
ON s.SongId = i.Song
GROUP BY i.Song
HAVING COUNT(*) >= ALL (SELECT COUNT(*)
FROM songs s
INNER JOIN instruments i
ON s.SongId = i.Song
GROUP BY i.Song)
ORDER BY s.Title;

-- 4. Find all instruments that ONLY ‘Anne-Marit’ played. Report the instruments in alphabetical
-- order.

SELECT DISTINCT i.Instrument
FROM instruments i
INNER JOIN band b
ON i.Bandmate = b.BandId
WHERE b.FirstName = "Anne-Marit"
AND i.Instrument NOT IN (SELECT DISTINCT i2.Instrument
FROM instruments i2
INNER JOIN band b2
ON i2.Bandmate = b2.BandId
WHERE b2.FirstName != "Anne-Marit")
ORDER BY i.Instrument;

-- 5. Report the first name of the performer who played the largest number of different instruments.

SELECT b.FirstName, COUNT(DISTINCT i.Instrument)
FROM instruments i
INNER JOIN band b
ON i.Bandmate = b.BandId
GROUP BY b.FirstName
HAVING COUNT(DISTINCT i.Instrument) >= ALL (SELECT COUNT(DISTINCT i.Instrument)
FROM instruments i
INNER JOIN band b
ON i.Bandmate = b.BandId
GROUP BY b.FirstName);

-- 6. Which instrument(s) was/were played on the largest number of songs? Report just the names
-- of the instruments (note, you are counting the number of songs on which an intrument was
-- played—make sure to not count two different performers playing the same instrument on the
-- same song twice).

-- Not good waaayyy off
SELECT i.Instrument
FROM (SELECT i2.Song, i2.Instrument
FROM instruments i2
WHERE Bandmate = 1
AND i2.Song, i2.Instrument NOT IN (SELECT i3.Song, i3.Instrument
FROM instruments i3
WHERE Bandmate = 2)) i
GROUP BY i.Instrument
