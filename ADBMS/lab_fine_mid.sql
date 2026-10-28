use adbms;

-- 1. Create CUSTOMER Table
CREATE TABLE CUSTOMERL (
    c_no INT PRIMARY KEY,
    c_name VARCHAR(50),
    c_address VARCHAR(100)
);

-- 2. Create TRUCK Table
CREATE TABLE TRUCK (
    t_no INT PRIMARY KEY,
    driver_name VARCHAR(50)
);

-- 3. Create PACKET Table
CREATE TABLE PACKET (
    p_no INT PRIMARY KEY,
    c_no INT,
    t_no INT,
    date_of_booking DATE,
    weight DECIMAL(10, 2),
    destination VARCHAR(50)
);


-- Insert Data into CUSTOMER
INSERT INTO CUSTOMERl (c_no, c_name, c_address) VALUES
(101, 'Rahim', 'Dhaka'),
(102, 'Karim', 'Chittagong'),
(103, 'Sultana', 'Sylhet'),
(104, 'John', 'London');

-- Insert Data into TRUCK
INSERT INTO TRUCK VALUES
(501, 'RAJA'),       -- Query তে RAJA নামের ড্রাইভার চাওয়া হয়েছে
(502, 'Bilal'),
(503, 'Sujon');

-- Insert Data into PACKET
INSERT INTO PACKET VALUES
-- Rahim (101) sending packets
(1, 101, 501, '2025-01-01', 5.00, 'BOMBAY'),   -- >1kg packet to BOMBAY (For Query ii)
(2, 101, 502, '2025-01-02', 0.50, 'DHAKA'),    -- <1kg packet (For Query iii)

-- Karim (102) sending packets
(3, 102, 501, '2025-01-03', 12.00, 'KHULNA'),
(4, 102, 501, '2025-01-04', 2.00, 'BOMBAY'),

-- Sultana (103) sending packets (Only light packets)
(5, 103, 503, '2025-01-05', 0.80, 'RAJSHAHI'), -- <1kg packet
(6, 103, 502, '2025-01-06', 0.40, 'DHAKA'),    -- <1kg packet

-- Additional data for aggregation
(7, 104, 501, '2025-01-07', 20.00, 'BOMBAY');

select *
from packet;

-- 1 customer more tha 10 packets
-- group by তে হইল সেটা select নিব সেটাই দিতে হবে
select destination,count(*)
from packet
group by destination
having count(*)>1;

-- 2 Name of customers who have sent at least one packet of weight more than one kg to 'BOMBAY'.
select distinct c.c_name
from customerL c
join packet p on c.c_no=p.c_no
where p.destination='bombay' and p.weight>1;


-- 3 Name of all customers whose packets were delivered by a driver whose name is 'RAJA'.
select distinct c.c_name
from customerl c
join packet p on c.c_no=p.c_no
join truck t on p.t_no=t.t_no
where t.driver_name='raja';

-- 4 Top three customers name in terms of total packet weight sent by them (descending order of total weight).
select c.c_name,sum(p.weight) as tw
from customerl c
join packet p on c.c_no=p.c_no
group by c.c_name
order by tw desc
limit 3;

-- 5 Name of all customers whose individual shipments are less than one kg
select distinct c.c_name
from customerl c
join packet p on c.c_no=p.c_no
where p.weight<1;

SELECT C.c_name
FROM CUSTOMERl C
JOIN PACKET P ON C.c_no = P.c_no
GROUP BY C.c_name, C.c_no
HAVING MAX(P.weight) < 1;


-- ---------------------------------------
-- 1
select destination,count(*)
from packet
group by destination
having count(*)>1;

-- 2
select c.c_name,p.weight,p.destination
from customerL c
join packet p on p.c_no=c.c_no
where p.weight>1 and p.destination='bombay';

-- 3
select distinct c.c_name
from customerl c
join packet p on p.c_no=c.c_no
join truck t on t.t_no=p.t_no
where t.driver_name='raja';

-- 4
select c.c_name,sum(weight) as ww
from customerl c
join packet p on c.c_no=p.c_no
group by c.c_name
order by ww desc
limit 3;

-- 5
select distinct c.c_name
from customerl c
join packet p on c.c_no=p.c_no
where p.weight<1;

