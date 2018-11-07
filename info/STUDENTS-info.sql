-- Jett Moy         Chris Creber
-- jlmoy            ccreber

-- 1

SELECT FirstName, LastName
FROM list
WHERE Classroom = 111
ORDER BY LastName;

-- 2

SELECT DISTINCT Classroom, Grade
FROM list
ORDER BY Classroom DESC;

-- 3

SELECT DISTINCT t.FirstName, t.LastName, t.Classroom
FROM teachers t, list l
WHERE Grade = 5 AND t.Classroom = l.Classroom
ORDER BY Classroom;

-- 4

SELECT s.FirstName, s.LastName
FROM list s
   JOIN teachers t
      ON s.Classroom = t.Classroom
WHERE t.firstName = "Otha" AND t.LastName = "Moyer"
ORDER BY s.LastName;

-- 5

SELECT DISTINCT t.FirstName, t.LastName, Grade
FROM list s JOIN teachers t ON s.Classroom = t.Classroom
WHERE Grade <= 3
ORDER BY Grade, LastName;
