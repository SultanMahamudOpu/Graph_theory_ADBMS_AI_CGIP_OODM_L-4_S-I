use adbms;

CREATE TABLE Student (
    StuID INT,
    FName VARCHAR(50),
    LaName VARCHAR(50),
    Age INT,
    GPA DECIMAL(3, 2),
    Major VARCHAR(50)
);

INSERT INTO Student  VALUES
(10001, 'John', 'Doe', 20, 3.75, 'Computer Science'),
(10002, 'Jane', 'Smith', 21, 3.90, 'Mathematics'),
(10003, 'Alice', 'Johnson', 22, 3.60, 'Physics'),
(10004, 'Bob', 'Wilson', 19, 3.45, 'Chemistry'),
(10005, 'Emily', 'Brown', 20, 3.85, 'Biology'),
(10006, 'Sarah', 'Lee', 21, 3.70, 'Computer Science'),
(10007, 'David', 'Anderson', 22, 3.55, 'Mathematics');

-- 1
select *
from student;

-- 2
select *
from student
where age>20;

-- 3
select *
from student
where Fname like 'A%';

-- 4
set sql_safe_updates=0;
update student
set gpa=2
where stuid=10002;
set sql_safe_updates=1;

select *
from student;

-- 5
delete from student
where stuid=10005;

select *
from student;

-- 6
create index idx_major
on student (Major);

show index 
from student;

-- 7
select *
from student
where age between 20 and 21;

-- 8
select *
from student
order by stuid desc
limit 5;


--
set sql_safe_update=0;
update student
set gpa=5
where stuid in(10001,10002);
--


-- 9
select max(gpa)
from student;

SELECT * 
FROM Student 
WHERE GPA = (SELECT MAX(GPA) 
			FROM Student);
            
-- 10
insert into student values
(1,'sultan','mahamud',26,4,'cse');

select *
from student;