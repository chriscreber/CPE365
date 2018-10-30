-- Christopher Creber
-- ccreber@calpoly.edu

-- Id, Campus, Location, County, Year
--
--     Id : unique identifier for each campus
-- Campus : the name of each campus (e.g., "Sonoma State University")
-- Location : city/town where the campus is located
-- County : county where the campus is located
--   Year : year the campus opened (not necessarily as part of CSU)
CREATE TABLE IF NOT EXISTS Campuses (
   id TINYINT UNSIGNED PRIMARY KEY,
   campus VARCHAR(57),
   location VARCHAR(17),
   county VARCHAR(17),
   year SMALLINT UNSIGNED
);

-- Campus, Year, CampusFee
--
-- Campus  : unique identifier of campus (see Campuses.Id)
--  Year  : academic year
-- CampusFee : student fee assessed by campus (not full tuition)
CREATE TABLE IF NOT EXISTS fees (
   campus TINYINT UNSIGNED REFERENCES Campuses(id),
   year SMALLINT UNSIGNED,
   fee SMALLINT UNSIGNED
);

--      Year, Campus, Degrees
--
--       Year : academic year
--     Campus : unique identifier of campus (see Campuses.Id)
--    Degrees : number of undergraduate degrees conferred
CREATE TABLE IF NOT EXISTS degrees (
   year SMALLINT UNSIGNED,
   campus TINYINT UNSIGNED REFERENCES Campuses(id),
   degrees INT UNSIGNED
);

--     Id, Name
--
--          Id : unique identifier of the academic discipline
--        Name : name of the discipline (e.g., "Engineering")
CREATE TABLE IF NOT EXISTS disciplines (
   d_id TINYINT UNSIGNED REFERENCES Campuses(id),
   discipline VARCHAR(29) UNIQUE
);

--       Campus, Discipline, Year, Undergraduate, Graduate
--
--        Campus : unique identifier of campus (see Campuses.Id)
--    Discipline : unique identifier of the academic discipline
--                (see disciplines.Id)
--          Year : academic year
-- Undergraduate : undergraduate enrollment
--      Graduate : graduate enrollment
CREATE TABLE IF NOT EXISTS discipline_enrollments (
   campus TINYINT UNSIGNED REFERENCES Campuses(id),
   discipline TINYINT UNSIGNED REFERENCES disciplines(d_id),
   year SMALLINT UNSIGNED,
   undergraduates INT UNSIGNED,
   graduates INT UNSIGNED
);

--       Campus, Year, TotalEnrollment_AY, FTE_AY
--
--             Campus : unique identifier of campus (see Campuses.Id)
--               Year : academic year
-- TotalEnrollment_AY : total number of students enrolled during given
--                      academic year
--             FTE_AY : number of full-time equivalent students enrolled
--                      during academic year
CREATE TABLE IF NOT EXISTS enrollments (
   campus TINYINT UNSIGNED REFERENCES Campuses(id),
   year SMALLINT UNSIGNED,
   total INT UNSIGNED,
   fullTime INT UNSIGNED
);

--        Campus, Year, Faculty
--
-- 	 Campus : unique identifier of campus (see Campuses.Id)
--            Year : academic year
--         Faculty : number of full-time equivalent faculty lines
CREATE TABLE IF NOT EXISTS faculty (
   campus TINYINT UNSIGNED REFERENCES Campuses(id),
   year SMALLINT UNSIGNED,
   faculty INT UNSIGNED
);
