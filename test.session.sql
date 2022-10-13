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


INSERT INTO products (id, name, category, price, quantity)
VALUES (
    id:integer,
    'name:character varying',
    'category:character varying',
    price:numeric,
    quantity:integer
  );

DROP TABLE products;
CREATE TABLE products (
    id serial PRIMARY KEY,
    name varchar(64),
    category varchar(128),
    price decimal(16,2) CHECK(price>0),
    quantity int CHECK(quantity>0),
    UNIQUE(name,category)

)

INSERT INTO products(name, category, price, quantity) VALUES ('samsung', 'phones', 100, 5),
('iphone', 'phones', 100, 5),
('xiaomi', 'computers', 5000, 2),
('huawei', 'phones', 250, 3),
('dell', 'computers', 2550, 10),
('lenovo', 'phones', 70, 25);

DROP TABLE orders;
CREATE TABLE orders (
    id serial PRIMARY KEY,
    created_at timestamp DEFAULT current_timestamp,
    customer_id int REFERENCES users(id)
);

INSERT INTO orders (customer_id) VALUES(3),
(3),
(4),
(3),
(4);


DROP TABLE products_to_orders;
CREATE TABLE products_to_orders(
    product_id int REFERENCES products(id),
    order_id int REFERENCES orders(id),
    quantity int,
    PRIMARY KEY (product_id, order_id)
)

INSERT INTO products_to_orders (product_id, order_id, quantity) VALUES 
(6, 4, 2),
(5, 3, 1),
(4, 1, 2),
(2, 2, 1),
(3, 3, 2),
(1, 1, 1);


CREATE TABLE chat (
    id serial PRIMARY KEY,
    name varchar(64) CHECK (name != ''),
    owner_id int REFERENCES users(id),
    created_at timestamp DEFAULT current_timestamp
);
INSERT INTO chat (name, owner_id) VALUES ();

CREATE TABLE user_to_chat (
    user_id int REFERENCES users(id),
    chat_id int REFERENCES chat(id),
    join_at timestamp DEFAULT current_timestamp,
    PRIMARY KEY (user_id, chat_id)
);

CREATE TABLE messages (
    id serial PRIMARY KEY,
    body text CHECK (body != ''),
    created_at timestamp DEFAULT current_timestamp,
    author_id int,
    chat_id int ,
    FOREIGN KEY (chat_id, author_id) REFERENCES user_to_chat(chat_id, user_id)
);