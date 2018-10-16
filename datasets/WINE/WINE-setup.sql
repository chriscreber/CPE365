-- Christopher Creber
-- ccreber@calpoly.edu

--        No : line number in the CSV file
-- Appelation: name of the appelation/AVA/grape-growing region
--     County: county (if applicable) in which the area is located
--      State: state in which the area is located
--       Area: general geographic area in which the grape-growing region is located
--      isAVA: a flag specifying whether the region is recognized as an American
--             Viticultural Area (AVA) by federal regulations.
CREATE TABLE appellations (
   id TINYINT UNSIGNED PRIMARY KEY,
   appelation VARCHAR(38),
   county VARCHAR(17),
   state VARCHAR(12),
   area VARCHAR(22),
   isAVA VARCHAR(5)
);

--    ID: unique identifier of a grape (line number in the CSV file)
-- Grape: name of the grape varietal
-- Color: color of the grape (a.k.a, color of the wine when made solely of
--        this grape)
CREATE TABLE grapes (
   id TINYINT UNSIGNED PRIMARY KEY,
   grape VARCHAR(21),
   color VARCHAR(7)
);

-- No.: unique identifier of the wine (line number in the CSV file)
--      Grape: grape varietal from which the wine is made (see grapes.Grape)
--     Winery: maker of the wine (usually a winery name)
-- Appelation: origin of the grapes (see applations.Appelation)
--      State: state of the grapes' origin (same as appelations.State)
--       Name: name of the wine
--       Year: year of the wine vintage
--      Price: price of one bottle of wine in (whole) US dollars
--      Score: Wine Spectator magazine rating of the wine on the 100 point scale
--      Cases: number of cases of the wine produced by its maker
--      Drink: drinking advice
CREATE TABLE wine (
   id SMALLINT UNSIGNED PRIMARY KEY,
   grape VARCHAR(21) REFERENCES grapes(grape),
   winery VARCHAR(32),
   appellation VARCHAR(38) REFERENCES appelations(appelation),
   state VARCHAR(12) REFERENCES appelations(state),
   name VARCHAR(51),
   year YEAR,
   price INT UNSIGNED,
   score TINYINT UNSIGNED,
   cases INT UNSIGNED,
   drink VARCHAR(5)
);
