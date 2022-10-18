SELECT first_name, gender, issubsribe, height FROM users
WHERE gender = 'male' AND height > 1.6 AND issubsribe = 'true';

SELECT first_name FROM users
WHERE first_name IN ( 'John', 'Jane', 'William');

SELECT * FROM users
WHERE height BETWEEN 1.5 AND 1.8;

SELECT * FROM users
WHERE id BETWEEN 105 AND 170

SELECT * FROM users
WHERE first_name LIKE 'F%';

ALTER TABLE users
ADD COLUMN weight int CHECK (weight !=0);

UPDATE users
SET weight = 75
WHERE id%2=0;

UPDATE users
SET weight = 88
WHERE height > 1.7;

SELECT * FROM users
ORDER BY id;

DELETE FROM users
WHERE id = 106;

DELETE FROM users
WHERE height = 1.73;
 
UPDATE users
SET weight = 93
WHERE id = 22
RETURNING first_name, weight;

DELETE FROM users
WHERE id = 7
RETURNING id, first_name, last_name;

SELECT * FROM users
WHERE first_name LIKE 'A%' AND gender = 'female';

SELECT * FROM users
WHERE age(birthday) < make_interval(22);

SELECT * FROM users
WHERE extract('month' from birthday ) = 9;

SELECT * FROM users
WHERE age(birthday) > make_interval(20) AND age(birthday) < make_interval(40)