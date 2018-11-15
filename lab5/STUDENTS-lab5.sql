-- Jett Moy                Chris Creber
-- jlmoy                   ccreber

-- 1

SELECT a.FirstName, a.LastName, a.Grade
FROM list a, list b
WHERE a.FirstName = b.FirstName AND a.LastName != b.LastName;

-- 2

SELECT l.FirstName, l.LastName
FROM list l
   JOIN teachers t
      ON l.Classroom = t.Classroom
WHERE !(t.FirstName = "Otha" AND t.LastName = "Moyer") AND Grade = 1
ORDER BY LastName;

-- 3

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

-- 4

SELECT count(*) Students
FROM list l
   JOIN teachers t
      ON l.Classroom = t.Classroom
WHERE t.FirstName = "Loria" AND t.LastName = "Ondersma";
