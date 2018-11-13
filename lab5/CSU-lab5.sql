-- Christopher Creber
-- ccreber@calpoly.edu
-- CSU

-- Q1
SELECT SUM(d.Degrees)
FROM degrees d
INNER JOIN campuses c
ON d.CampusId = c.Id
WHERE c.Campus = "California Polytechnic State University-San Luis Obispo";

-- Q2
SELECT MAX(f.Fee), MIN(f.Fee), AVG(f.Fee)
FROM fees f
WHERE f.YR = 2005;

-- Q3 - in just 2004? Is this ratio?
SELECT AVG(e.FTE) / AVG(f.FTE)
FROM enrollments e
INNER JOIN faculty f
ON e.CampusId = f.CampusId
AND e.YR = f.YR
WHERE e.FTE > 15000 AND e.YR = 2004;

-- Q4 - is the enroll column right?
SELECT e.YR
FROM campuses c
INNER JOIN enrollments e
ON c.Id = e.CampusId
INNER JOIN degrees d
ON e.CampusId = d.CampusId AND e.YR = d.YR
WHERE (e.Enrolled > 17000 OR d.degrees > 3500)
AND c.Campus = "California Polytechnic State University-San Luis Obispo"
ORDER BY YR;
