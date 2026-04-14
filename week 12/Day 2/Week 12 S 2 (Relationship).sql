
CREATE DATABASE IF NOT EXISTS SalesAnalyticsDB
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;
-- كود اللي في السطرين 3 و 4 علشان لو شغال بلغه غير الانجليزي او اي ايموجي  يخلي اي لغة مش متعرفه يعرفها او ايموجي كذالك يعرفه 
USE SalesAnalyticsDB;
CREATE TABLE IF NOT EXISTS categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100) NOT NULL,
    description TEXT, -- الVARCHAR  اخرها 256   
   --  description TEX تقدر تكتب رفيو كامل 
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
 CREATE TABLE IF NOT EXISTS products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(200) NOT NULL,
    category_id INT,
    unit_price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT DEFAULT 0,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
        ON DELETE SET NULL --  هنا لو مسحت اي كاتيجوري اي دي يروح يحط بداله NULL 
        ON UPDATE CASCADE -- علشان اي ابديت هناك اللي هو جدول الكاتيجوري يتعدل هنا كمان 
);

CREATE TABLE IF NOT EXISTS orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL DEFAULT (CURRENT_DATE),
    total_amount DECIMAL(12, 2),
    status VARCHAR(20) DEFAULT 'Pending', -- Pending, Completed, Cancelled
    payment_method VARCHAR(30),

    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
    ON DELETE RESTRICT
);

-- Order details bridge table   لان العلاقه ميني تو ميني فا لازم اعمله 
CREATE TABLE IF NOT EXISTS order_details (
    detail_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    unit_price DECIMAL(10, 2) NOT NULL,
    discount DECIMAL(5, 2) DEFAULT 0.00 CHECK (discount >= 0 AND discount <= 100),

    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
-- Insert categories
INSERT INTO categories (category_name, description) VALUES
('Electronics', 'Electronic devices and accessories'),
('Clothing', 'Men and women fashion'),
('Food & Beverages', 'Food items and drinks'),
('Home & Garden', 'Home decoration and gardening tools'),
('Sports', 'Sports equipment and accessories');
 
-- Insert products
INSERT INTO products (product_name, category_id, unit_price, stock_quantity) VALUES
('iPhone 15 Pro', 1, 4500.00, 50),
('Samsung Galaxy S24', 1, 3800.00, 45),
('MacBook Pro M3', 1, 7500.00, 20),
('Cotton T-Shirt', 2, 75.00, 200),
('Running Shoes', 5, 450.00, 80),
('Organic Coffee Beans', 3, 85.00, 150),
('Yoga Mat', 5, 120.00, 60),
('Smart Watch', 1, 950.00, 100);
 
-- Insert customers
INSERT INTO customers (first_name, last_name, email, city, customer_segment) VALUES
('Ahmed', 'Al-Rashid', 'ahmed.rashid@email.com', 'Riyadh', 'VIP'),
('Sarah', 'Al-Otaibi', 'sarah.otaibi@email.com', 'Jeddah', 'Regular'),
('Mohammed', 'Al-Qahtani', 'mohammed.qahtani@email.com', 'Dammam', 'VIP'),
('Fatima', 'Al-Zahrani', 'fatima.zahrani@email.com', 'Riyadh', 'New'),
('Khalid', 'Al-Saud', 'khalid.saud@email.com', 'Jeddah', 'Regular');
 
-- Insert orders
INSERT INTO orders (customer_id, order_date, total_amount, status, payment_method) VALUES
(1, '2024-01-15', 4500.00, 'Completed', 'Credit Card'),
(2, '2024-01-16', 525.00, 'Completed', 'Cash'),
(1, '2024-01-20', 950.00, 'Completed', 'Credit Card'),
(3, '2024-01-25', 8300.00, 'Pending', 'Bank Transfer'),
(4, '2024-02-01', 75.00, 'Completed', 'Cash');
 
-- Insert order details
INSERT INTO order_details (order_id, product_id, quantity, unit_price, discount) VALUES
(1, 1, 1, 4500.00, 0),
(2, 4, 2, 75.00, 10),
(2, 5, 1, 450.00, 0),
(3, 7, 1, 950.00, 0),
(4, 3, 1, 7500.00, 5),
(4, 6, 1, 85.00, 0),
(5, 4, 1, 75.00, 0);
