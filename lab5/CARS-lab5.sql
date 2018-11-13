1. Find all cars made after 1980 with gas mileage better than the 1982 ‘honda civic’.
   Reportfull name of the car, year it was made and the name of the manufacturer. Sort output in descending order by gas mileage.

SELECT *
FROM carNames n
   NATURAL JOIN carsData d
WHERE yearMade > 1980;

2. Find the average, maximum, and minimum horsepower for 4-cylinder vehicles manufactured by ‘renault’ between 1971 and 1976 inclusive.

SELECT AVG(MPG) Average, MAX(MPG) Maximum, MIN(MPG) Minimum
FROM carsData
   NATURAL JOIN carNames
WHERE Model = "renault" AND YearMade BETWEEN 1971 AND 1976 AND Cylinders = 4;

3. Find how many cars produced in 1971 had better acceleration than a 1972 ‘volvo 145e (sw)’. Report just the number.

SELECT COUNT(*) Count
FROM carsData
WHERE YearMade = 1971
   AND Accelerate < (SELECT Accelerate
                     FROM carNames
                        NATURAL JOIN carsData
                     WHERE Description = "volvo 145e (sw)");

4. Find how many different car manufacturers produced a vehicle heavier than 4000 lbs.

SELECT COUNT(DISTINCT FullName) NumMakers
FROM carsData d
   NATURAL JOIN carNames n
   JOIN modelList ml
      ON n.Model = ml.Model
   JOIN carMakers m
      ON ml.Maker = m.Id
WHERE Weight > 4000;
