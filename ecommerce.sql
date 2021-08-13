-- Create 3 tables following the criteria in the summary.

CREATE TABLE users(
user_id SERIAL PRIMARY KEY,
email VARCHAR (50),
user_name VARCHAR(30),
user_password VARCHAR(500)
);

CREATE TABLE products(
product_id SERIAL PRIMARY KEY,
product_name VARCHAR(100),
price NUMERIC
);

CREATE TABLE cart(
cart_id SERIAL PRIMARY KEY,
user_id INT NOT NULL REFERENCES users(user_id),
product_id INT NOT NULL REFERENCES products(product_id),
qty INT DEFAULT 1
);

-- Add some data to fill up each table.
-- At least 3 users

INSERT INTO users(email, user_name, user_password)
VALUES('jake@gmail.com', 'Jake1', 'JakePassword');

INSERT INTO users(email, user_name, user_password)
VALUES('jonah@gmail.com', 'Jonah1', 'JonahPassword');

INSERT INTO users(email, user_name, user_password)
VALUES('matt@gmail.com', 'Matt1', 'MattPassword');

-- At least 5 products

INSERT INTO products(product_name, price)
VALUES('Shirt', 24.99);

INSERT INTO products(product_name, price)
VALUES('Hat', 9.99);

INSERT INTO products(product_name, price)
VALUES('Hoodie', 44.99);

INSERT INTO products(product_name, price)
VALUES('Jeans', 49.99);

INSERT INTO products(product_name, price)
VALUES('Shoes', 64.99);

-- Each user should have at least 2 different products in their cart

INSERT INTO cart(user_id, product_id, qty)
VALUES (1, 1, 3);

INSERT INTO cart(user_id, product_id, qty)
VALUES (1, 2, 1);

INSERT INTO cart(user_id, product_id, qty)
VALUES (2, 3, 1);

INSERT INTO cart(user_id, product_id, qty)
VALUES (2, 4, 1);

INSERT INTO cart(user_id, product_id, qty)
VALUES (3, 4, 2);

INSERT INTO cart(user_id, product_id, qty)
VALUES (3, 5, 2);

-- Run queries against your data.
-- Get all products in your first user’s cart

SELECT p.product_name
FROM products p
JOIN cart c
ON p.product_id = c.product_id
JOIN users u
ON u.user_id = c.user_id
WHERE u.user_id = 1;

-- Get products in all carts with all the users’ information

SELECT *
FROM cart
JOIN users
ON cart.user_id = users.user_id;

-- Get the total cost of an order (sum the price of all products on an cart).

SELECT SUM(c.qty*p.price)
FROM products p
JOIN cart c
ON p.product_id = c.product_id
JOIN users u
ON u.user_id = c.user_id
WHERE u.user_id = 3;

-- Update the quantity of a product in a user’s cart where the user’s id is 2
UPDATE cart
SET qty = 2
WHERE product_id = 3 AND user_id = 2