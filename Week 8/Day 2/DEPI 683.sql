CREATE DATABASE IF NOT EXISTS DEPI_683B;
USE DEPI_683B;
-- drop  database DEPI_683B; -- دي  تمسح بيها الداتا بيز 
--  IF NOT EXISTS كومنت لو مش موجود الداتا دي اعملها
# comment 
/*
 اكتب كومنت كذا سطر 
 */
CREATE TABLE IF NOT EXISTS employeer ( 
Name VARCHAR(30),
    Department VARCHAR(20),
    Salary INT,
    Age INT
--  تفصل ب كوما بس اخر واحده  لا متفصلش بكوما 
);
--  الاسايمي بتاع الcolumns  مينفعش في مسافه  و مينفعاش يبدا غير بحرف او  اندر اسكور 
CREATE TABLE IF NOT EXISTS Location ( 
Name char
);
-- drop table Location; --  دي عايز امسح الجدول   بس دي مش احسن حاجه في  كود اسمه ultar update
-- Drop TABLE Coustmer
-- select *  ده لو عايز اشوف الجدول كله و النجمه تعني كل 
 SELECT * FROM EMPLOYEER; --  هنا بقوله وريني كل حاجه في الجدول ده 
 -- طيب لو مش عايز اشوف الجدول كله شيل النجمه و اكتب اللي عايز تشوفه بس 
SELECT NAME, AGE FROM EMPLOYEER;     --  بتختار عواميد متعدده 

INSERT INTO Employeer (Name, Department, Salary, Age) VALUES ('Alice', 'HR', 50000, 30);
INSERT INTO Employeer (Name, Department, Salary, Age) VALUES ('Bob', 'Engineering', 70000, 25);
INSERT INTO Employeer (Name, Department, Salary, Age) VALUES ('Charlie', 'Marketing', 60000, 35);