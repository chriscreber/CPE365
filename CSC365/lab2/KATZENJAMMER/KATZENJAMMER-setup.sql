--   AId: unique identifier of the album
-- Title: title of the album
--  Year: year the album was released
-- Label: label (record company) that released the album
CREATE TABLE albums (
   id TINYINT UNSIGNED PRIMARY KEY,
   title VARCHAR(39),
   year YEAR,
   label VARCHAR(23),
   type VARCHAR(8)
);

--        Id: unique id of each band member
-- Firstname: first name of each band member
--  Lastname: last name of each band member
CREATE TABLE band (
   id TINYINT UNSIGNED PRIMARY KEY,
   firstName VARCHAR(12),
   lastName VARCHAR(11)
);

-- SongId: unique identifier of the song
--  Title: song title
CREATE TABLE songs (
   id TINYINT UNSIGNED PRIMARY KEY,
   title VARCHAR(33)
);

--     SongId: id of the song (see Songs.SongId)
-- BandmateId: id of the band member (see Band.Id)
-- Instrument: name of the instrument played
CREATE TABLE instruments(
   songId TINYINT UNSIGNED REFERENCES song(id),
   bandmate TINYINT UNSIGNED REFERENCES band(id),
   instrument VARCHAR(16)
);

--   Performance.csv
--        SongId: id of the song (see Songs.SongId)
--      Bandmate: id of the band member (see Band.Id)
-- StagePosition: stage position of the band member during the live
--                performances of the song
CREATE TABLE performance (
   songId TINYINT UNSIGNED REFERENCES song(id),
   bandmate TINYINT UNSIGNED REFERENCES band(id),
   stagePosition VARCHAR(8)
);

--  AlbumId:  id of the album (see Albums.Aid)
-- Position:  position of the song on the album (first, second, etc...)
--   SongId:  id of the song (see Songs.SongId)
CREATE TABLE tracklists (
   AlbumId TINYINT UNSIGNED REFERENCES albums(id),
   track TINYINT UNSIGNED,
   songId TINYINT UNSIGNED REFERENCES songs(id)
);

--   SongId: id of the song (see Songs.SongId)
-- Bandmate: id of the band member (see Band.Id)
--     Type: type of vocal performance of the band member on the song
CREATE TABLE vocals (
   songId TINYINT UNSIGNED REFERENCES songs(id),
   bandmate TINYINT UNSIGNED REFERENCES band(id),
   type VARCHAR(8)
);
