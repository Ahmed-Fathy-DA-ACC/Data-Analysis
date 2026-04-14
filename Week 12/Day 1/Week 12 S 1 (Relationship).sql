
CREATE DATABASE IF NOT EXISTS SalesAnalyticsDB
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;
-- كود اللي في السطرين 3 و 4 علشان لو شغال بلغه غير الانجليزي او اي ايموجي  يخلي اي لغة مش متعرفه يعرفها او ايموجي كذالك يعرفه 
USE SalesAnalyticsDB;
CREATE TABLE IF NOT EXISTS categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);