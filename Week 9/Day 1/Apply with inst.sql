CREATE DATABASE IF NOT EXISTS company;
USE company;

-- Create a table named 'employees'
CREATE TABLE IF NOT EXISTS employees (

    -- Column for employee ID, which is a primary key and auto-incremented
    employee_id INT AUTO_INCREMENT PRIMARY KEY,

    -- Column for first name, which cannot be null
    first_name VARCHAR(50) NOT NULL,
    -- Column for last name, which cannot be null
    last_name VARCHAR(50) NOT NULL,
    -- Column for email, which must be unique and cannot be null
    email VARCHAR(100) UNIQUE NOT NULL,

-- Column for hire date, which cannot be null
         hire_date timestamp NOT NULL default now(),
    -- Column for phone number, which can be null
    phone_number VARCHAR(15),
 
   
    -- Column for job title, which cannot be null
job_title VARCHAR(50) NOT NULL,
    -- Column for salary, which cannot be null
salary DECIMAL(10, 2) NOT NULL
);
-- Drop Table Employees;

-- Corrected SELECT statement

-- Inserting a new employee into the 'employees' table
INSERT INTO employees (first_name, last_name, email, phone_number, hire_date, job_title, salary)
VALUES
('Ahmed', 'Ali', 'ahmed.ali@example.com', '123-456-7890', '2023-04-01', 'Software Engineer', 8000.00),
('Mona', 'Mohammed', 'mona.mohammed@example.com', '987-654-3210', '2023-04-02', 'Data Analyst', 75000.00),
('Ramy', 'Maged', 'ramy.maged@example.com', '789-123-1320', '2023-04-03', 'Project Manager', 90000.00);


SELECT distinct * FROM employees;

-- Update the salary for Data Analysts
UPDATE employees
SET salary = 80000.00
WHERE job_title = 'Data Analyst';
-- SET SQL_SAFE_UPDATES = 0; لو الرقم واحد تمنع ان حد يعدل علي لجدول 
UPDATE employees
SET job_title = 'Software Engineer', salary = salary * 1.05
WHERE first_name = 'Ramy';