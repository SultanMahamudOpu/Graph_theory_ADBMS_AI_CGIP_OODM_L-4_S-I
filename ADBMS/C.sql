use newadbms;

create table employeeB(
	empID int,
    FName varchar(50),
    LName varchar(50),
    dept varchar(50),
    slalary int
);

INSERT INTO employeeB  VALUES
(1, 'John', 'Smith', 'HR', 50000),
(2, 'Jane', 'Doe', 'IT', 60000),
(3, 'Bob', 'Johnson', 'Finance', 55000),
(4, 'Mary', 'Brown', 'IT', 62000),
(5, 'Alice', 'White', 'Sales', 48000);

select *
from employeeB;

-- 1
select Fname,LName
from employeeB;

-- 2
select *
from employeeB
where dept='IT';

-- 3
select avg(slalary)
from employeeB;

-- 4
select *
from employeeB
order by slalary desc
limit 1;

select dept,count(*)
from employeeB
group by dept;

-- 5
select dept,count(dept)
from employeeB
group by dept;

-- 6
select *
from employeeB
where slalary>55000 and dept in('HR','Finance');

select *
from employeeB
where slalary>55000 and (dept='HR' or dept='Finance');

-- 7
select *
from employeeB
where Fname like '%a%';

-- 8
select sum(slalary)
from employeeB;

-- 9
select *
from employeeB
order by slalary desc
limit 1;

-- 10
set sql_safe_updates=0;
update employeeB
set slalary=56000
where FName='Bob' and LName='Johnson';
set sql_safe_updates=1;