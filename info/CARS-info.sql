-- 1. Find all Renaults (‘renault’) in the database. For each, report the name and the year. Sort output by year.
SELECT Description Name, YearMade
FROM carNames NATURAL JOIN carsData
WHERE Model = "renault"
ORDER BY YearMade;

-- 2. Find all cars produced by ‘Volvo’ between 1977 and 1981 (inclusive). Report the name of the car and the year it was produced, sort output in ascending order by the year.
SELECT Description, YearMade
FROM carNames NATURAL JOIN carsData
WHERE Model = "volvo" AND YearMade BETWEEN 1977 AND 1981
ORDER BY YearMade ASC;

-- 3. Report all Asian automakers. Output the full name of the automaker and the country of origin sorted alphabetically by the full name of the automaker.
SELECT FullName, c1.Name
FROM (countries c1 JOIN continents c2 ON c1.Continent = c2.Id) JOIN carMakers m ON c1.Id = m.Country
WHERE c2.Name = "asia";

-- 4. Find all non-four cylinder cars produced in 1980 that have fuel economy better than 20 MPG and that accelerate to 60 mph faster than in 15 seconds. Report the name of the car and the full name of the automaker.
SELECT Description Name, FullName
FROM carMakers m JOIN carNames n ON m.Maker = n.Model
WHERE n.Id IN(SELECT Id
            FROM carsData
            WHERE MPG > 20 AND Accelerate < 15 AND cylinders != 4);

SELECT *
FROM carNames
WHERE Id IN(SELECT Id FROM carsData WHERE MPG > 20 AND ACCELERATE < 15 AND cylinders != 4)

SELECT *
FROM carNames n NATURAL JOIN carsData d JOIN carMakers ON Model = Maker
WHERE MPG > 20 AND Accelerate < 15 AND cylinders != 4;

SELECT Description Model, FullName Maker
FROM carNames n, carMakers m
WHERE n.Id IN(SELECT Id FROM carsData WHERE MPG > 20 AND ACCELERATE < 15 AND cylinders != 4)

SELECT *
FROM (SELECT Id FROM carsData d WHERE MPG > 20 AND ACCELERATE < 15 AND cylinders != 4) A JOIN carNames n ON A.Id = n.Id JOIN carMakers m ON Model = m.Maker;


-- 5. Find all non-European car makers which produced at least one light (weight less than 2000lbs) car between 1979 and 1981 (inclusively). Output the full name of the company and its home country. Each company should be reported just once.
-- 6. For each ‘saab’ released after 1978, compute the ratio between the weight of the car and its number of horsepowers. Report the full name of the car, the year it was produced and the ratio sorted in descending order by the ratio.
