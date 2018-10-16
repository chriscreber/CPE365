DELETE FROM goods
WHERE food != "Cake";

UPDATE goods
SET price = ROUND(price * 1.2, 2)
WHERE flavor = "Chocolate" OR flavor = "Opera";

UPDATE goods
SET price = ROUND(price - 2, 2)
WHERE flavor = "Lemon" OR flavor = "Napolean";

UPDATE goods
SET price = ROUND(price * 0.9, 2)
WHERE flavor != "Lemon" OR flavor != "Napolean" AND flavor != "Chocolate" AND flavor != "Opera";

SELECT *
FROM goods
ORDER BY id;
