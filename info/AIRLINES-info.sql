-- Christopher Creber
-- ccreber@calpoly.edu

-- Q1

SELECT DISTINCT al.Airline, al.Abbr
FROM airports ap, airlines al, flights f
WHERE f.Source = "AXX" AND f.Airline = al.Id AND f.Source = ap.Code
ORDER BY al.airline;

-- Q2

SELECT f.FlightNo, ap.Code, ap.Name, f.Airline
FROM airports ap, airlines al, flights f
WHERE f.Source = "AXX" AND al.Abbr = "Northwest" AND f.Airline = al.Id AND f.Source = ap.Code
ORDER BY f.flightNo;

-- Q3

SELECT f.FlightNo AS First_FlightNo, f2.FlightNo AS Second_FlightNo, f2.Destination, ap.Name
FROM flights f, flights f2, airlines al, airports ap
WHERE f.Source = "AXX" AND f.Destination != "AXX" AND f2.Destination != "AXX" AND f.Destination = f2.Source
AND al.Abbr = "Northwest" AND al.Id = f.Airline AND al.Id = f2.Airline
AND ap.Code = f2.Destination
ORDER BY f2.Airline;

-- Q4 -- Printing X,Y and Y,X

SELECT DISTINCT ap.Name, ap2.Name
FROM airlines al, airlines al2, flights f, flights f2, airports ap, airports ap2
WHERE al.Abbr = "Frontier" AND al2.Abbr = "JetBlue"
AND al.Id = f.Airline AND al2.Id = f2.Airline
AND f.Source = f2.Source AND f.Destination = f2.Destination
AND f.Source = ap.Code AND f2.Source = ap.Code
AND f.Destination = ap2.code AND f2.Destination = ap2.code
AND f.Source < f.Destination;

-- Q5

SELECT DISTINCT ap.code
FROM flights f, flights f2, flights f3, flights f4, flights f5, airlines al1, airlines al2, airlines al3, airlines al4, airlines al5, airports ap
WHERE (al1.Abbr = "Delta" AND al2.Abbr = "USAir"
   AND al3.Abbr = "UAL" AND al4.Abbr = "Southwest" AND al5.Abbr = "Frontier")
AND (f.Airline = al1.Id AND f2.Airline = al2.Id
   AND f3.Airline = al3.Id AND f4.Airline = al4.Id AND f5.Airline = al5.Id)
AND (f.Source = ap.Code OR f.Destination = ap.Code)
AND (f2.Source = ap.Code OR f2.Destination = ap.Code)
AND (f3.Source = ap.Code OR f3.Destination = ap.Code)
AND (f4.Source = ap.Code OR f4.Destination = ap.Code)
AND (f5.Source = ap.Code OR f5.Destination = ap.Code)
ORDER BY ap.code;

-- Q6

SELECT DISTINCT ap.Code
FROM airlines al, flights f, flights f2, flights f3, airports ap
WHERE al.Abbr = "Southwest"
AND al.Id = f.Airline AND al.Id = f2.Airline AND al.Id = f3.Airline
AND (ap.Code = f.Source OR f.Destination)
AND (ap.Code = f2.Source OR f2.Destination)
AND (ap.Code = f3.Source OR f3.Destination)
AND (f.flightNo != f2.flightNo AND f2.flightNo != f3.flightNo AND f.flightNo != f3.flightNo)
ORDER BY ap.Code;
