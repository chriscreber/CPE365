-- Christopher Creber         Jett Moy
-- ccreber@calpoly.edu        jlmoy@calpoly.edu

-- 1 Add descriptions to rooms
ALTER TABLE rooms
   ADD description VARCHAR(100) DEFAULT '';

UPDATE rooms
   SET description = "Enjoy a quiet, comfortable get away! Fitted for those looking to take a breath away from it all!"
   WHERE room  = "AOB";

UPDATE rooms
   SET description = "Traveling has never been more simple or fun!"
   WHERE room  = "CAS";

UPDATE rooms
   SET description = "An elegant rooom designed with nothing but the best in mind."
   WHERE room  = "FNA";

UPDATE rooms
   SET description = "Designed to inspire rest and relaxation, our sleek, modern guest rooms create a feeling of home."
   WHERE room  = "HBB";

UPDATE rooms
   SET description = "It embraces nature-inspired textures, simple and earthy colors, and ultimately an organic warmth."
   WHERE room  = "IBD";

UPDATE rooms
   SET description = "Spacious, bright and outward facing room filled with your favorite amenities!"
   WHERE room  = "IBS";

UPDATE rooms
   SET description = "Affordable but comfortable, with just the essentials."
   WHERE room  = "MWC";

UPDATE rooms
   SET description = "Surreptious, modern decorated room for a couple's getaway."
   WHERE room  = "RND";

UPDATE rooms
   SET description = "This rustic room will make you feel warm and toasty - no matter the season."
   WHERE room  = "RTE";

UPDATE rooms
   SET description = "Unmatched affordability that doesn't sacrifice luxury!"
   WHERE room  = "TAA";

-- 2 Display rooms
SELECT *
   FROM rooms
   ORDER BY room \G
