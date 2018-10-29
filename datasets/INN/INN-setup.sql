-- Christopher Creber         Jett Moy
-- ccreber@calpoly.edu        jlmoy@calpoly.edu

 --       RoomId : a three-letter unique Id code of a room
 --    roomName  : official name of the room (all rooms in B&B inns
 --                   typically have names)
 --         beds : number of beds in the room
 --      bedType : type of the bed(s) in the room. All beds in each room
 --                are of the same type.
 -- maxOccupancy : maximum number of people allowed to stay in the room
 --    basePrice : base price (in US dollars) of one night of stay in the room.
 --        decor : decoration style of the room
CREATE TABLE rooms (
   room VARCHAR(5) PRIMARY KEY,
   name VARCHAR(26),
   beds TINYINT UNSIGNED,
   bedType VARCHAR(8),
   max TINYINT UNSIGNED,
   price INT UNSIGNED,
   decor VARCHAR(13)
);

   --      Code : reservation code
   --      Room : the three-letter room code (see Rooms.RoomId)
   --   CheckIn : date of check-in/arrival
   --  CheckOut : date of check-out/departure
   --      Rate : actual nightly rate. Each night of stay on one reservation
   --             always costs the same amount, although rates may vary
   --             for the same room from one reservation to another
   --  LastName : last name of the person who made the reservation
   -- FirstName : first name of the person who made the reservation
   --    Adults : number of adults (18 and above) staying in the room. Each
   --             reservation must have at least one adult
   --      Kids : number of kids (ages 0-17) staying in the room.
CREATE TABLE reservations (
   code INT UNSIGNED PRIMARY KEY,
   room VARCHAR(5) REFERENCES rooms(room),
   checkIn VARCHAR(11),
   checkOut VARCHAR(11),
   rate FLOAT,
   lastName VARCHAR(15),
   firstName VARCHAR(12),
   adults TINYINT UNSIGNED,
   kids TINYINT UNSIGNED
);
