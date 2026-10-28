use adbms;

create table emp(
	eid int,
    ename varchar(100),
    salary int
);

drop table emp;

-- Insert into Emp
INSERT INTO Emp VALUES
(1, 'John Doe', 40000),      -- Salary < 50,000
(2, 'Santa', 55000),         -- Name 'Santa'
(3, 'Rahim', 45000),         -- Salary < 50,000
(4, 'Alice', 60000),
(5, 'Bob', 30000);

create table dept(
	eid int,
    dname varchar(100),
    managerid varchar(100),
    floorNumber int
);

truncate table emp;
-- Insert into Dept
INSERT INTO Dept VALUES
(1, 'IT', 4, 10),          -- Floor 10
(2, 'toys', 2, 5),         -- Dept 'toys'
(3, 'Accounts', 4, 10);    -- Floor 10

-- 1 Print all the names of all employees, who work on the 10th floor and earn salary less than Rs.50,000.
select *
from emp e
join dept d on e.eid=d.eid
where d.floorNumber=10 and e.salary<50000;


-- 2 Print the names of the departments that employee Santa works in.
select d.dname
from dept d
join emp e on e.eid=d.eid
where e.ename='Santa';

-- 3 Give every employee who works in the toys dept. at 10% raise in the salary.
set sql_safe_updates=0;
update emp e
join dept d on d.eid=e.eid
set salary=salary*1.10
where d.dname='toy';
set sql_safe_updates=1;

SELECT * 
FROM emp;

-- ------------------------------
-- 1
select e.ename
from emp e
join dept d on e.eid=d.eid
where d.floorNumber=10 and e.salary<50000;

-- 2
select e.ename,d.dname
from emp e
join dept d on d.eid=e.eid
where e.ename='santa';

-- 3
set sql_safe_updates=0;
update emp e
join dept d on d.eid=e.eid
set e.salary=e.salary*1.10
where d.dname='toys';

select *
from emp;