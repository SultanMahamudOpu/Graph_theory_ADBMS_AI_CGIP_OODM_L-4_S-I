use newadbms;

-- 1
create table studentTable(
	stuId int,
    stuName varchar(100),
    stuSub varchar(50),
    stuMark int,
    stuAge int
);


-- 2
insert into studentTable values
(101,'Akhil','BCA101',85,20),
(102,'Balaram','BCA104',78,19),
(103,'Bheem','BCA102',80,22),
(104,'Chetan','BCA103',95,20),
(105,'Diksha','BCA104',99,20),
(106,'Raman','BCA105',88,19),
(107,'Sheetal','BCA103',98,22);

create table subject(
	stuSub varchar(50),
	subName varchar(100)
);

INSERT INTO subject  VALUES
('BCA101', 'C'),
('BCA102', 'C++'),
('BCA103', 'Principle of Management'),
('BCA104', 'Core Java'),
('BCA105', 'Math'),
('BCA106', 'Android');

select *
from studentTable;

-- 3
select *
from studentTable
where stuSub='BCA103';

-- 4
select min(stuMark),max(stuMark)
from studentTable;

-- 5
select *
from studentTable
limit 1;

-- 6
select *
from studentTable
order by stuId desc
limit 1;

-- 7
select *
from studentTable
limit 5;

-- 8
select *
from studentTable
order by stuId desc
limit 5;

-- 9
select *
from studentTable
where stuName like 'B%';

-- 10
select *
from studentTable
order by stuName desc;