use adbms;

-- 1. Worker Table
CREATE TABLE WorkerJ (
    WORKER_ID INT PRIMARY KEY,
    FIRST_NAME VARCHAR(25),
    LAST_NAME VARCHAR(25),
    SALARY INT,
    JOINING_DATE DATETIME,
    DEPARTMENT VARCHAR(25)
);

drop table workerj;

INSERT INTO WorkerJ VALUES
(1, 'Monika', 'Arora', 100000, '2014-02-20 09:00:00', 'HR'),
(2, 'Niharika', 'Verma', 80000, '2014-06-11 09:00:00', 'Admin'),
(3, 'Vishal', 'Singhal', 300000, '2014-02-20 09:00:00', 'HR'),
(4, 'Amitabh', 'Singh', 500000, '2014-02-20 09:00:00', 'Admin'),
(5, 'Vivek', 'Bhati', 500000, '2014-06-11 09:00:00', 'Admin'),
(6, 'Vipul', 'Diwan', 200000, '2014-06-11 09:00:00', 'Account'),
(7, 'Satish', 'Kumar', 75000, '2014-01-20 09:00:00', 'Account'),
(8, 'Geetika', 'Chauhan', 90000, '2014-04-11 09:00:00', 'Admin');

-- 2. Bonus Table
CREATE TABLE BonusJ (
    WORKER_REF_ID INT,
    BONUS_DATE DATETIME,
    BONUS_AMOUNT INT,
    FOREIGN KEY (WORKER_REF_ID) REFERENCES Worker(WORKER_ID) ON DELETE CASCADE
);

INSERT INTO BonusJ VALUES
(1, '2016-02-20 00:00:00', 5000),
(2, '2016-06-11 00:00:00', 3000),
(3, '2016-02-20 00:00:00', 4000),
(1, '2016-02-20 00:00:00', 4500),
(2, '2016-06-11 00:00:00', 3500);

-- 3. Title Table
CREATE TABLE TitleJ (
    WORKER_REF_ID INT,
    WORKER_TITLE VARCHAR(25),
    AFFECTED_FROM DATETIME,
    FOREIGN KEY (WORKER_REF_ID) REFERENCES Worker(WORKER_ID) ON DELETE CASCADE
);

INSERT INTO TitleJ VALUES
(1, 'Manager', '2016-02-20 00:00:00'),
(2, 'Executive', '2016-06-11 00:00:00'),
(8, 'Executive', '2016-06-11 00:00:00'),
(5, 'Manager', '2016-06-11 00:00:00'),
(4, 'Asst. Manager', '2016-06-11 00:00:00'),
(7, 'Executive', '2016-06-11 00:00:00'),
(6, 'Lead', '2016-06-11 00:00:00'),
(3, 'Lead', '2016-06-11 00:00:00');

-- 1 Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending
select *
from workerj
order by first_name asc , department desc;

-- 2 Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”.
select *
from workerj
where department='admin';

-- 3 Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from the Worker table.
select *
from workerj
where FIRST_NAME not in('vipul','satish');

-- 4 Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
select *
from workerj
where salary between 100000 and 500000;

-- 5 Write an SQL query to fetch the no. of workers for each department in descending order.
select department,count(worker_id) as no_of_worker
from workerj
group by department
order by no_of_worker desc;

-- 6 Write an SQL query to fetch duplicate records having matching data in some fields of a table.
select first_name,count(*)
from workerj
group by first_name
having count(*)>1;

-- 7 Write an SQL query to show only even rows from a table.
select *
from workerj
where WORKER_ID%2=0;

-- 8 Write an SQL query to fetch intersecting records of two tables
select *
from workerj
where worker_id in(select worker_ref_id
					from bonusj);

-- intersect শুধু same number column এ কাজ করে
select worker_id
from workerj
intersect
select worker_ref_id
from bonusj;
                    
-- 9 Write an SQL query to show records from one table that another table does not have
select *
from workerj
where worker_id not in(select worker_ref_id
						from bonusj);
                        
select worker_id
from workerj
except
select worker_ref_id
from bonusj;
-- 10 Write an SQL query to show the top n (say 10) records of a table.
select *
from workerj
order by worker_id asc
limit 5;


-- - -- -- -- -- -----------
-- 5
select department, count(*) as tt
from WorkerJ
group by department
order by tt desc;

-- 8
select *
from workerj 
where worker_id in(select worker_ref_id
					from bonusj);
                    
SELECT DISTINCT w.*
FROM Worker w
INNER JOIN Bonus b
ON w.WORKER_ID = b.WORKER_REF_ID;
                    
-- 9
select *
from workerj
where worker_id not in(select worker_ref_id
						from bonusj);
                        

-- ------------------------------
-- 1
(select *
from workerj
order by FIRST_NAME asc,department desc);

-- 5
select department,count(*)
from workerj
group by department;

-- 6
select first_name,count(*)
from workerj
group by first_name
having count(*)>1;

-- 7
select *
from workerj
where WORKER_ID%2=0;

-- 8
select *
from workerj
where worker_id in(select distinct worker_ref_id
					from bonus);
                    
(select worker_id
from workerj)
intersect
(select worker_ref_id
from bonus);
-- 9
select *
from workerj
where worker_id not in(select distinct worker_ref_id
						from bonus);
                        
-- 10
select *
from workerj
order by worker_id desc
limit 3;

select *
from workerj w1
where 3-1=(select count(distinct(salary))
			from workerj w2
            where w2.salary>w1.salary);