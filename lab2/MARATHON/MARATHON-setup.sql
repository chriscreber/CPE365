-- Place : overall place of the participant in the race
-- Time : time the participant took to run the race (hh:mi:ss)
-- Pace : participant's pace in the race (mi:ss)
-- GroupPlace : participant's place within his/her age and gender group
-- Group : participant's group
--   Age : participant's age
--   Sex : participant's sex
-- BIBNumber : participant's bib number (note: not necessarily unique)
-- FirstName : participant's first name
-- LastName : participant's last name
-- Town : participant's home town
-- State : participant's state
CREATE TABLE marathon (
  place INT UNSIGNED PRIMARY KEY,
  runTime VARCHAR(8),
  pace VARCHAR(5),
  groupPlace INT UNSIGNED,
  groupName VARCHAR(10),
  age INT UNSIGNED,
  sex VARCHAR(1),
  bibNumber INT UNSIGNED,
  firstName VARCHAR(20),
  lastName VARCHAR(20),
  town VARCHAR(40),
  state VARCHAR(40)
);
