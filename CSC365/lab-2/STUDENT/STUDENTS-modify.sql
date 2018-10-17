ALTER TABLE students
ADD gpa DOUBLE;

DELETE FROM students
WHERE grade NOT BETWEEN 5 AND 6;

INSERT INTO teachers
VALUES ("AP-MAWR", "GAWAIN", 120);

UPDATE students
SET classroom = 120
WHERE lastName = "FLACHS" AND firstName = "JEFFRY" OR lastName = "HUANG" AND firstName = "TAWANNA" OR lastName = "GRUNIN" AND firstName = "EMILE";

UPDATE students
SET gpa = 3.25
WHERE grade = 6;

UPDATE students
SET gpa = 2.9
WHERE grade = 5 AND classroom = 109;

UPDATE students
SET gpa = 3.5
WHERE grade = 5 AND classroom = 120;

UPDATE students
SET gpa = 4.0
WHERE lastName = "MACIAG" AND firstName = "CHET";

UPDATE students
SET gpa = ROUND(gpa + 0.3, 2)
WHERE lastName = "GERSTEIN" AND firstName = "AL";

UPDATE students
SET gpa = ROUND(gpa * 1.1, 2)
WHERE lastName = "HUANG" AND firstName = "TAWANNA" OR lastName = "JAGNEUX" AND firstName = "ELVIRA";

SELECT * FROM students
ORDER BY gpa, grade, lastName;

SELECT *
FROM teachers;
