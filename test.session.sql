DROP TABLE users;

CREATE TABLE users(
    id serial PRIMARY KEY,
    first_name VARCHAR(64) NOT NULL CONSTRAINT "RN_CH_NOT_EMPTY" CHECK(first_name != ''),
    last_name VARCHAR(64) NOT NULL CHECK(last_name != ''),
    email VARCHAR(256) NOT NULL CHECK(email != ''),
    gender VARCHAR(64) NOT NULL,
    isSubsribe BOOLEAN NOT NULL,
    birthday date NOT NULL CHECK(birthday < current_date AND birthday > '1900/1/1'),
    height numeric(3,2) NOT NULL CHECK(height > 0.2 AND height < 3.0),
    UNIQUE(first_name,last_name),
    CHECK(first_name !='' OR last_name != '')
);

INSERT INTO users (first_name,last_name,email,gender,isSubsribe, birthday, height) VALUES
('Test', 'Testovifrggich', 'test@gmdfgdail.com', 'male', true, '1999-05-10', 1.53),
('Tesest', 'jhjgbvdgfgbn', 'test@gmdxfffgdail.com', 'female', false, '1999-05-10', 1.13);



ALTER TABLE users 
ADD CONSTRAINT "UNIQUE_CH" UNIQUE(email);
ALTER TABLE users
DROP CONSTRAINT "UNIQUE_CH";






























/* DROP TABLE users;

CREATE TABLE users(
    id serial PRIMARY KEY,
    first_name VARCHAR(64) NOT NULL CONSTRAINT "RN_CH_NOT_EMPTY" CHECK(first_name != ''),
    last_name VARCHAR(64) NOT NULL CHECK(last_name != ''),
    email VARCHAR(256) NOT NULL CHECK(email != ''),
    gender VARCHAR(64) NOT NULL,
    isSubsribe BOOLEAN NOT NULL,
    birthday date NOT NULL CHECK(birthday < current_date),
    height numeric(3,2) NOT NULL CHECK(height > 0.2 AND height < 3.0)
);

INSERT INTO users (first_name,last_name,email,gender,isSubsribe, birthday, height) VALUES
('Test', 'Testoviich', 'test@gmdfgdail.com', 'male', true, '1999-05-10', 1.53),
('Tesest', 'jhjgbvbn', 'test@gmdfgdail.com', 'female', false, '1999-05-10', 1.13),
('Test', 'Testoviich', 'test@gcvxsmail.com', 'male', true, '1999-05-10', 1.67),
('Test', 'Testoviich', 'test@gmdsgail.com', 'female', true, '1999-05-10', 2.75);

ALTER TABLE users
ADD UNIQUE (email); */
