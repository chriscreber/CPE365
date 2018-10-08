 --        Id: unique identifier of the customer
 --  LastName: last name of the customer
 -- FirstName: first name of the customer
CREATE TABLE customers (
   id TINYINT PRIMARY KEY,
   lastName VARCHAR(13),
   firstName VARCHAR(11)
);

--    Id : unique identifier of the baked good
-- Flavor: flavor/type of the good (e.g., "chocolate", "lemon")
--   Food: category of the good (e.g., "cake", "tart")
--  Price: price (in dollars)
CREATE TABLE goods (
   id VARCHAR(15) PRIMARY KEY,
   flavor VARCHAR(12),
   food VARCHAR(11),
   price FLOAT
);

 -- Reciept : reciept number (see reciepts.RecieptNumber)
 -- Ordinal : position of the purchased item on the
 --           reciepts. (i.e., first purchased item,
 --           second purchased item, etc...)
 -- Item    : identifier of the item purchased (see goods.Id)
CREATE TABLE items (
   receipt INT UNSIGNED,
   ordinal INT UNSIGNED,
   item VARCHAR(17)
);

-- RecieptNumber : unique identifier of the reciept
--          Date : date of the purchase. The date is
--                 in  DD-Mon-YYY format, which is the
--                 default Oracle's format for DATE data type.
--    CustomerId : id of the customer (see customers.Id)
CREATE TABLE receipts (
   number INT UNSIGNED PRIMARY KEY,
   date VARCHAR(14),
   customerID TINYINT REFERENCES customers(id)
);
