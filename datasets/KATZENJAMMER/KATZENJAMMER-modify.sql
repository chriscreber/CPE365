-- Christopher Creber         Jett Moy
-- ccreber@calpoly.edu        jlmoy@calpoly.edu

-- 1
-- Additional varchar length for instrument name
ALTER TABLE instruments
   MODIFY instrument VARCHAR(22);

UPDATE instruments
   SET instrument = "awesome bass balalaika"
   WHERE instrument = "bass balalaika";

UPDATE instruments
   SET instrument = "acoustic guitar"
   WHERE instrument = "guitar";

-- 2 Delete tuples that aren't played by Turid or instrument acoustic guitar
DELETE FROM instruments
   WHERE !(bandmate = 4 OR instrument = "acoustic guitar");

-- 3 Display table
SELECT *
   FROM instruments
   ORDER BY songId, bandmate;

-- 4 Add column for total album track count
ALTER TABLE albums
   ADD count INT;

-- 5 Add track counts for each album
UPDATE albums
   SET count = 13
   WHERE id = 1;

UPDATE albums
   SET count = 12
   WHERE id = 2;

UPDATE albums
   SET count = 19
   WHERE id = 3;

UPDATE albums
   SET count = 11
   WHERE id = 4;

-- 6 Display table
SELECT *
   FROM albums
   ORDER BY year;
