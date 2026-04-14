--  week 13 Session 1 part 2 (join)
-- -----------------------------------------------------------------------------------------------------------------------------------
USE SalesAnalyticsDB;

-- Section 1: INNER JOIN يعني هات المشترك بين الجدولين

-- Order information with customer names
SELECT 
    o.order_id,
    o.order_date,
    c.first_name,
    c.last_name,
    c.city,
    o.total_amount
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id;

-- Products with category names
SELECT 
    p.product_name,
    c.category_name,
    p.unit_price
FROM products p
INNER JOIN categories c ON p.category_id = c.category_id;
-- ------------------------------------------------------------------------------------------------------------------------
-- Complete order details (3 tables)
SELECT 
    o.order_id,
    o.order_date,
    c.first_name AS customer_name,
    p.product_name,
    od.quantity,
    od.unit_price,
    (od.quantity * od.unit_price) AS line_total
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
INNER JOIN order_details od ON o.order_id = od.order_id
INNER JOIN products p ON od.product_id = p.product_id;


-- -----------------------------------------------------------------------------------------------

--  LEFT JOIN

-- All categories even if no products exist
SELECT distinct
    c.category_name,
    p.product_name,
    p.unit_price
FROM categories c
LEFT JOIN products p ON c.category_id = p.category_id;



-- Customers and their orders (including customers with no orders)
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(o.order_id) AS order_count
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;


--  RIGHT JOIN
-----------------------------------------------------------

-- All orders even if customer missing (rare case)
SELECT 
    c.first_name,
    o.order_id,
    o.total_amount
FROM customers c
RIGHT JOIN orders o ON c.customer_id = o.customer_id;

-- -------------------------------------------------------------------

-- FULL OUTER JOIN (Using UNION in MySQL)

-- All customers and all orders
SELECT 
    c.customer_id,
    c.first_name,
    o.order_id,
    o.total_amount
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id

UNION

SELECT 
    c.customer_id,
    c.first_name,
    o.order_id,
    o.total_amount
FROM customers c
RIGHT JOIN orders o ON c.customer_id = o.customer_id;


-----------------------------------------------------------
-- Section 6: CROSS JOIN
-----------------------------------------------------------

-- All possible combinations (Cartesian product)
SELECT 
    c.category_name,
    p.product_name
FROM categories c
CROSS JOIN products p
WHERE c.category_id = 1; -- Electronics only for demo

-- The end of Sql