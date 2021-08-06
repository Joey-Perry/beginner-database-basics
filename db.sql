CREATE TABLE person(
  id SERIAL PRIMARY KEY,
  name VARCHAR(50),
  age INT,
  height FLOAT,
  city VARCHAR(50),
  favorite_color VARCHAR(15)
  );
  
  INSERT INTO person
  	(name, age, height, city, favorite_color)
    VALUES
    ('Joey', 32, 175.26, 'Houston', 'blue'),
    ('Hannah', 31, 162.56, 'Houston', 'pink'),
    ('Isabelle', 5, 101.6, 'Houston', 'yellow'),
    ('Isaiah', 3, 40.64, 'Houston', 'green'),
    ('Israel', 2, 30.23, 'Houston', 'red');

SELECT * FROM person
ORDER BY height DESC;

SELECT * FROM person
ORDER BY height;

SELECT * FROM person
ORDER BY age DESC;

SELECT * FROM person
WHERE age > 20;

SELECT * FROM person
WHERE age = 18;

SELECT * FROM person
WHERE age < 20 OR age > 30;

SELECT * FROM person
WHERE age != 27;

SELECT * FROM person
WHERE favorite_color != 'red';

SELECT * FROM person
WHERE favorite_color != 'red' AND favorite_color != 'blue';

SELECT * FROM person
WHERE favorite_color = 'green' OR favorite_color = 'orange';

SELECT * FROM person
WHERE favorite_color IN ('orange', 'green', 'blue');

SELECT * FROM person
WHERE favorite_color IN ('yellow', 'purple');

CREATE TABLE orders(
    order_id SERIAL PRIMARY KEY,
	person_id INT REFERENCES person(id),
    product_name VARCHAR(100),
    product_price FLOAT,
    quantity INTEGER
);

INSERT INTO orders
(person_id, product_name, product_price, quantity)
VALUES
(1, 'water bottle', 1.50, 2),
(2, 'socks', 3.75, 4),
(3, 'glasses', 2.25, 1),
(4, 'hat', 10.99, 1),
(5, 'pajamas', 12.99, 1);

SELECT * FROM orders;

SELECT sum(quantity) FROM orders;

SELECT sum(product_price*quantity) FROM orders;

SELECT person_id, sum(product_price*quantity) FROM orders
GROUP BY person_id;

INSERT INTO artist
(name, artist_id)
VALUES
('Eminem', 276),
('Nas', 277),
('Maverick City', 278);

SELECT * FROM artist
ORDER BY name DESC LIMIT 10;

SELECT * FROM artist
ORDER BY name ASC LIMIT 5;

SELECT * FROM artist
WHERE name ILIKE 'black%';

SELECT * FROM artist
WHERE name ILIKE '%black%';

SELECT first_name, last_name FROM employee
WHERE city = 'Calgary';

-- SELECT birth_date FROM employee
SELECT * FROM employee
ORDER BY birth_date DESC LIMIT 1;

SELECT * FROM employee
ORDER BY birth_date ASC LIMIT 1;

SELECT * FROM employee
WHERE reports_to = 2;

SELECT count(*) FROM employee
WHERE city = 'Lethbridge';

SELECT count(*) FROM invoice
WHERE billing_country = 'USA';

SELECT max(total) FROM invoice;

SELECT min(total) FROM invoice;

SELECT * FROM invoice
WHERE total > 5;

SELECT count(*) FROM invoice
WHERE total < 5;

SELECT count(*) FROM invoice
WHERE billing_state IN ('CA', 'TX', 'AZ');

SELECT avg(total) FROM invoice;

SELECT sum(total) FROM invoice;