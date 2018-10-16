-- CARS MODIFY

-- 1
DELETE FROM cars_data
   WHERE NOT ((cylinders = 8 AND cylinders IS NOT NULL AND accelerate < 10.0) OR
      ((year = 1979 OR year = 1980) AND mpg >= 20) OR
      (mpg >= 26 AND horsepower > 110 AND mpg IS NOT NULL AND horsepower IS NOT NULL));

-- SELECT * FROM cars_data
--    WHERE ((cylinders = 8 AND accelerate < 10.0) OR
--       ((year = 1979 OR year = 1980) AND mpg >= 20) OR
--       (mpg >= 26 AND horsepower > 110));

-- 2
SELECT * FROM cars_data ORDER BY year, id;

-- 3
ALTER TABLE cars_data
   DROP edispl,
   DROP horsepower,
   DROP weight;

-- 4
DELETE FROM cars_data
   WHERE (cylinders <= 5);

-- 5
SELECT * FROM cars_data ORDER BY year, id;
