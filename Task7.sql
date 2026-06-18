USE task7;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product VARCHAR(50),
    amount DECIMAL(10,2),
    order_date DATE
);

INSERT INTO customers VALUES
(1, 'Priya', 'Hyderabad'),
(2, 'Rahul', 'Mumbai'),
(3, 'Sneha', 'Delhi'),
(4, 'Arjun', 'Chennai'),
(5, 'Divya', 'Bangalore');

INSERT INTO orders VALUES
(101, 1, 'Laptop', 50000, '2024-01-15'),
(102, 2, 'Phone', 30000, '2024-02-20'),
(103, 1, 'Tablet', 25000, '2024-03-10'),
(104, 3, 'Laptop', 55000, '2024-01-25'),
(105, 2, 'Headphones', 5000, '2024-04-05');

SELECT * FROM customers;

SELECT c.name, c.city, o.product, o.amount
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id;

SELECT c.name, SUM(o.amount) AS total_spent
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.name
ORDER BY total_spent DESC;

SELECT name, city 
FROM customers 
WHERE customer_id IN (
    SELECT customer_id 
    FROM orders 
    WHERE amount > 25000
);

