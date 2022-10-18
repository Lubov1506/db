DROP TABLE workers;

CREATE TABLE workers (
    id serial PRIMARY KEY,
    name varchar(32) NOT NULL CHECK (name!=''),
    birthday date CHECK(birthday < current_date AND birthday > '1900/1/1'),
    salary int NOT NULL
)
INSERT INTO workers (name,birthday, salary) VALUES 
('Oleg', '1990/01/01', 300);
INSERT INTO workers (name,salary) VALUES 
('Yaroslava', 1200);
INSERT INTO workers (name, birthday, salary) VALUES 
('Sasha', '1995/01/01', 1000),
('Masha', '1995/01/01', 900);

UPDATE workers
SET salary = 500
WHERE name='Oleg';

UPDATE workers
SET birthday='1987/01/10'
WHERE id=4;

UPDATE workers
SET salary=700
WHERE salary>500;

UPDATE workers
SET birthday='1999/01/01'
WHERE id BETWEEN 2 AND 5;

UPDATE workers
SET  salary=900
WHERE name='Sasha';

UPDATE workers
SET  name='Jenya'
WHERE name='Sasha';


SELECT * FROM workers
WHERE id=3;
SELECT * FROM workers
WHERE salary> 400;

SELECT salary, age( birthday) FROM workers
WHERE name='Jenya';

SELECT * FROM workers 
WHERE age(birthday) > make_interval(18) OR salary>700;

SELECT * FROM workers
WHERE age(birthday) >make_interval(25) AND age(birthday) <make_interval(38);

SELECT * FROM workers
WHERE id IN (1,3,5);

DELETE from workers
WHERE id=4;
DELETE from workers
WHERE name='Petya';
DELETE from workers
WHERE age(birthday)> make_interval(30);