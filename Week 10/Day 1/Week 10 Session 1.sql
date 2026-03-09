CREATE DATABASE IF NOT EXISTS Depi_Company;
USE Depi_Company;

CREATE TABLE IF NOT EXISTS employee (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL CHECK (name <> ''),
    position VARCHAR(50) NOT NULL CHECK (position <> ''),
    salary DECIMAL(10, 2) NOT NULL CHECK (salary >= 1000 AND salary <= 20000),
    hire_date DATE NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE CHECK (email REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$')
);
SELECT * FROM employee;
-- DROP TABLE employee;
INSERT INTO employee (name, position, salary, hire_date, email) VALUES
('Ahmed Ali', 'Manager', 15000.00, '2020-01-15', 'ahmed.ali@example.com'),
('Fatima Hassan', 'Assistant', 12000.00, '2021-03-20', 'fatima.hassan@example.com'),
('Mohammed Ahmed', 'Analyst', 13000.00, '2019-07-10', 'mohammed.ahmed@example.com'),
('Layla Ibrahim', 'Developer', 14000.00, '2022-05-05', 'layla.ibrahim@example.com'),
('Omar Khalid', 'Designer', 11000.00, '2020-11-30', 'omar.khalid@example.com'),
('Amina Salim', 'Technician', 10500.00, '2021-09-12', 'amina.salim@example.com'),
('Youssef Tarek', 'Supervisor', 16000.00, '2018-04-25', 'youssef.tarek@example.com'),
('Nour Mahmoud', 'Coordinator', 12500.00, '2022-02-14', 'nour.mahmoud@example.com'),
('Hassan Ziad', 'Engineer', 13500.00, '2019-12-01', 'hassan.ziade@xample.com'),
('Sara Faisal', 'Consultant', 14500.00, '2020-06-18', 'sara.faisal@example.com');
SELECT * FROM employee;
SELECT * FROM employee WHERE name REGEXP 'a.e';

SELECT * FROM employee WHERE name REGEXP 'a..d';
SELECT * FROM employee WHERE name REGEXP '^[AF]';
SELECT * FROM employee WHERE name REGEXP '[aeiou]{2}';

SELECT * FROM employee WHERE name REGEXP '^A';
SELECT * FROM employee WHERE name REGEXP 'l$';

SELECT * FROM employee WHERE position REGEXP '^[CE][A-Z]+R$';
SELECT * FROM employee WHERE position REGEXP '^[CE]\\wR$';
SELECT * FROM employee WHERE position REGEXP 'Manager';

SELECT * FROM employee WHERE salary REGEXP '^1[0-9]{4}\\.[0-9]{2}$';
SELECT * FROM employee WHERE hire_date REGEXP '^202[0-2]';

SELECT * FROM employee 
WHERE name LIKE 'A%';

SELECT * FROM employee 
WHERE name LIKE '%d';