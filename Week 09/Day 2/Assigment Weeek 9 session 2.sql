create database if not exists Eyouth;
use Eyouth;
create table IF NOT exists Students (
Student_id int auto_increment primary key,
Full_Name varchar(100) not null,
email varchar(100)  NOT NULL UNIQUE CHECK (email REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$'),
Age int,
city varchar(40) );

create table IF NOT exists courses(
Course_id int primary key,
Course_name varchar(90),
duration_hours int
);
insert into Students(Student_id,Full_Name,email,Age,city) values
(111, 'ahmed fathy', 'ahmed.fathy3666@gmail.com',22,'cairo'),
(222, 'Ahmed ali', 'ahmed.ali414616@gmail.com', 25, 'ciro'),
(333, 'Basant naseer', 'BOSYNASEER25@Gmail.com', 19, 'octobar');
insert into courses (Course_id, Course_name, duration_hours) values
(3818578, 'data analysis', 120),
(414616, 'Back End', 140);
Alter table students 
add column Phone_No varchar(15);
select* from students;
alter table students
add column status varchar(20) default 'active';
update students
set city = 'cairo' where student_id = 333 ;
update students 
set status = 'inactive' where age > 22;
-- SET SQL_SAFE_UPDATES = 0;

select* from students;