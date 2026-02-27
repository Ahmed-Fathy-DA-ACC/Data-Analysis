create database if not exists Ahmed_Campany;
use Ahmed_Campany;
create table if not exists Emp(
emp_id int auto_increment primary key,
Deprtment varchar(50) Not null,
Full_name varchar(50)  unique  null,
salary decimal(10,3),
email varchar(100) unique not null,
hire_date timestamp  not null default now() 
);

insert into emp (emp_id, Deprtment, Full_name, salary, email, hire_date)
values
(123, 'data analysis', 'ahmed fathy', 120000, 'Ahmed.fathy3666@gmail.com', '2004-12-03'),
(1478, 'software eng', 'kamal ahmed', 13984, 'kamal.ahmed67@yahoo.com', '2022-11-02'),

('software eng', 'kamal ahmed', 13984, 'kamal.ahmed67@yahoo.com', '2022-11-02'),
/*Removing the Emp ID here is wrong because it's a Primary Key. It must not be left null as it's
 the main unique identifier, and it can't be duplicated since its properties are Unique and Not Null*/
 
 (124, 120000, 'Ahmed.fathy3666@gmail.com', '2004-12-03'),
 /*I left the Deptrtment and Full_Name fields null here, even though I specified above that they are Not Null.
 That's why the script won't execute.Additionally,the Full_Name must be Unique because I shouldn't have an employee
 working in two different Deprtments.*/
 
 (7358, 'software eng', 'Mahmoude', 184654, 'kamal.ahmed67@yahoo.com', '2022-11-02'),
 /*"I left the Email field duplicated here, even though I specified above that it must be Unique.
 This is because two different employees cannot share the same email address*/
 
 (738, 'software eng', 'alaa', 1898654, 'alaa653@yahoo.com', default);
 /*"I didn't enter the date and time here, but since I specified a Timestamp with Default Now,
 SQL didn't find any provided values and automatically inserted the current time as instructed.*/
 
select*from emp;

set SQL_SAFE_UPDATES =0; -- انا كده  فاتح التعديل 
-- set SQL_SAFE_UPDATES =1; -- انا كده قافل التعديل 

UPDATE EMP
SET SALARY = SALARY+SALARY * 0.1;
/*An Update was applied to all salaries here, increasing them by 10%.
 This happened to all salaries because I didn't include a Condition*/
 
UPDATE EMP 
SET Deprtment = 'Accountant'
where Full_name ='ahmed fathy';
/*"An Update was performed here; when the system found the Full_name 'Ahmed Fathy',
 it changed the Dept to Accountant*/
 
-- DROP DATABASE AHMED_CAMPANY
set SQL_SAFE_UPDATES =1; --  انا كده قافل التعديل بعد ما خلصت

-- SELECT distinct * FROM emp;  وريني القيم بس في العرض شيل التكرر










