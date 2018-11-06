-- 1. Report all campuses from ‘Los Angeles’ county. Output the full name of the campuses in alphabetical order.
SELECT Campus
FROM campuses
WHERE County = "Los Angeles"
ORDER BY County;

-- 2. For each year between 1994 and 2000 (inclusive) report the number of students who graduated from ‘California Maritime Academy’. Output the year and the number of degrees granted. Sort output by year.
SELECT d.YR Year, Degrees
FROM degrees d JOIN campuses c
   ON c.Id = d.CampusId
WHERE d.YR BETWEEN 1994 AND 2000 AND c.Campus = "California Maritime Academy"
ORDER BY d.YR;

-- 3. Report the undergraduate and graduate enrollments (as two numbers) in ‘Mathematics’, ‘Engineering’ and ‘Computer and Info. Sciences’ disciplines for both ‘Polytechnic’ universities of the CSU system in 2004. Output the name of the campus, the discipline and the number of graduate and the number of undergraduate students enrolled. Sort output by campus name, and by discipline for each campus.
SELECT Campus,  di.Name Discipline, UGrad, Grad
FROM discEnr de
   JOIN disciplines d
      ON d.Id = de.DiscId
   JOIN campuses c
      ON c.Id = de.CampusId
   JOIN disciplines di
      ON di.Id = de.DiscId
WHERE d.Name IN("Mathematics", "Engineering", "Computer and Info. Sciences")
   AND Campus LIKE "%Polytechnic%"
ORDER BY Campus, Discipline;

-- 4. Report graduate enrollments in 2004 in ‘Agriculture’ and ‘Biological Sciences’ for any university that offers graduate studies in both disciplines. Report one line per university (with the two grad. enrollment numbers in separate columns), sort universities in descending order by the number of ‘Agriculture’ graduate students.
SELECT *
FROM (discEnr de JOIN disciplines d ON d.Id = de.DiscId)
WHERE d.Name IN("Agriculture", "Biological Sciences");
-- ORDER BY DESC;

SELECT *
FROM campuses c
   JOIN discEnr de
      ON c.Id = de.CampusId
WHERE de.discId IN(1, 4);

-- 5. Find all disciplines and campuses where graduate enrollment in 2004 was at least three times higher than undergraduate enrollment. Report campus names and discipline names. Sort output by campus name, then by discipline name in alphabetical order.
SELECT Campus, Name Discipline
FROM discEnr de
   JOIN campuses c
      ON de.CampusId = c.Id
   JOIN disciplines d
      ON de.DiscId = d.Id
WHERE de.YR = 2004 AND Grad > 3 * UGrad
ORDER BY Campus, Discipline;

-- 6. Report the total amount of money collected from student fees (use the full-time equivalent enrollment for computations) at ‘Fresno State University’ for each year between 2002 and 2004 inclusive, and the amount of money collected from student fees per one full-time equivalent faculty. Output the year and the two computed numbers sorted chronologically by year.
SELECT Campus,
FROM campuses c
   JOIN enrollments e
      ON c.Id = e.CampusId
WHERE Campus = "Fresno State University" AND e.YR BETWEEN 2002 AND 2004;

-- 7. Find all campuses where enrollment in 2003 (use the FTE numbers), was higher than the 2003 enrollment in ‘San Jose State University’. Report the name of campus, the 2003 enrollment number, the number of faculty teaching that year, and the student-to-faculty ratio. Sort output in ascending order by student-to-faculty ratio.
