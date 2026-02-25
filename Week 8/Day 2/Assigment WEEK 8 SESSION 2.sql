CREATE DATABASE IF NOT EXISTS DEPI_ASSigment;
USE DEPI_Assigment;
CREATE TABLE IF NOT EXISTS Students (
Student_id int (50)  ,
Student_Name varchar(50) ,
Status varchar(50) ,
Address Varchar(300),
Academic_year varchar(20)
 ); 
 CREATE TABLE IF NOT EXISTS courses (
 Course_id int (50)  ,
 course_name Varchar(50),
 Course_level Varchar(50)
 );
 CREATE TABLE IF NOT EXISTS Instructor (
Instructor_id int(20),
Instructor_Name varchar(50),
specialization varchar(100),
Phone int(20)
 );
 INSERT INTO Students VALUES
(1,'Ahmed Ali','Active','Cairo','First Year'),
(2,'Sara Mohamed','Active','Giza','Second Year'),
(3,'Omar Hassan','Inactive','Alexandria','Third Year'),
(4,'Mona Khaled','Active','Mansoura','First Year'),
(5,'Youssef Ibrahim','Active','Tanta','Fourth Year'),
(6,'Nour Adel','Inactive','Aswan','Second Year'),
(7,'Karim Samy','Active','Ismailia','Third Year'),
(8,'Salma Hany','Active','Zagazig','First Year'),
(9,'Mostafa Nabil','Inactive','Luxor','Fourth Year'),
(10,'Hana Reda','Active','Sohag','Second Year'),
(11,'Mahmoud Essam','Active','Port Said','Third Year'),
(12,'Laila Sherif','Inactive','Minya','First Year'),
(13,'Amr Tarek','Active','Beni Suef','Fourth Year'),
(14,'Farah Magdy','Active','Damietta','Second Year'),
(15,'Khaled Fathy','Active','Fayoum','Third Year');
INSERT INTO courses VALUES
(1,'Data Analysis','Beginner'),
(2,'SQL Basics','Beginner'),
(3,'Advanced SQL','Advanced'),
(4,'Python Programming','Intermediate'),
(5,'Web Development','Intermediate'),
(6,'Excel for Business','Beginner'),
(7,'Power BI','Intermediate'),
(8,'Machine Learning','Advanced'),
(9,'English Course','Beginner'),
(10,'Digital Marketing','Intermediate'),
(11,'Cyber Security','Advanced'),
(12,'Graphic Design','Beginner'),
(13,'Accounting Basics','Beginner'),
(14,'HR Management','Intermediate'),
(15,'Project Management','Advanced');
INSERT INTO Instructor VALUES
(1,'Dr. Mohamed Salah','Data Analysis',1012345678),
(2,'Eng. Ahmed Nasser','SQL & Databases',1012345679),
(3,'Dr. Sara Mostafa','Machine Learning',1012345680),
(4,'Eng. Omar Adel','Web Development',1012345681),
(5,'Ms. Mona Ali','English',1012345682),
(6,'Mr. Karim Hassan','Excel & Power BI',1012345683),
(7,'Dr. Youssef Samy','Cyber Security',1012345684),
(8,'Ms. Salma Reda','Graphic Design',1012345685),
(9,'Mr. Mostafa Ali','Accounting',1012345686),
(10,'Dr. Hana Ibrahim','HR Management',1012345687),
(11,'Eng. Amr Khaled','Python Programming',1012345688),
(12,'Ms. Laila Nabil','Digital Marketing',1012345689),
(13,'Dr. Khaled Tarek','Project Management',1012345690),
(14,'Eng. Farah Essam','Advanced SQL',1012345691),
(15,'Mr. Mahmoud Fathy','Data Science',1012345692);
select* from Instructor;
select* from Students;
select* from courses ;




 
