-- Jett Moy          Chris Creber
-- jlmoy             ccreber

-- 1

SELECT Description Name, YearMade
FROM carNames NATURAL JOIN carsData
WHERE Model = "renault"
ORDER BY YearMade;

-- 2

SELECT Description Name, YearMade
FROM carNames NATURAL JOIN carsData
WHERE Model = "volvo" AND YearMade BETWEEN 1977 AND 1981
ORDER BY YearMade ASC;

-- 3

SELECT FullName Automaker, c1.Name Country
FROM (countries c1 JOIN continents c2 ON c1.Continent = c2.Id)
   JOIN carMakers m ON c1.Id = m.Country
WHERE c2.Name = "asia"
ORDER BY FullName;

-- 4

SELECT Description Car, FullName Automaker
FROM carsData d NATURAL JOIN carNames n
   JOIN modelList m
      ON n.Model = m.Model
   JOIN carMakers man
      ON man.Id = m.Maker
WHERE MPG > 20 AND Accelerate < 15 AND Cylinders != 4 AND YearMade = 1980;


-- 5

SELECT DISTINCT man.FullName Automaker, c.Name Country
FROM carsData d NATURAL JOIN carNames n
   JOIN modelList m
      ON n.Model = m.Model
   JOIN carMakers man
      ON man.Id = m.Maker
   JOIN countries c
      ON man.Country = c.Id
   JOIN continents co
      ON c.Continent = co.Id
WHERE Weight < 2000 AND co.Name != "europe" AND YearMade BETWEEN 1979 AND 1981;

-- 6

SELECT Description Car, YearMade, Horsepower/Weight PowerToWeight
FROM carNames NATURAL JOIN carsData
WHERE Model = "saab" AND YearMade > 1978
ORDER BY PowerToWeight DESC;
