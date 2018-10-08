--  LastName : last name of the student
-- FirstName : first name of the student
--     Grade : grade the student attends
-- Classroom : classroom the student is assigned to
CREATE TABLE students (
   lastName VARCHAR(13),
   firstName VARCHAR(14),
   grade TINYINT UNSIGNED,
   classroom SMALLINT UNSIGNED
);

--  LastName : last name of the teacher
-- FirstName : first name of the teacher
-- Classroom : classroom the teacher is assigned to
CREATE TABLE teachers (
   lastName VARCHAR(11),
   firtName VARCHAR(12),
   classroom SMALLINT UNSIGNED
);
