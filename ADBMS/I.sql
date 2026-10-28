use adbms;

show databases;

CREATE TABLE studentI (
    Stuid INT(8) NOT NULL PRIMARY KEY,
    Fname CHAR(25),
    Lname CHAR(25),
    Money INT(15),
    Money_source CHAR(15),
    Monthley_expenses INT(8),
    Department CHAR(25)
);

INSERT INTO studentI VALUES
(2002040, 'Shabuj', 'Mia', 8000, 'Tution', 7500, 'CSE'),
(2004067, 'Sorna', 'Boikontho', 5000, 'Home', 4500, 'DVM'),
(2002022, 'Ronok', 'Hasan', 300000, 'Freelancing', 11000, 'CSE'),
(1902089, 'Amitabh', 'Reza', 500000, 'Freelancing', 12350, 'ECE'),
(1804089, 'Fazle', 'Rabbi', 11500, 'Tution', 6700, 'Agri'),
(1706044, 'Shanti', 'Rehman', 70000, 'Home', 6000, 'Act'),
(2107023, 'Rahman', 'Pair', 45000, 'Remote Job', 16000, 'Engin.'),
(2205066, 'Geetika', 'Roy', 4500, 'Tution', 4500, 'Math');


-- 2 Write a SQL query to print First_name and Last_name from table into a single column Full_name. A space char should separate them.
select concat(Fname," ",Lname) as FULL_NAME
from studentI;

-- 3 Write a SQL query to find those student money is greater than 10000 and expenses is greater than 10000.
select *
from studentI
where money>10000 and Monthley_expenses>10000;

-- 4 Write a SQL query to find those student expenses is smaller than 70000.
select *
from studentI
where Monthley_expenses<70000;

-- 5 Write a SQL query to find unique money source.
select distinct(Money_source)
from studentI;

-- 6 Write a SQL query to find highest money in freelancing.
select max(money)
from studentI
where Money_source='freelancing';

-- 7 Write a SQL query to find highest money in different job. Like (Home 7000, Freelancing 50000)
select Money_source,max(money)
from studentI
group by Money_source;

-- 8 Write a SQL query to find details for First_name “Ronok” Last_name “Hasan” from the table
select *
from studentI
where fname='ronok' and lname='hasan';

-- 9 Write a SQL query to find even Student_id
select *
from studentI
where stuid%2=0;

-- 10 write a SQL query to find those student whose First_name start with “A” or “S”.
select *
from studentI
where fname like 'a%' or lname like '%s';