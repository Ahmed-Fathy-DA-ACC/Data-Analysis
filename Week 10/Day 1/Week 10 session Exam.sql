-- exam
create database if not exists Exam_Yat ;
use Exam_Yat;
create table courses (
Course_id int auto_increment primary key ,
course_name varchar(100) not null,
course_code varchar(20) unique not null,
Start_date date not null,
end_date date not null,
check(start_date<end_date) );
 insert into courses (Course_id, course_name, course_code, start_date, end_date) values
(10,'Data Analysis Fundamentals','DA101','2026-03-10','2026-05-10'),
(20,'SQL for Data Analysis','SQL201','2026-03-15','2026-04-30'),
(30,'Python for Data Science','PY301','2026-04-01','2026-06-01'),
(40,'Business Intelligence Basics','BI101','2026-03-20','2026-05-20'),
(50,'Machine Learning Introduction','ML101','2026-04-10','2026-07-10'),
(60,'Excel for Data Analysis','EX101','2026-03-05','2026-04-05'),
(70,'Statistics for Data Analysis','ST201','2026-04-15','2026-06-15'),
(80,'Power BI Dashboarding','PB301','2026-03-25','2026-05-25'),
(90,'Data Visualization','DV101','2026-04-05','2026-06-05'),
(100,'Advanced SQL','SQL301','2026-05-01','2026-07-01');

CREATE TABLE student (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    Student_age INT,
    email VARCHAR(255)
);
INSERT INTO student (student_id, student_name, Student_age, email) VALUES
(101,'Ahmed Hassan',21,'ahmed.hassan@gmail.com'),
(215,'Mohamed Ali',22,'mohamed.ali@gmail.com'),
(330,'Sara Mahmoud',20,'sara.mahmoud@gmail.com'),
(448,'Omar Khaled',23,'omar.khaled@gmail.com'),
(562,'Mona Adel',19,'mona.adel@gmail.com'),
(678,'Youssef Tarek',24,'youssef.tarek@gmail.com'),
(745,'Nour Ahmed',21,'nour.ahmed@gmail.com'),
(889,'Kareem Samy',22,'kareem.samy@gmail.com'),
(912,'Laila Mostafa',20,'laila.mostafa@gmail.com'),
(1054,'Hassan Fathy',23,'hassan.fathy@gmail.com');

ALTER TABLE student 
ADD CONSTRAINT chk_email_format 
CHECK (email REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$');

ALTER TABLE student 
ADD COLUMN grade VARCHAR(2) DEFAULT 'A';

UPDATE student 
SET grade = 'B' 
WHERE Student_age > 25;
SET SQL_SAFE_UPDATES = 0;
SELECT 
    student_id AS EmployeeID,
    student_name AS FullName,
    Student_age AS Age,
    grade AS CurrentGrade
FROM 
    student
WHERE 
    email LIKE '%@example.com';
------------------------------------------------------------------------------------------------
-- exam
create database if not exists Exam_Yat ;
use Exam_Yat;
create table courses (
Course_id int auto_increment primary key ,
course_name varchar(100) not null,
course_code varchar(20) unique not null,
Start_date date not null,
end_date date not null,
check(start_date<end_date) );
 insert into courses (Course_id, course_name, course_code, start_date, end_date) values
(10,'Data Analysis Fundamentals','DA101','2026-03-10','2026-05-10'),
(20,'SQL for Data Analysis','SQL201','2026-03-15','2026-04-30'),
(30,'Python for Data Science','PY301','2026-04-01','2026-06-01'),
(40,'Business Intelligence Basics','BI101','2026-03-20','2026-05-20'),
(50,'Machine Learning Introduction','ML101','2026-04-10','2026-07-10'),
(60,'Excel for Data Analysis','EX101','2026-03-05','2026-04-05'),
(70,'Statistics for Data Analysis','ST201','2026-04-15','2026-06-15'),
(80,'Power BI Dashboarding','PB301','2026-03-25','2026-05-25'),
(90,'Data Visualization','DV101','2026-04-05','2026-06-05'),
(100,'Advanced SQL','SQL301','2026-05-01','2026-07-01');

CREATE TABLE student (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    Student_age INT,
    email VARCHAR(255)
);
INSERT INTO student (student_id, student_name, Student_age, email) VALUES
(101,'Ahmed Hassan',21,'ahmed.hassan@gmail.com'),
(215,'Mohamed Ali',22,'mohamed.ali@gmail.com'),
(330,'Sara Mahmoud',20,'sara.mahmoud@gmail.com'),
(448,'Omar Khaled',23,'omar.khaled@gmail.com'),
(562,'Mona Adel',19,'mona.adel@gmail.com'),
(678,'Youssef Tarek',24,'youssef.tarek@gmail.com'),
(745,'Nour Ahmed',21,'nour.ahmed@gmail.com'),
(889,'Kareem Samy',22,'kareem.samy@gmail.com'),
(912,'Laila Mostafa',20,'laila.mostafa@gmail.com'),
(1054,'Hassan Fathy',23,'hassan.fathy@gmail.com');

ALTER TABLE student 
ADD CONSTRAINT chk_email_format 
CHECK (email REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$');

ALTER TABLE student 
ADD COLUMN grade VARCHAR(2) DEFAULT 'A';

UPDATE student 
SET grade = 'B' 
WHERE Student_age > 23;
SET SQL_SAFE_UPDATES = 0;
SELECT 
    student_id AS EmployeeID,
    student_name AS FullName,
    Student_age AS Age,
    grade AS CurrentGrade
FROM 
    student
WHERE 
    email LIKE '%@gmail.com';
select* from student;