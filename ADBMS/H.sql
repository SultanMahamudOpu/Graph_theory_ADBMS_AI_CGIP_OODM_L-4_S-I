use newadbms;

create table empDetails (
	empid int,
    empName varchar(50),
    dept varchar(20),
    contactNo int,
    email varchar(50),
    empHeadId int
);

insert into empDetails values
(101, 'Isha', 'E-101', '1234567890', 'isha@gmail.com', 105),
(102, 'Priya', 'E-104', '1234567890', 'priya@yahoo.com', 103),
(103, 'Neha', 'E-101', '1234567890', 'neha@gmail.com', 101),
(104, 'Rahul', 'E-102', '1234567890', 'rahul@yahoo.com', 105),
(105, 'Abhishek', 'E-101', '1234567890', 'abhishek@gmail.com', 102);

-- 1
select *
from empdetails
where empname like 'p%';

-- 2
select *
from empdetails
where email like '%gmail.com';

-- 3
select *
from empdetails
where dept='e-104' or dept='e-102';

select *
from empdetails
where dept in('e-104','e-102');

-- 4
select dept
from empdetails
where dept='e-102';

-- 5
select empname
from empdetails
where empname like '%a';

CREATE TABLE EmployeeInfo (
    EmpID INT,
    EmpFname VARCHAR(50),
    EmpLname VARCHAR(50),
    Dept VARCHAR(50),
    Project VARCHAR(10),
    Address VARCHAR(50),
    DOB DATE,
    Gender CHAR(1)
);

INSERT INTO EmployeeInfo VALUES
(1, 'Sanjay', 'Mehra', 'HR', 'P1', 'Hyderabad(HYD)', '1976-12-01', 'M'),
(2, 'Ananya', 'Mishra', 'Admin', 'P2', 'Delhi(DEL)', '1968-05-02', 'F'),
(3, 'Rohan', 'Diwan', 'Account', 'P3', 'Mumbai(BOM)', '1980-01-01', 'M'),
(4, 'Sonia', 'Kulkarni', 'HR', 'P1', 'Hyderabad(HYD)', '1992-05-02', 'F'),
(5, 'Ankit', 'Kapoor', 'Admin', 'P2', 'Delhi(DEL)', '1994-07-03', 'M');

create table empPosition(
	empId int,
    empPos varchar(100),
    dateOfJoin date,
    salary int
);

INSERT INTO EmpPosition VALUES
(1, 'Manager', '2022-05-01', 500000),
(2, 'Executive', '2022-05-02', 75000),
(3, 'Manager', '2022-05-01', 90000),
(2, 'Lead', '2022-05-02', 85000),
(1, 'Executive', '2022-05-01', 300000);

-- 6  3th highest
select *
from empPosition as e1
where 3-1=(select count(distinct salary)
			from empPosition as e2
            where e1.salary>e2.salary);
            
-- 7
select empid,count(*)
from empPosition
group by empid
having count(*)>1;

-- 8
(select *
from EmployeeInfo
order by empid asc
limit 1)
union
(select *
from employeeinfo
order by empid desc
limit 1);

-- 9
(select *
from EmployeeInfo as einfo
join EmpPosition as epos on einfo.empid=epos.empid
order by salary asc
limit 2)
union
(select *
from employeeinfo as einfo
join empposition as epos on einfo.empid=epos.empid
order by salary desc
limit 2);

-- 10
(select *
from EmployeeInfo
where mod(empid,2)=0)
union
(select *
from employeeinfo
where mod(empid,2)=1);


-- -- -- -- 
-- 6
select e1.salary
from empPosition e1
where 3-1=(select count(distinct(salary)) 
			from empPosition e2
            where e1.salary>e2.salary);

-- 7
select empid,count(*)
from empposition
group by empid
having count(*)>1;

-- 8
(select *
from employeeinfo
order by empid asc
limit 1)
union
(select *
from employeeinfo
order by empid desc
limit 1);

-- 9
(select *
from employeeinfo e
join EmpPosition d on e.empid=d.empid
order by d.salary asc
limit 2)
union
(select *
from employeeinfo e
join EmpPosition d on e.EmpID=d.EmpID
order by d.salary desc
limit 2);

-- 10
(select *
from employeeinfo
where empid%2=0)
union
(select *
from employeeinfo
where empid%2=1);

-- 6
select *
from empposition as e1
where 3-1=(select count(distinct salary)
			from empposition e2
            where e1.salary>e2.salary);

select *
from empposition
order by salary desc
limit 3 offset 1;
            
select *
from empPosition as e1
where 3-1=(select count(distinct salary)
			from empPosition as e2
            where e1.salary>e2.salary);
            
-- 7
select empid,count(*)
from empDetails
group by empid
having count(*)>1;

-- 8
(select *
from empdetails
order by empid asc
limit 1)
union
(select *
from empdetails
order by empid desc
limit 1);

-- 9
(select *
from EmpPosition
order by salary asc
limit 2)
union
(select *
from EmpPosition
order by salary desc
limit 2);

-- 10
(select *
from empdetails
where  empid%2=0)
union
(select *
from empdetails
where  empid%2=1);