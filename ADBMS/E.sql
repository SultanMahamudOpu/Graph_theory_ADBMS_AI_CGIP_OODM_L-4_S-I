create database newADBMS;

use newADBMS;

-- 1
create table Employee(
	emp_num int,
    emp_name varchar(100),
    dept varchar(20),
    salary int
);

-- 2
insert into Employee values
(1,'Amit','CSE',680000),
(2,'Rishi','CSE',550000),
(3,'Prianka','CSE',430000);

select *
from employee;

-- 3
select *
from employee
where emp_num=2;

-- 4
select *
from employee
limit 2;

-- 5
select max(salary)
from employee
where salary< (select max(salary)
				from employee);

select salary
from employee
order by salary desc
limit 1 offset 1;

-- 6
select emp_name, (salary/12) as Monthly_Salary
from employee;

-- 7
select max(salary),min(salary),avg(salary)
from employee;

-- 8
select emp_num
from employee
where salary between 600000 and 690000;

-- for ques 9,10
create table new_employee(
	emp_num int,
    emp_name varchar(100),
    dept varchar(20),
    salary int
);

insert into new_employee values
(1,'Amit','CSE',680000),
(4,'Kabir','ECE',600000),
(5,'Salma','EEE',500000);

-- 9
(select *
from employee)
intersect
(select *
from new_employee);

-- 10
select *
from employee
except
select *
from new_employee;

