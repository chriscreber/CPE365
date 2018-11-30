-- Jett Moy            Chris Creber
-- jlmoy               ccreber

-- 1

SELECT m.Maker, MAX(MPG) MaxMPG, AVG(Accelerate) AvgAccelerate
FROM carsData d
    NATURAL JOIN carNames n
    JOIN modelList l
    ON n.Model = l.Model
    JOIN carMakers m
    ON m.Id = l.Maker
    JOIN countries c
    ON c.Id = m.Country
WHERE c.Name = "japan"
GROUP BY m.Maker
ORDER BY MaxMPG;

-- 2

SELECT m.Maker, COUNT(*) Count
FROM carsData d
    NATURAL JOIN carNames n
    JOIN modelList l
    ON n.Model = l.Model
    JOIN carMakers m
    ON m.Id = l.Maker
    JOIN countries c
    ON c.Id = m.Country
WHERE c.Name = "usa" AND Cylinders = 4 AND Weight < 4000 AND Accelerate < 14
GROUP BY m.Maker
ORDER BY Count DESC;

-- 3

SELECT Description, MPG, YearMade
FROM carsData d
    NATURAL JOIN carNames n
WHERE MPG >= ALL(SELECT MPG
                    FROM carsData NATURAL JOIN carNames
                    WHERE MPG IS NOT NULL);

-- 4

SELECT Description, YearMade
FROM carsData d
    NATURAL JOIN carNames n
WHERE MPG >= ALL(SELECT MPG
                    FROM carsData NATURAL JOIN carNames
                    WHERE MPG IS NOT NULL);

-- 5

SELECT YearMade, m.FullName, COUNT(*) Models, AVG(Weight), AVG(Accelerate)
FROM carsData d
    NATURAL JOIN carNames n
    JOIN modelList l
    ON n.Model = l.Model
    JOIN carMakers m
    ON m.Id = l.Maker
    JOIN countries c
    ON c.Id = m.Country
GROUP BY YearMade, m.FullName
HAVING AVG(Weight) >= ALL(SELECT AVG(Weight)
                    FROM carsData NATURAL JOIN carNames
                    GROUP BY YearMade)
ORDER BY YearMade;

-- SELECT YearMade, m.FullName, COUNT(*) Models, AVG(Weight), AVG(Accelerate)
-- FROM carsData d
--     NATURAL JOIN carNames n
--     JOIN modelList l
--     ON n.Model = l.Model
--     JOIN carMakers m
--     ON m.Id = l.Maker
--     JOIN countries c
--     ON c.Id = m.Country
-- GROUP BY YearMade, m.FullName
-- HAVING AVG(Weight) >= ALL(SELECT AVG(Weight)
--                     FROM carsData a
--                         NATURAL JOIN carNames b
--                         JOIN modelList c
--                         ON b.Model = c.Model
--                         JOIN carMakers d
--                         ON d.Id = c.Maker
--                     GROUP BY YearMade, FullName)
-- ORDER BY YearMade;

-- SELECT YearMade, m.FullName, COUNT(*) Models, AVG(Weight), AVG(Accelerate)
-- FROM carsData d
--     NATURAL JOIN carNames n
--     JOIN modelList l
--     ON n.Model = l.Model
--     JOIN carMakers m
--     ON m.Id = l.Maker
--     JOIN countries c
--     ON c.Id = m.Country
-- GROUP BY YearMade, m.FullName
-- HAVING AVG(Weight) >= ALL(SELECT AVG(Weight)
--                     FROM carsData NATURAL JOIN carNames
--                     GROUP BY YearMade, FullName)
-- ORDER BY YearMade;

-- MySQL bug above wouldn't allow us to complete the query

-- 6

SELECT max - min Difference
FROM
    (SELECT MAX(MPG) max
    FROM carsData
    WHERE cylinders = 8) a
    JOIN
    (SELECT MIN(MPG) min
    FROM carsData
    WHERE cylinders = 4) b;

-- 7

SELECT YearMade, IF(USCars > Rest, "US",
    IF(USCars = Rest, "tie", "Rest Of World")) MostCars
FROM
    (SELECT YearMade, COUNT(*) USCars
    FROM carsData d NATURAL JOIN carNames n
    INNER JOIN modelList l
    ON n.Model = l.Model
    INNER JOIN carMakers m
    ON m.Id = l.Maker
    INNER JOIN countries c
    ON m.Country = c.Id
    WHERE c.Name = "usa"
    GROUP BY YearMade
    HAVING YearMade BETWEEN 1972 AND 1976) a
JOIN
    (SELECT YearMade, COUNT(*) Rest
    FROM carsData d NATURAL JOIN carNames n
    INNER JOIN modelList l
    ON n.Model = l.Model
    INNER JOIN carMakers m
    ON m.Id = l.Maker
    INNER JOIN countries c
    ON m.Country = c.Id
    WHERE c.Name != "usa"
    GROUP BY YearMade
    HAVING YearMade BETWEEN 1972 AND 1976) b
USING (YearMade);
