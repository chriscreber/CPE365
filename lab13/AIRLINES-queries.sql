-- Jett Moy            Chris Creber
-- jlmoy               ccreber

-- 1

SELECT source, Name
FROM flights f
    JOIN airports a
        ON a.Code = f.source
GROUP BY source, Name
HAVING 17 = COUNT(source)
ORDER BY Code;

-- 2

SELECT COUNT(DISTINCT f1.Source) NumAirports
FROM flights f1, flights f2
WHERE f1.Source != "ANP" AND f1.Destination = f2.Source
    AND f2.Destination = "ANP";

-- 3

SELECT COUNT(DISTINCT f1.Source) NumAirports
FROM flights f1, flights f2
WHERE f1.Source != "ATE" OR (f1.Destination = f2.Source
    AND f2.Destination = "ATE");


-- 4

SELECT x.Airline, COUNT(*) NumAirtports
FROM
    (SELECT a.Airline, Source
    FROM airlines a
    INNER JOIN flights f
    ON a.Id = f.Airline
    GROUP BY a.Airline, Source
    HAVING COUNT(source) > 1) x
GROUP BY x.Airline
ORDER BY NumAirtports;
