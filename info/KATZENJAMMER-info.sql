-- Christopher Creber
-- ccreber@calpoly.edu

-- Q1 - How do I tell how they appear on the album?

SELECT s.Title
FROM songs s, albums a, tracklist t
WHERE a.Title = "Le Pop" AND a.AId = t.AId AND t.Song = s.Songid;

-- Q2

SELECT b.FirstName, i.instrument
FROM songs s, band b, instruments i
WHERE s.Songid = i.Song AND i.Bandmate = b.BandId AND s.Title = "Rock-Paper-Scissors"
ORDER BY b.FirstName;

--Q3

SELECT DISTINCT i.Instrument
FROM band b, instruments i
WHERE b.FirstName = "Anne-Marit" AND i.Bandmate = b.BandId
ORDER BY i.Instrument;

-- Q4

SELECT s.Title
FROM songs s, instruments i
WHERE s.SongId = i.Song AND i.Instrument = "ukelele"
ORDER By s.Title;

-- Q5

SELECT DISTINCT i.Instrument
FROM songs s, instruments i, band b, vocals v
WHERE b.FirstName = "Turid" AND s.SongId = i.Song AND s.SongId = v.Song
AND i.Bandmate = v.Bandmate AND b.BandId = i.Bandmate AND b.BandId = v.Bandmate
ORDER BY i.Instrument;

-- Q6

SELECT s.Title, b.FirstName, p.StagePos
FROM songs s, band b, performance p, vocals v
WHERE p.StagePos != "center" AND v.VocalType = "lead" AND s.SongId = v.Song AND s.SongId = p.Song
AND p.Bandmate = v.Bandmate AND b.BandId = p.Bandmate AND b.BandId = v.Bandmate
ORDER BY s.Title;

-- Q7

SELECT DISTINCT s.Title
FROM band b, songs s, instruments i, instruments i2, instruments i3
WHERE b.FirstName = "Anne-Marit"
AND b.BandId = i.Bandmate AND b.BandId = i2.Bandmate AND b.BandId = i3.Bandmate
AND i.Bandmate = i2.Bandmate AND i2.Bandmate = i3.Bandmate AND i.Bandmate = i3.Bandmate
AND s.SongId = i.Song AND s.SongId = i2.Song AND s.SongId = i3.Song
AND i.Song = i2.Song AND i2.Song = i3.Song AND i.Song = i3.Song
AND i.Instrument != i2.Instrument AND i2.Instrument != i3.Instrument AND i.Instrument != i3.Instrument;

-- Q8 - When I try to use as it causes a problem with my sql, I think this should be fine though

SELECT b.FirstName, b2.FirstName, b3.FirstName, b4.FirstName
FROM band b, band b2, band b3, band b4, songs s, performance p, performance p2, performance p3, performance p4
WHERE s.Title = "A Bar In Amsterdam" AND p.Song = s.SongId
AND s.SongId = p.Song AND s.SongId = p2.Song AND s.SongId = p3.Song AND s.SongId = p4.Song
AND p.StagePos = "right" AND p2.StagePos = "center" AND p3.StagePos = "back" AND p4.StagePos = "left"
AND p.Bandmate = b.BandId AND p2.Bandmate = b2.BandId AND p3.Bandmate = b3.BandId AND p4.Bandmate = b4.BandId;
