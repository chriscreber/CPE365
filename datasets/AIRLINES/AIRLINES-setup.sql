-- Christopher Creber
-- ccreber@calpoly.edu

  --         Id   : unique identifier of the airline
  --      Airline : full name of the airline
  -- Abbreviation : abbreviated name of the airline
  --      Country : country of the airline
CREATE TABLE airlines (
   id TINYINT UNSIGNED PRIMARY KEY,
   airline VARCHAR(22),
   abbreviation VARCHAR(13),
   country VARCHAR(5)
);

--         City  : location of the airport
--   AirportCode : unique three-letter airport code
-- ,  AirportName : name of the airport
--       Country : country of the airport
-- CountryAbbrev : abbreviation of the country
CREATE TABLE airports (
   city VARCHAR(22),
   code VARCHAR(5) PRIMARY KEY UNIQUE,
   name VARCHAR(46),
   country VARCHAR(16),
   c_abbrev VARCHAR(5)
);

--       Airline : airline that manages the flight
--      FlightNo : flight number (unique for each airline, may repeat
--                 for different airlines)
-- SourceAirport : Code for the airport from which the flight originates
--                 (see airports100.AirportCode)
--   DestAirport : Code for the airport at which the flight terminates
CREATE TABLE flights (
  airline TINYINT UNSIGNED REFERENCES airlines(id),
  flightNo SMALLINT UNSIGNED,
  source VARCHAR(5) REFERENCES airports(code),
  dest VARCHAR(5) REFERENCES airports(code)
);
