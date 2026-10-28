use adbms;

CREATE TABLE EmpInfoL (
    EmpID INT,
    EmpFname VARCHAR(50),
    EmpLname VARCHAR(50),
    Dept VARCHAR(50),
    Project VARCHAR(10),
    Address VARCHAR(50),
    DOB DATE,
    Gender CHAR(1)
);

INSERT INTO EmpInfoL VALUES
(1, 'Sanjay', 'Mehra', 'HR', 'P1', 'Hyderabad(HYD)', '1976-12-01', 'M'),
(2, 'Ananya', 'Mishra', 'Admin', 'P2', 'Delhi(DEL)', '1968-05-02', 'F'),
(3, 'Rohan', 'Diwan', 'Account', 'P3', 'Mumbai(BOM)', '1980-01-01', 'M'),
(4, 'Sonia', 'Kulkarni', 'HR', 'P1', 'Hyderabad(HYD)', '1992-05-02', 'F'),
(5, 'Ankit', 'Kapoor', 'Admin', 'P2', 'Delhi(DEL)', '1994-07-03', 'M');

CREATE TABLE EmpPosL (
    EmpID INT,
    Pos VARCHAR(50),
    DateOfJoining DATE,
    Salary INT
);

INSERT INTO EmpPosL VALUES
(1, 'Manager', '2022-03-01', 500000),
(2, 'Executive', '2022-05-02', 75000),
(3, 'Manager', '2022-04-01', 90000),
(2, 'Lead', '2022-06-02', 85000),
(1, 'Executive', '2022-05-01', 300000);

-- 1 Print the date of joining for all the employees whose name start with R.
select e.empfname,p.dateofjoining
from empinfol e
join empposl p on e.empid=p.empid
where e.EmpFname like 'r%';

-- 2 Print all the employee position hold by female gender.
select distinct e.empfname,p.pos,e.empid
from empinfol e
join empposl p on e.empid=p.empid
where e.gender='f';

-- 3 Print the average salary of male employees.
select avg(p.salary)
from empinfol e
join empposl p on e.empid=p.empid
where e.gender='m';

-- 4 Print the project names those are conducted from Delhi.
select distinct project
from empinfol
where address='Delhi(DEL)';

select distinct project,substring_index(address,'(',1)
from empinfol;

-- 5 Print the highest salary among all departments.
select max(salary)
from empposl ;

-- 6 Print the name, department and employee position from the above table.
select e.empfname,e.dept,p.pos
from empinfol e
join empposl p on e.empid=p.empid;

-- 7 Print all the employee names whose joining date in between March to June.
select distinct e.empfname
from empinfol e
join empposl p on e.empid=p.empid
-- where month(p.DateOfJoining) in(3,4,5,6); 
where month(p.DateOfJoining) between 3 and 6;

-- 8 Print the names and joining dates whose date of birth before 1975.
select e.empfname,p.DateOfJoining
from empinfol e
join empposl p on e.empid=p.empid
where year(dob)<1975;

-- 9 print all the last names of male those are manager.
select e.emplname
from empinfol e
join empposl p on e.empid=p.empid
where p.pos='manager' and e.gender='m';

-- 10 Print the names and genders those are in Lead position.
select e.empfname,e.gender
from empinfol e
join empposl p on e.empid=p.empid
where p.pos='lead';


-- ----------------------------
-- 1
select e.empfname
from empinfol e
join empposl p on p.empid=e.empid
where e.EmpFname like 'r%';

-- 2
select e.empfname,e.gender,p.pos
from empinfol e
join empposl p on p.empid=e.empid
where e.gender='f';

-- 3
select avg(p.salary)
from empinfol e
join empposl p on p.empid=e.empid
where e.gender='m';

-- 4
select distinct project,address
from empinfol
where address like '%delhi%';

-- 5
select max(salary)
from empposl;

select e.dept,count(*),max(salary)
from empinfol e
join empposl p on p.empid=e.empid
group by e.dept;

-- 6
select e.empfname,e.dept,p.pos
from empinfol e
join empposl p on p.empid=e.empid;

-- 7
select e.empfname,p.DateOfJoining
from empinfol e
join empposl p on p.empid=e.empid
where month(p.DateOfJoining) between 3 and 6;

-- 8
select e.empfname,p.dateofjoining,e.dob
from empinfol e
join empposl p on p.empid=e.empid
where year(e.dob)<1975;

-- 9
select e.emplname,p.pos
from empinfol e
join empposl p on p.empid=e.empid
where e.gender='m' and p.pos='manager';

-- 10
select e.emplname,p.pos,e.gender
from empinfol e
join empposl p on p.empid=e.empid
where p.pos='lead';