-- Christopher Creber
-- ccreber@calpoly.edu

-- 1. (no subquery) For each campus in ‘LA’ and ‘Orange’ counties report the total number of
-- degrees granted between 1998 and 2002 (inclusive). Sort the output in descending order by the
-- number of degrees.

SELECT c.Campus, SUM(d.Degrees) totalDegrees
FROM campuses c
INNER JOIN degrees d
ON c.Id = d.CampusId
WHERE d.YR >= 1998 AND d.YR <= 2002 AND (c.County = 'Los Angeles' OR c.County = 'Orange')
GROUP BY c.Campus
ORDER BY totalDegrees DESC;

-- 2. (no subquery) For each campus that had more than 20,000 enrolled students in 2004 report the
-- number of disciplines for which the campus had non-zero graduate enrollment. Sort the output
-- in alphabetical order by the name of the campus. (This query should exclude campuses that
-- had no graduate enrollment at all).

SELECT c.Campus, COUNT(dis.Name)
FROM campuses c
INNER JOIN discEnr disE
ON c.Id = disE.CampusId
INNER JOIN disciplines dis
ON dis.Id = disE.DiscId
INNER JOIN enrollments e
ON e.CampusId = c.Id AND e.CampusId = disE.CampusId AND e.YR = disE.YR
WHERE e.enrolled > 20000 AND disE.YR = 2004 AND disE.UGrad + disE.Grad > 0
GROUP BY c.Campus;

-- 3. Find the campus with the largest enrollment in 2000. Output the name of the campus and the
-- total undergraduate enrollment.

SELECT c.Campus, e.enrolled
FROM campuses c
INNER JOIN enrollments e
ON e.CampusId = c.Id
WHERE e.YR = 2000 AND e.enrolled >= ALL (SELECT e.enrolled
FROM campuses c
INNER JOIN enrollments e
ON e.CampusId = c.Id
WHERE e.YR = 2000);


-- 4. Find the university that granted the largest total number of degrees per year over its entire
-- recorded history. Report the name of the university and the total number of degrees.

SELECT c.Campus, SUM(d.Degrees)
FROM campuses c
INNER JOIN degrees d
ON c.Id = d.CampusId
GROUP BY c.Campus
HAVING SUM(d.Degrees) >= ALL (SELECT SUM(d.Degrees)
FROM campuses c
INNER JOIN degrees d
ON c.Id = d.CampusId
GROUP BY c.Campus);



-- 5. Find the university with the best (smallest) student-to-faculty ratio in 2003. Report the name
-- of the campus and the student-to-faculty ratio. Use FTE numbers for the enrollment.

SELECT c.Campus, MIN(e.enrolled / f.FTE)
FROM campuses c
INNER JOIN enrollments e
ON c.Id = e.CampusId
INNER JOIN faculty f
ON c.Id = f.CampusId AND f.CampusId = e.CampusId AND e.YR = f.YR
WHERE e.YR = 2003
GROUP BY c.Campus
HAVING MIN(e.enrolled / f.FTE) <= ALL (SELECT MIN(e.FTE / f.FTE)
FROM campuses c
INNER JOIN enrollments e
ON c.Id = e.CampusId
INNER JOIN faculty f
ON c.Id = f.CampusId AND f.CampusId = e.CampusId AND e.YR = f.YR
WHERE e.YR = 2003
GROUP BY c.Campus);

-- 6. For each campus, report the year of the best student-to-faculty ratio, together with the ratio
-- itself. Sort the output in alphabetical order by campus name (use FTE numbers to compute the
-- ratios).

SELECT c.Campus, e.YR, MIN(e.enrolled / f.FTE)
FROM campuses c
INNER JOIN enrollments e
ON c.Id = e.CampusId
INNER JOIN faculty f
ON c.Id = f.CampusId AND f.CampusId = e.CampusId AND e.YR = f.YR
GROUP BY c.Campus, e.YR
HAVING MIN(e.enrolled / f.FTE) <= ALL (SELECT MIN(e.FTE / f.FTE)
FROM campuses c2
INNER JOIN enrollments e
ON c2.Id = e.CampusId
INNER JOIN faculty f
ON c2.Id = f.CampusId AND f.CampusId = e.CampusId AND e.YR = f.YR
WHERE c.Campus = c2.Campus
GROUP BY c2.Campus);

-- 7. For each year (for which the data is available) report the total number of campuses in which
-- student-to-faculty ratio became worse (i.e. more students per faculty) as compared to the previous
-- year. Report in chronological order by campus.

-- Not done
SELECT c.Campus, e.YR, COUNT(c.Campus)
FROM campuses c
INNER JOIN enrollments e
ON c.Id = e.CampusId
INNER JOIN faculty f
ON c.Id = f.CampusId AND f.CampusId = e.CampusId AND e.YR = f.YR
GROUP BY c.Campus, e.YR
HAVING MIN(e.enrolled / f.FTE) > (SELECT MIN(e1.FTE / f.FTE)
FROM campuses c1
INNER JOIN enrollments e1
ON c1.Id = e1.CampusId
INNER JOIN faculty f
ON c1.Id = f.CampusId AND f.CampusId = e1.CampusId AND e1.YR = f.YR
WHERE c.Campus = c1.Campus AND e.YR - e1.YR = 1
GROUP BY e.YR)
ORDER BY e.YR, c.Campus;
