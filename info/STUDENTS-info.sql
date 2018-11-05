-- Jett Moy         Chris Creber
-- jlmoy            ccreber

-- 1 Find all students who study in classroom 111. For each student list first and last name. Sort the output by the last name of the student.
SELECT FirstName, LastName
FROM list
WHERE Classroom = 111
ORDER BY LastName;

-- 2 For each classroom report the grade that is taught in it. Report just the classroom number and the grade number. Sort output by classroom in descending order.
SELECT DISTINCT Classroom, Grade
FROM list
ORDER BY Classroom DESC;


-- 3 Find all teachers who teach fifth grade. Report first and last name of the teachers and the room number. Sort the output by room number.
SELECT t.FirstName, t.LastName, t.Classroom
FROM teachers t
WHERE Classroom IN(SELECT Classroom
                   FROM list
                   WHERE Grade = 5)
ORDER BY Classroom;

-- 4 Find all students taught by ‘OTHA MOYER’. Output first and last names of students sorted in alphabetical order by their last name.
SELECT s.FirstName, s.LastName
FROM list s JOIN teachers t ON s.Classroom = t.Classroom
WHERE t.firstName = "Otha" AND t.LastName = "Moyer"
ORDER BY s.LastName;

SELECT s.FirstName, s.LastName
FROM list s
WHERE s.Classroom IN(SELECT Classroom
                   FROM teachers
                   WHERE FirstName = "Otha" AND LastName = "Moyer")
ORDER BY s.LastName;

-- 5 For each teacher teaching grades K through 3, report the grade (s)he teaches. Each name has to be reported exactly once. Sort the output by grade and alphabetically by teacher’s last name for each grade.
SELECT DISTINCT t.FirstName, t.LastName, Grade
FROM list s JOIN teachers t ON s.Classroom = t.Classroom
WHERE Grade <= 3
ORDER BY Grade, LastName;

-- SELECT DISTINCT t.FirstName, t.LastName, s.Grade
-- FROM teachers t, list s
-- WHERE t.Classroom IN(SELECT DISTINCT Classroom FROM list WHERE grade <= 3)
-- ORDER BY s.Grade, t.LastName;
