-- Jett Moy             Chris Creber
-- jlmoy@calpoly.edu    ccreber@calpoly.edu

-- 1

SELECT Campus
FROM campuses
WHERE County = "Los Angeles"
ORDER BY County;

-- 2

SELECT d.YR Year, Degrees
FROM degrees d
   JOIN campuses c
      ON c.Id = d.CampusId
WHERE d.YR BETWEEN 1994 AND 2000 AND c.Campus = "California Maritime Academy"
ORDER BY d.YR;

-- 3

SELECT Campus,  d.Name Discipline, UGrad, Grad
FROM discEnr de
   JOIN disciplines d
      ON d.Id = de.DiscId
   JOIN campuses c
      ON c.Id = de.CampusId
WHERE d.Name IN("Mathematics", "Engineering", "Computer and Info. Sciences")
   AND Campus LIKE "%Polytechnic%" AND de.YR = 2004
ORDER BY Campus, Discipline;

-- 4

SELECT Campus, ag.Grad AgrGrad, bio.Grad BioGrad
FROM campuses c
   JOIN
   ((discEnr ag
      JOIN disciplines d
         ON d.Id = ag.DiscId AND d.Name = "Agriculture")
   JOIN
   (discEnr bio
      JOIN disciplines di
         ON bio.DiscId = di.Id AND di.Name = "Biological Sciences")
   ON ag.CampusId = bio.CampusId)
   ON c.Id = ag.CampusId AND c.Id = bio.CampusId
ORDER BY ag.Grad DESC;


-- 5

SELECT Campus, Name Discipline
FROM discEnr de
   JOIN campuses c
      ON de.CampusId = c.Id
   JOIN disciplines d
      ON de.DiscId = d.Id
WHERE de.YR = 2004 AND Grad > 3 * UGrad
ORDER BY Campus, Discipline;

-- 6

SELECT e.YR, f.Fee * e.FTE TotalCollected, (f.Fee * e.FTE)/fa.FTE PerFaculty
FROM fees f
   JOIN enrollments e
      ON f.YR = e.YR AND f.CampusId = e.CampusId
   JOIN campuses c
      ON f.CampusId = c.Id
   JOIN faculty fa
      ON e.YR = fa.YR AND fa.CampusId = c.Id
WHERE Campus = "Fresno State University" AND e.YR BETWEEN 2002 AND 2004
ORDER BY e.YR;

-- 7

SELECT Campus, e.FTE Students, f.FTE Faculty, e.FTE/f.FTE Ratio
FROM enrollments e
   JOIN faculty f
      ON e.CampusId = f.CampusId AND e.YR = f.YR
   JOIN campuses c
      ON c.Id = e.CampusId
WHERE e.FTE > (SELECT FTE
               FROM enrollments e
                  JOIN campuses c
                     ON c.Id = e.CampusId
               WHERE c.Campus = "San Jose State University"
                  AND e.YR = 2003)
      AND e.YR = 2003
ORDER BY Ratio ASC;
