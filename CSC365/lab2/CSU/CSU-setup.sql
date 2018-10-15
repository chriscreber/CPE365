-- Christopher Creber, Jett Moy
-- ccreber@calpoly.edu

-- Id, Campus, Location, County, Year
--
--     Id : unique identifier for each campus
-- Campus : the name of each campus (e.g., "Sonoma State University")
-- Location : city/town where the campus is located
-- County : county where the campus is located
--   Year : year the campus opened (not necessarily as part of CSU)
CREATE TABLE IF NOT EXISTS Campuses (
   id TINYINT UNSIGNED,
   campus VARCHAR(57),
   location VARCHAR(17),
   county VARCHAR(17),
   year SMALLINT UNSIGNED,
   PRIMARY KEY (id, campus)
);

-- Campus, Year, CampusFee
--
-- Campus  : unique identifier of campus (see Campuses.Id)
--  Year  : academic year
-- CampusFee : student fee assessed by campus (not full tuition)
CREATE TABLE IF NOT EXISTS fees (
   campus TINYINT UNSIGNED,
   year SMALLINT UNSIGNED,
   fee SMALLINT UNSIGNED,
   PRIMARY KEY (campus),
   FOREIGN KEY (campus) REFERENCES Campuses(id)
);

--      Year, Campus, Degrees
--
--       Year : academic year
--     Campus : unique identifier of campus (see Campuses.Id)
--    Degrees : number of undergraduate degrees conferred
CREATE TABLE IF NOT EXISTS degrees (
   year SMALLINT UNSIGNED,
   campus TINYINT UNSIGNED,
   degrees INT UNSIGNED,
   PRIMARY KEY (campus),
   FOREIGN KEY (campus) REFERENCES Campuses(id)
);

--     Id, Name
--
--          Id : unique identifier of the academic discipline
--        Name : name of the discipline (e.g., "Engineering")
CREATE TABLE IF NOT EXISTS disciplines (
   d_id TINYINT UNSIGNED,
   discipline VARCHAR(29) UNIQUE,
   PRIMARY KEY (d_id),
   FOREIGN KEY (d_id) REFERENCES Campuses(id)
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
   campus TINYINT UNSIGNED,
   discipline TINYINT UNSIGNED,
   year SMALLINT UNSIGNED,
   undergraduates INT UNSIGNED,
   graduates INT UNSIGNED,
   PRIMARY KEY (campus),
   FOREIGN KEY (campus) REFERENCES Campuses(id),
   FOREIGN KEY (discipline) REFERENCES disciplines(d_id)
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
   campus TINYINT UNSIGNED,
   year SMALLINT UNSIGNED,
   total INT UNSIGNED,
   fullTime INT UNSIGNED,
   PRIMARY KEY (campus),
   FOREIGN KEY (campus) REFERENCES Campuses(id)
);

--        Campus, Year, Faculty
--
-- 	 Campus : unique identifier of campus (see Campuses.Id)
--            Year : academic year
--         Faculty : number of full-time equivalent faculty lines
CREATE TABLE IF NOT EXISTS faculty (
   campus TINYINT UNSIGNED,
   year SMALLINT UNSIGNED,
   faculty INT UNSIGNED,
   PRIMARY KEY (campus),
   FOREIGN KEY (campus) REFERENCES Campuses(id)
);
