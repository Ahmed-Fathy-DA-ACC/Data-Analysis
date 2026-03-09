-- week 8 session 2 part 2


-- Create the database if it doesn't exist and switch to it
CREATE DATABASE IF NOT EXISTS bookstore;
USE bookstore;

-- Create the Book table
CREATE TABLE Book (
    Name VARCHAR(40),
    Publisher VARCHAR(50),
    Year_publish DATE,
    Price INT
);

-- Insert data into the Book table

INSERT INTO Book (Name, Publisher, Year_publish, Price)
VALUES
    ("The Origin", "Elshrouq", '2022-02-20', 500),
    ("Alboasaa", "Almesria", '2002-02-25', 180),
    ("Tha Mirrors", "Nahdet Misr", '2018-09-20', 200);
    select* from book;
truncate  table book ;
select* from book;  
/*  بعد select بكتب اسم الجدول اللي انا عايز منه البياناتا بتاعتي بقوله بقى سواء نجمه تجيب كل الداتا اللي موجوده في الجدول اول هات اعمده بمسى معين 
*/
-- drop database bookstore;
-- truncate تمسح البيانات اللي جوا الجدول بس تسيب الاعمده زي ما هي و دي بدل ما امسح كل الجدول كله مره 
