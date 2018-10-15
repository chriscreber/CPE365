-- Christopher Creber, Jett Moy
-- ccreber@calpoly.edu

-- ContId : unique identifier of the continent
     -- Continent : name of the continent
CREATE TABLE IF NOT EXISTS continents (
   contId INT UNSIGNED,
   continent VARCHAR(57),
   PRIMARY KEY (contId)
   -- FOREIGN KEY (campus) REFERENCES Campuses(id)
);

-- CountryId : unique identifier of the country
   -- CountryName : name of the country
     -- Continent : unique identifier of the continent the country is on
                 -- (see continents.ContId)
CREATE TABLE IF NOT EXISTS countries (
   countryId INT UNSIGNED,
   countryName VARCHAR(57),
   continent INT UNSIGNED,
   PRIMARY KEY (countryId),
   FOREIGN KEY (continent) REFERENCES continents(contId)
);

-- Id : unique identifier of the car maker
-- Maker : short nickname for the car maker
-- FullName : full name of the car maker
-- Country : Id of the home country of the maker (see countries.CountryId)
CREATE TABLE IF NOT EXISTS car_makers (
   id INT UNSIGNED,
   maker VARCHAR(57),
   fullName VARCHAR(57),
   country INT UNSIGNED,
   PRIMARY KEY (id),
   FOREIGN KEY (country) REFERENCES countries(countryId)
);

-- ModelId : unique identifier of the car model
--      Maker : unique identifier of the car maker (see car-makers.id)
--      Model : name of the car model (also unique)
CREATE TABLE IF NOT EXISTS model_list (
   modelId INT UNSIGNED,
   maker INT UNSIGNED,
   model VARCHAR(57) UNIQUE,
   PRIMARY KEY (modelId),
   FOREIGN KEY (maker) REFERENCES car_makers(id)
);

-- MakeId : unique identifier of the car make
-- Model : unique name of the car model (see model-list.Model)
-- MakeDescription : description (name) of the car make
CREATE TABLE IF NOT EXISTS car_names (
   makeId INT UNSIGNED,
   model VARCHAR(57),
   makeDescription VARCHAR(100),
   PRIMARY KEY (makeId),
   FOREIGN KEY (model) REFERENCES model_list(model)
);

-- Id : unique identifier of the car make (see car-names.MakeId)
--            MPG : milage per gallon
--      Cylinders : number of cylinders
--         Edispl : engine displacement volume in cubic inches
--     Horsepower : power of the engine in horsepowers
--         Weight : weight of the car in lbs
--     Accelerate : time to accelerate from 0 to 60mph in seconds (possibly
-- 		 with fractions of a second)
--           Year : year the car was made
CREATE TABLE IF NOT EXISTS cars_data (
   id INT UNSIGNED,
   mpg INT UNSIGNED,
   cylinders INT UNSIGNED,
   edispl INT UNSIGNED,
   horsepower INT UNSIGNED,
   weight INT UNSIGNED,
   accelerate DOUBLE,
   year INT UNSIGNED,
   -- PRIMARY KEY (campus),
   FOREIGN KEY (id) REFERENCES car_names(makeId)
);
