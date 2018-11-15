1. Find all pairs of students with the same first name. Report each pair of students exactly once.
   Report first and last names of each of the two students, and their grades.

(SELECT FirstName
FROM list s
GROUP BY FirstName
   HAVING COUNT(*) > 1)
   ON s.
SELECT LastName, Grade
FROM list;


2. Find all first-grade students who are NOT taught by ‘OTHA MOYER’.
   Report their first and last names in alphabetical order by last name.

SELECT l.FirstName, l.LastName
FROM list l
   JOIN teachers t
      ON l.Classroom = t.Classroom
WHERE !(t.FirstName = "Otha" AND t.LastName = "Moyer") AND Grade = 1
ORDER BY LastName;

3. Report the total number of third- and fourth-graders in the school.

SELECT Grade, count(*) Students
FROM list l
   JOIN teachers t
      ON l.Classroom = t.Classroom
WHERE Grade = 3
UNION
SELECT Grade, count(*) Students
FROM list l
   JOIN teachers t
      ON l.Classroom = t.Classroom
WHERE Grade = 4;

4. Find and report the number of students taught by ‘LORIA ONDERSMA’.
SELECT count(*) Students
FROM list l
   JOIN teachers t
      ON l.Classroom = t.Classroom
WHERE t.FirstName = "Loria" AND t.LastName = "Ondersma";
