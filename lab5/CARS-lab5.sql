-- Jett Moy          Chris Creber
-- jlmoy             ccreber

-- 1

SELECT  n.Description, d.YearMade, m.FullName Manufacturer
FROM carsData d, carNames n, carsData d2, carNames n2, carMakers m, modelList l
WHERE d2.YearMade = 1982 AND d2.Id = n2.Id AND d.Id = n.Id
AND n2.Description = "honda civic"
AND d.MPG > d2.MPG AND d.YearMade > 1980
AND l.Model = n.Model AND l.Maker = m.Id
ORDER BY d.MPG DESC;

-- 2

SELECT AVG(MPG) Average, MAX(MPG) Maximum, MIN(MPG) Minimum
FROM carsData
   NATURAL JOIN carNames
WHERE Model = "renault" AND YearMade BETWEEN 1971 AND 1976 AND Cylinders = 4;

-- 3

SELECT COUNT(*) Count
FROM carsData d, carsData v, carNames n
WHERE n.Id = v.Id AND d.YearMade = 1971 AND n.Description = "volvo 145e (sw)" AND d.Accelerate < v.Accelerate;

-- 4

SELECT COUNT(DISTINCT FullName) NumMakers
FROM carsData d
   NATURAL JOIN carNames n
   JOIN modelList ml
      ON n.Model = ml.Model
   JOIN carMakers m
      ON ml.Maker = m.Id
WHERE Weight > 4000;
