USE SalesAnalyticsDB;
SELECT * FROM customers;
SELECT first_name, last_name, email FROM customers;
SELECT DISTINCT city FROM customers;

SELECT first_name, last_name, city
FROM customers
ORDER BY first_name ASC;

SELECT product_name, unit_price
FROM products
ORDER BY unit_price DESC;

SELECT category_id, product_name, unit_price
FROM products
ORDER BY category_id ASC, unit_price DESC;

SELECT product_name, unit_price
FROM products
ORDER BY unit_price DESC
LIMIT 5;

SELECT * FROM customers
WHERE city ='Jeddah';

SELECT product_name, unit_price
FROM products
WHERE unit_price > 1000;

SELECT * FROM orders 
WHERE status = 'Completed';

SELECT * FROM customers
WHERE city = 'Jeddah' AND customer_segment = 'VIP';

SELECT * FROM customers
WHERE city = 'Jeddah' AND customer_segment = 'Regular';

SELECT distinct p.product_name, c.category_name
FROM products p
JOIN categories c ON p.category_id = c.category_id
WHERE c.category_name = 'Electronics' OR c.category_name = 'Sports';


SELECT DISTINCT product_name, unit_price
FROM products
WHERE unit_price BETWEEN 100 AND 1000;

SELECT first_name, last_name, city
FROM customers
WHERE city IN ('Riyadh', 'Jeddah');

SELECT * FROM customers


SELECT * FROM customers
WHERE first_name LIKE 'A%';


SELECT * FROM customers
WHERE phone IS NULL;
/*
-- ---------------------------------------------
-- Week 13 session 1  Basic Aggregate Functions
SELECT COUNT(*) AS total_customers FROM customers;

-- Count of active products only
SELECT COUNT(*) AS active_products
FROM products
WHERE is_active = TRUE;

-- SUM: Total sales amount     مج 
SELECT SUM(total_amount) AS total_sales FROM orders;

--  Average product price   متوسط الاسعار
SELECT AVG(unit_price) AS avg_price FROM products;

-- MAX/MIN: Price range اعلي و اقل سعر 
SELECT
    MAX(unit_price) AS max_price,
    MIN(unit_price) AS min_price
FROM products;

-- Grouping with GROUP BY  التقسيم باستخدام 

-- Customer count by city هتلي مجموع العملاء حسب كل مدينه
SELECT
    city,
    COUNT(*) AS customer_count
FROM customers
GROUP BY city;

-- Total sales by order status
SELECT
    status,
    COUNT(*) AS order_count,
    SUM(total_amount) AS total_amount
FROM orders
GROUP BY status;

-- Average price by category
SELECT
    c.category_name,
    COUNT(p.product_id) AS product_count,
    AVG(p.unit_price) AS avg_price,
    MIN(p.unit_price) AS min_price,
    MAX(p.unit_price) AS max_price
FROM categories c
LEFT JOIN products p ON c.category_id = p.category_id
GROUP BY c.category_id, c.category_name;


-- Categories with more than 2 products
SELECT
    c.category_name, COUNT(p.product_id) AS product_count
FROM categories c
JOIN products p ON c.category_id = p.category_id  -- ال join هنا outer
GROUP BY c.category_id, c.category_name
HAVING COUNT(p.product_id) > 2;

SELECT 
c.first_name, -- سم الاول للعميل 
c.last_name, -- تاني اسم للعميل 
COUNT(o.order_id) AS order_count
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING COUNT(o.order_id) > 1;

-- Top 3 cities by customer count
SELECT 
    city,
    COUNT(*) AS customer_count
FROM customers
GROUP BY city
ORDER BY customer_count DESC
LIMIT 3;

-- Monthly sales report
SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    COUNT(*) AS order_count,
    SUM(total_amount) AS total_sales,
    AVG(total_amount) AS avg_order_value
FROM orders
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY month;

-- -----------------------------------------------------------------------------------------
-- Exercise 1: Calculate total value for each order with item count
-- Exercise 2: Find categories where average product price exceeds 1000
-- Exercise 3: Create report showing order count and total sales per customer (spent > 5000)
-- ----------------------------------------------------------------------------------------
SELECT -- الاول 
    o.order_id,
    COUNT(od.detail_id) AS item_count,
    SUM(od.quantity * od.unit_price * (1 - od.discount/100)) AS calculated_total
FROM orders o
JOIN order_details od ON o.order_id = od.order_id
GROUP BY o.order_id;

-- الثاني 

SELECT
    c.category_name,
    AVG(p.unit_price) AS avg_price
FROM categories c
JOIN products p ON c.category_id = p.category_id
GROUP BY c.category_id, c.category_name
HAVING AVG(p.unit_price) > 1000;

-- الثالث 
SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(o.order_id) AS order_count,
    SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING SUM(o.total_amount) > 5000
ORDER BY total_spent DESC;
*/