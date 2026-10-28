use adbms;

CREATE TABLE Worker (
    WORKER_ID INT PRIMARY KEY,
    FNAME VARCHAR(50),
    LNAME VARCHAR(50),
    SALARY INT,
    JOINING_DATE DATETIME,
    DEPT VARCHAR(50)
);

INSERT INTO Worker VALUES
(1, 'Monika', 'Arora', 100000, '2014-02-20 09:00:00', 'HR'),
(2, 'Niharika', 'Verma', 80000, '2014-06-11 09:00:00', 'Admin'),
(3, 'Vishal', 'Singhal', 300000, '2014-02-20 09:00:00', 'HR'),
(4, 'Amitabh', 'Singh', 500000, '2014-02-20 09:00:00', 'Admin'),
(5, 'Vivek', 'Bhati', 500000, '2014-06-11 09:00:00', 'Admin'),
(6, 'Vipul', 'Diwan', 200000, '2014-06-11 09:00:00', 'Account'),
(7, 'Satish', 'Kumar', 75000, '2014-01-20 09:00:00', 'Account'),
(8, 'Geetika', 'Chauhan', 90000, '2014-04-11 09:00:00', 'Admin');

CREATE TABLE Bonus (
    WORKER_REF_ID INT,
    BONUS_DATE DATETIME,
    BONUS_AMOUNT INT,
    foreign key(worker_ref_id) references worker(worker_id)
);

INSERT INTO Bonus VALUES
(1, '2016-02-20 00:00:00', 5000),
(2, '2016-06-11 00:00:00', 3000),
(3, '2016-02-20 00:00:00', 4000),
(1, '2016-02-20 00:00:00', 4500),
(2, '2016-06-11 00:00:00', 3500);

CREATE TABLE Title (
    WORKER_REF_ID INT,
    WORKER_TITLE VARCHAR(50),
    AFFECTED_FROM DATETIME,
    FOREIGN KEY (WORKER_REF_ID) REFERENCES Worker(WORKER_ID) 
);

INSERT INTO Title VALUES
(1, 'Manager', '2016-02-20 00:00:00'),
(2, 'Executive', '2016-06-11 00:00:00'),
(8, 'Executive', '2016-06-11 00:00:00'),
(5, 'Manager', '2016-06-11 00:00:00'),
(4, 'Asst. Manager', '2016-06-11 00:00:00'),
(7, 'Executive', '2016-06-11 00:00:00'),
(6, 'Lead', '2016-06-11 00:00:00'),
(3, 'Lead', '2016-06-11 00:00:00');

select *
from title;

-- 1
select Fname as WORKER_NAME
from worker;

-- 2
select ucase(Fname)
from worker;

select lcase(Lname)
from worker;

select lower(lname)
from worker;

-- 3
select distinct(dept)
from worker;

-- 4
select *
from worker
order by Fname asc;

-- 5
select *
from worker
order by Fname asc,dept desc;

-- 6
select *
from worker
where Fname='Vipul' or Fname='Satish';

select *
from worker
where Fname in('Vipul','Satish');

-- 7
select *
from worker
where Fname not in('Vipul','Satish');

-- 8
select *
from worker
where FNAME like '%a%';

-- 9
select *
from worker
where SALARY between 100000 and 500000;

select *
from worker
where salary>=100000 and salary<=500000;

-- 10
select dept,count(worker_id)
from worker
group by dept
order by dept desc;