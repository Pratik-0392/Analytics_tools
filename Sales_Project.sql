create database Sales;
use Sales;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15),
    city VARCHAR(50)
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10, 2),
    stock_quantity INT
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    customer_id INT,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Order_Details (
    order_detail_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO Customers VALUES
(1, 'Pratik', 'Pratik@gmail.com', '9991112222', 'Mumbai'),
(2, 'Anuj', 'Anuj@gmail.com', '8881112222', 'Delhi'),
(3, 'Amar', 'Amar@gmail.com', '7771112222', 'Bangalore'),
(4, 'Pushpit', 'Pushpit@gmail.com', '6661112222', 'Pune'),
(5, 'Shreyash', 'Shreyash@gmail.com', '5551112222', 'Hyderabad'),
(6, 'Rohit', 'Rohit@gmail.com', '4441112222', 'Chennai'),
(7, 'Abhi', 'Abhi@gmail.com', '3331112222', 'Ahmedabad'),
(8, 'Sumit', 'Sumit@gmail.com', '2221112222', 'Kolkata'),
(9, 'Karan', 'Karan@gmail.com', '1111112222', 'Surat'),
(10,'Rahul', 'Rahul@gmail.com', '0001112222', 'Jaipur');


INSERT INTO Products VALUES
(101, 'Laptop', 'Electronics', 50000.00, 20),
(102, 'Smartphone', 'Electronics', 20000.00, 50),
(103, 'Headphones', 'Accessories', 1500.00, 100),
(104, 'Mouse', 'Accessories', 500.00, 150),
(105, 'Keyboard', 'Accessories', 1000.00, 120),
(106, 'Tablet', 'Electronics', 25000.00, 30),
(107, 'Monitor', 'Electronics', 15000.00, 25),
(108, 'Webcam', 'Accessories', 2000.00, 80),
(109, 'Charger', 'Accessories', 800.00, 90),
(110, 'Router', 'Electronics', 3000.00, 60);

INSERT INTO Orders VALUES
(201, '2025-08-01', 1, 71500.00),
(202, '2025-08-03', 2, 20000.00),
(203, '2025-08-04', 3, 4500.00),
(204, '2025-08-05', 4, 1000.00),
(205, '2025-08-06', 5, 27000.00),
(206, '2025-08-07', 6, 1500.00),
(207, '2025-08-07', 7, 3000.00),
(208, '2025-08-07', 8, 53000.00),
(209, '2025-08-07', 9, 800.00),
(210, '2025-08-07', 10, 2000.00);

INSERT INTO Order_Details VALUES
(301, 201, 101, 1, 50000.00),
(302, 201, 103, 3, 1500.00),
(303, 202, 102, 1, 20000.00),
(304, 203, 103, 3, 1500.00),
(305, 204, 105, 1, 1000.00),
(306, 205, 106, 1, 25000.00),
(307, 205, 104, 2, 1000.00),
(308, 206, 103, 1, 1500.00),
(309, 207, 110, 1, 3000.00),
(310, 208, 101, 1, 50000.00),
(311, 208, 108, 1, 3000.00),
(312, 209, 109, 1, 800.00),
(313, 210, 108, 1, 2000.00);


SELECT * FROM Customers;

SELECT order_id, order_date, total_amount FROM Orders;

SELECT od.order_id, p.product_name, od.quantity, od.price
FROM Order_Details od
JOIN Products p ON od.product_id = p.product_id;

#Top 3 Products
SELECT TOP 3 p.product_name, SUM(od.quantity) AS total_sold
FROM Order_Details od
JOIN Products p ON od.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC;

#INNER JOIN
SELECT 
    o.order_id,
    c.name AS customer_name,
    p.product_name,
    od.quantity,
    od.price
FROM Order_Details od
JOIN Orders o ON od.order_id = o.order_id
JOIN Customers c ON o.customer_id = c.customer_id
JOIN Products p ON od.product_id = p.product_id;

#Left Join
SELECT 
    c.name AS customer_name,
    o.order_id,
    o.total_amount
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id;

#Right Join 
SELECT 
    p.product_name,
    od.order_id,
    od.quantity
FROM Products p
RIGHT JOIN Order_Details od ON p.product_id = od.product_id;

#Full outer Join
SELECT 
    c.name AS customer_name,
    o.order_id
FROM Customers c
FULL OUTER JOIN Orders o ON c.customer_id = o.customer_id;

#Subquery
SELECT name 
FROM Customers 
WHERE customer_id IN (
    SELECT customer_id 
    FROM Orders 
    WHERE total_amount > 50000
);









