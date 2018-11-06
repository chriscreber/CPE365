-- Christopher Creber
-- ccreber@calpoly.edu

-- Q1

SELECT DISTINCT al.airline, al.abbreviation
FROM airports ap, airlines al, flights f
WHERE f.source = "AXX" AND f.airline = al.id AND f.source = ap.code
ORDER BY al.airline;

-- Q2

SELECT f.flightNo, ap.code, ap.name, f.airline
FROM airports ap, airlines al, flights f
WHERE f.source = "AXX" AND al.airline = "Northwest Airlines" AND f.airline = al.id AND f.source = ap.code
ORDER BY f.flightNo;

-- Q3

-- NOT SURE

-- Q4

-- NOT SURE

-- Q5

-- SELECT DISTINCT ap.code
-- FROM airports ap, flights ap1, flights ap2, flights ap3, flights ap4, flights ap5
-- WHERE (ap1.source = "Delta" AND ap2.source = "USAir"
--    AND ap3.source = "UAL" AND ap4.source = "Southwest" AND ap5.source = "Frontier")
-- OR (ap1.dest = "Delta" AND ap2.dest = "USAir"
--    AND ap3.dest = "UAL" AND ap4.dest = "Southwest" AND ap5.dest = "Frontier");
