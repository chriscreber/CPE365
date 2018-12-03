-- Jett Moy               Chris Creber
-- jlmoy                  ccreber

-- 1

SELECT Grade, COUNT(DISTINCT Classroom) Classrooms, COUNT(Grade) Students
FROM list l
    JOIN teachers t
    USING (Classroom)
GROUP BY Grade
ORDER BY Classrooms DESC, Grade;

-- 2

SELECT Classroom, MAX(LastName) LastName
FROM list l
WHERE Grade = 4
GROUP BY Classroom;

-- 3

SELECT t.FirstName, t.LastName, COUNT(*) Students
FROM teachers t
JOIN list
USING (Classroom)
GROUP BY t.FirstName, t.LastName
ORDER BY Students DESC
LIMIT 1;

-- 4

SELECT Grade, COUNT(*) Count
FROM (
    SELECT Grade
    FROM list
    WHERE (LastName LIKE 'A%') OR (LastName LIKE 'B%') OR (LastName LIKE 'C%'))x
GROUP BY Grade
ORDER BY Count DESC
LIMIT 1;

-- 5

SELECT Classroom, COUNT(*) Students
FROM list
GROUP BY Classroom
HAVING Students <
            (SELECT AVG(Students)
            FROM
                (SELECT COUNT(*) Students
                FROM list
                GROUP BY Classroom) y)
ORDER BY Classroom ASC;

-- 6

SELECT a.Classroom, b.Classroom, a.Students
FROM
    (SELECT Classroom, COUNT(*) Students
    FROM list
    GROUP BY Classroom) a
    JOIN
    (SELECT Classroom, COUNT(*) Students
    FROM list
    GROUP BY Classroom) b
    ON a.Students = b.Students AND a.Classroom < b.Classroom
ORDER BY Students;
