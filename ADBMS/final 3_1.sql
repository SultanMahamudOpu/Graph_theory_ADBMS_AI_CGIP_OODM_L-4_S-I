use adbms;

-- Create DOCTOR Table
CREATE TABLE DOCTOR (
    id INT ,
    name VARCHAR(50),
    dept VARCHAR(50),
    gender CHAR(1),
    experience INT
);

-- Insert Data into DOCTOR
INSERT INTO DOCTOR (id, name, dept, gender, experience) VALUES
(101, 'MARRY', 'ENT', 'M', 12),
(104, 'SMITH', 'ORTHOPEDIC', 'M', 5),
(107, 'GEORGE', 'CARDIOLOGY', 'M', 10),
(114, 'LARA', 'SKIN', 'F', 3),
(109, 'K GEORGE', 'MEDICINE', 'F', 9),
(105, 'JOHNSON', 'ORTHOPEDIC', 'M', 10),
(117, 'LUCY', 'ENT', 'F', 3),
(111, 'BILL', 'MEDICINE', 'F', 12),
(130, 'MORPHY', 'ORTHOPEDIC', 'M', 15);

-- Create SALARY Table
CREATE TABLE SALARY (
    id INT,
    basic INT,
    allowances INT,
    consultation INT
);

-- Insert Data into SALARY
INSERT INTO SALARY  VALUES
(101, 12000, 1000, 300),
(104, 23000, 2300, 500),
(107, 32000, 4000, 500),
(114, 12000, 5200, 100),
(109, 42000, 1700, 200),
(105, 18900, 1690, 300),
(130, 21700, 2600, 300);

-- 1 Display name of all doctors who are in "MEDICINE" having more than 10 years' experience and basic salary more than 10000.

select *
from doctor d
join salary s on s.id=d.id
where d.dept='medicine' and d.experience>10 and s.basic>10000;

-- 2 Display the average of all the doctors working in "ENT" department using the table DOCTOR and (SALARY.salary = BASIC + ALLOWANCES).

select avg(s.basic+s.allowances) as SALARY
from doctor d
join salary s on s.id=d.id
where d.dept='ent';

-- 3 Display the highest consultation fee among all male doctors.
select max(s.consultation)
from doctor d
join salary s on d.id=s.id
where d.gender='m';

-- 4 Display the name and basic salary of all the doctors having less than 5 years' experience.

select d.name, s.basic
from doctor d
join salary s on d.id=s.id
where d.experience<5;

-- --------------------------------
-- 1
select d.name
from doctor d
join salary s on d.id=s.id
where d.dept='medicine' and d.experience>10 and s.basic>1000;

-- 2
select dept,avg(s.basic+s.allowances) as SALARY
from doctor d
join salary s on d.id=s.id
where d.dept='ent';

-- 3
select d.name,s.consultation
from doctor d
join salary s on d.id=s.id
order by s.consultation desc
limit 1;

-- 4
select d.name,s.basic
from doctor d
join salary s on d.id=s.id
where d.experience<5;