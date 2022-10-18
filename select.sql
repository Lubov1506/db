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

SELECT * from users
WHERE id IN (101, 167, 302);

SELECT * FROM users
WHERE first_name LIKE '%a'

UPDATE users
SET height = 1.45
WHERE id IN(107, 154, 87)

SELECT * FROM users
WHERE extract ('month' from birthday) = 11 AND extract('day' from birthday) = 21;

SELECT id AS "Номер", first_name AS "Ім'я", last_name AS "Прізвище" FROM usersж

SELECT * FROM users AS "u"
WHERE u.id=99

SELECT * FROM users
LIMIT 15
OFfSET 15;

SELECT id, first_name || ' ' || last_name AS "Full name" FROM users;

SELECT id, concat(first_name, ' ', last_name) AS "Full name" FROM users;

SELECT id, concat(first_name, ' ', last_name) AS "Full name" FROM users
WHERE char_length(concat(first_name, ' ', last_name))<9;

SELECT * from
    (SELECT id, concat(first_name, ' ', last_name) AS "Full name" FROM users) AS "FN"
WHERE char_length("FN"."Full name") >15;


/* agregate */

SELECT min(height) from users;
SELECT max(height) from users;
SELECT count(*) from users;
SELECT avg(weight) from users;

SELECT avg(weight) from users
WHERE gender='male';
SELECT avg(weight) as "avg weight", gender from users
GROUP BY gender;

SELECT max(weight)
FROM users
WHERE gender='female' AND extract('year' from age(birthday)) > 17;

SELECT max(weight), gender
FROM users
WHERE extract('year' from age(birthday)) > 17
GROUP BY gender;

SELECT count(*), gender
FROM users
WHERE extract('year' from age(birthday)) = 38
GROUP BY gender;

SELECT avg(height) from users;
SELECT avg(height) from users
GROUP BY gender;

SELECT gender, min(height), max(height) from users
GROUP BY gender;

SELECT count(*) from users
WHERE extract('year' from birthday) > 1998;

SELECT count(*) from users
WHERE first_name LIKE 'A%'

SELECT count(*) from users
WHERE extract('year' from age(birthday)) BETWEEN 20 AND 30;