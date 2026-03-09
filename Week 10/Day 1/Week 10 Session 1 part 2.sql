CREATE DATABASE IF NOT EXISTS COMPANY;
USE COMPANY;
CREATE TABLE IF NOT EXISTS emp (
    id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10, 2)
);
INSERT INTO emp (id,first_name,last_name, department, salary) VALUES
(1,'Ahmed', 'Ali', 'Manager', 15000.00 ),
(5,'Fatima', 'Hassan', 'Assistant', 12000.00),
(7,'Mohammed', 'Ahmed', 'Analyst', 13000.00),
(10,'Layla', 'Ibrahim', 'Developer', 14000.00),
(20,'Omar',' Khalid', 'Designer', 11000.00);
select * from emp;
-- Select data from the emp table and calculate annual salary using an alias
SELECT 
    id AS EmployeeID,
    CONCAT(first_name, ' ', last_name) AS FullName,
    salary AS MonthlySalary ,
    salary * 12 AS AnnualSalary
FROM 
    emp
WHERE 
  Salary LIKE '^1[0-9]{4}\\.[0-9]{2}$';
