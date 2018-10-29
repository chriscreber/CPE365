-- Jett Moy                   Chris Creber
-- jlmoy@calpoly.edu          ccreber@calpoly.edu

-- 2 Remove all flights not to or from airport AKI
DELETE FROM flights WHERE !(source = "AKI" OR dest = "AKI");

-- 3 Add 2000 to flightNo for airlines not AirTran, Continental, or Virgin
UPDATE flights
   SET flightNo = flightNo + 2000
   WHERE !(airline = 7 OR airline = 10 OR airline = 12);

-- 4 All even-numbered flights +1, odd -1 for non AirTran, Continental, or Virgin airline flights
UPDATE flights
   SET flightNo = IF(MOD(flightNo, 2) = 0, flightNo + 1, flightNo - 1)
   WHERE !(airline = 7 OR airline = 10 OR airline = 12);

-- 5 Replace airlines to Continental except for flights by AirTran or Virgin
UPDATE flights
   SET airline = 7
   WHERE !(airline = 7 OR airline = 10 OR airline = 12);

-- 6 Display table
SELECT *
   FROM flights
   ORDER BY airline, flightNo;
