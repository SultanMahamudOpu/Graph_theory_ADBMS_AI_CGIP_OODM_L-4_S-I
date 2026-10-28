use adbms;

CREATE TABLE EmployeeInfo (
    EmpID INT PRIMARY KEY,
    EmpFname VARCHAR(50),
    EmpLname VARCHAR(50),
    Department VARCHAR(50),
    Project VARCHAR(10),
    Address VARCHAR(50),
    DOB DATE,
    Gender VARCHAR(10)
);

INSERT INTO EmployeeInfo VALUES
(1, 'Rohit', 'Gupta', 'Admin', 'P1', 'Delhi', '1979-12-02', 'Male'),
(2, 'Rahul', 'Mahajan', 'Admin', 'P2', 'Mumbai', '1986-10-10', 'Male'),
(3, 'Sonia', 'Banerjee', 'HR', 'P3', 'Pune', '1983-06-05', 'Female'),
(4, 'Ankita', 'Kapoor', 'HR', 'P4', 'Chennai', '1983-11-28', 'Female'),
(5, 'Swati', 'Garg', 'HR', 'P5', 'Delhi', '1991-04-06', 'Female');

CREATE TABLE EmployeePosition (
    EmpID INT,
    EmpPosition VARCHAR(50),
    DateOfJoining DATE,
    Salary INT,
    FOREIGN KEY (EmpID) REFERENCES EmployeeInfo(EmpID)
);

INSERT INTO EmployeePosition VALUES
(1, 'Executive', '2020-04-01', 75000),
(2, 'Manager', '2020-04-03', 500000),
(3, 'Manager', '2020-04-02', 150000),
(2, 'Officer', '2020-04-02', 90000),
(1, 'Manager', '2020-04-03', 300000);

-- 1
select ucase(empfname) as EmpName
from EmployeeInfo;

select upper(empfname) as EmpName
from employeeinfo;

-- 2
select department,count(empid)
from employeeinfo
where department='HR';

select department,count(*)
from employeeinfo
group by Department;

-- 3
select curdate();

-- 4
SELECT SUBSTRING_INDEX(Address, '(', 1) 
FROM EmployeeInfo;

select address
from employeeinfo;

-- 5
create table newWorker as 
select *
from worker;

select *
from newWorker;

-- 6
select empFname
from employeeinfo
where empFname like 'S%';

-- 7
select *
from employeeinfo as emp
join employeeposition as pos on pos.empid=emp.empid
where salary>=150000;

-- 8
select year('2026/5/9');

select empfname,year(dob)
from employeeinfo;

-- 9
select empfname,count(*)
from employeeinfo
group by empfname
having count(*)>1;


select empid,count(*)
from employeeposition
group by empid
having count(*)>1;
-- 10
select *
from employeeinfo
order by department;


-- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- 1
select upper(empfname)
from employeeinfo;

-- 2
select department,count(empid)
from employeeinfo
where department='hr';

-- 3
select current_date();

-- 4
select substring_index(address,'(',1)
from employeeinfo;

-- 5
create table newnew as
select *
from worker;

select *
from newnew;

-- 6
select EmpFname
from EmployeeInfo
where EmpFname like 's%';

-- 7
select *
from employeeinfo e
join employeeposition p on e.empid=p.empid
where p.salary>=150000;

-- 8
select year(dob)
from employeeinfo;

-- 9
select project,count(*)
from employeeinfo 
group by project
having count(*)>1;

-- 10
select *
from employeeinfo
order by department asc;

-- ----------------------

