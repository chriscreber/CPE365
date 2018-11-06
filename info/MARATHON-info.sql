-- Christopher Creber
-- ccreber@calpoly.edu

-- Q1

SELECT RunTime, Pace, Place
FROM marathon
WHERE FirstName = "TEDDY" AND LastName = "BRASEL";

-- Q2

SELECT FirstName, LastName, RunTime, Place, GroupPlace
FROM marathon
WHERE Sex = 'F' AND Town = "QUINCY" AND State = "MA"
ORDER BY Place;

-- Q3

SELECT FirstName, LastName, Town, RunTime
FROM marathon
WHERE Sex = 'F' AND Age = 37 AND State = 'CT'
ORDER BY RunTime;

-- Q4

SELECT DISTINCT BibNumber
FROM marathon
ORDER BY BibNumber;

-- Q5

SELECT m1.FirstName, m1.LastName, m2.FirstName, m2.LastName, m1.AgeGroup, m1.Sex
FROM marathon m1, marathon m2
WHERE m1.GroupPlace = 1 AND m2.GroupPlace = 2 AND m1.AgeGroup = m2.AgeGroup
ORDER BY Sex ASC, AgeGroup ASC;
