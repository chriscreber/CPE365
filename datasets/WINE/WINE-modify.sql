-- WINE MODIFY

-- 1
ALTER TABLE wine
   DROP appellation,
   DROP name;

-- 2
DELETE FROM wine
   WHERE (grape != 'Syrah' OR score < 93);

-- 3
ALTER TABLE wine
   CHANGE COLUMN winery winery VARCHAR(15);

-- 4
ALTER TABLE wine
   ADD COLUMN Revenue INT UNSIGNED;

-- 5
UPDATE wine
   SET Revenue = cases * price * 12;

-- 6
SELECT * FROM wine
   ORDER BY Revenue;
