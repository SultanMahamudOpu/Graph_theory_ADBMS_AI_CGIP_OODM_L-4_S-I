use adbms;

CREATE TABLE salesman (
    salesman_id int,
    name VARCHAR(50),
    city VARCHAR(50),
    commission DECIMAL(4, 2)
);

INSERT INTO salesman VALUES
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14);

CREATE TABLE Customer (
    customer_id int,
    cust_name VARCHAR(50),
    city VARCHAR(50),
    grade INT,
    salesman_id INT
);

INSERT INTO Customer VALUES
(3002, 'Nick Rimando', 'New York', 100, 5001),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3008, 'Julian Green', 'London', 300, 5002);

CREATE TABLE orders (
    ord_no INT ,
    purch_amt DECIMAL(10, 2),
    ord_date DATE,
    customer_id INT,
    salesman_id INT
);

INSERT INTO orders (ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES
(70001, 150.50, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001),
(70004, 110.50, '2012-08-17', 3009, 5003);

-- 1 Find the salesperson and customer who reside in the same city. 
-- Return Salesman, cust_name and city.

select s.name,c.cust_name,c.city
from salesman s
join customer c on s.city=c.city;

SELECT s.name AS Salesman, c.cust_name, c.city 
FROM salesman s, Customer c 
WHERE s.city = c.city;

-- 2 Find salespeople who received commissions of more than 12 percent from the company. 
-- Return Customer Name, customer city, Salesman name, commission.

select c.cust_name,c.city,s.name,s.commission
from salesman s
join customer c on s.salesman_id=c.salesman_id
where s.commission>0.12;

-- 3 Find those customers with a grade less than 300.
-- Return cust_name, customer city, grade, Salesman, salesmancity. Order by customer_id ascending.

select c.cust_name,c.city,c.grade,s.name,s.city
from customer c
join salesman s on c.salesman_id=s.salesman_id
where c.grade<300
order by customer_id asc;

-- 4 Find those orders where the order amount exists between 500 and 2000.
-- Return ord_no, purch_amt, cust_name, city.

select o.ord_no,o.purch_amt,c.cust_name,c.city
from orders o
join customer c on o.customer_id=c.customer_id
where o.purch_amt between 100 and 200;

-- 5 Find those orders those are placed in October and November.
-- Return cust_name, salesman_name and order_date.

select c.cust_name,s.name,o.order_data
from customer c
join orders s on c.customer_id=o.customer_id
where month(ord_date) in(10,11);

-- 6 Find the customers those are not placed any order.
-- Return cust_name, salesman_name.

select c.cust_name,s.name
from customer c
join orders o on c.salesman_id=o.salesman_id
join salesman s on s.salesman_id=c.salesman_id
where o.ord_no is null;

SELECT c.cust_name, s.name AS salesman_name 
FROM Customer c 
LEFT JOIN orders o ON c.customer_id = o.customer_id 
JOIN salesman s ON c.salesman_id = s.salesman_id 
WHERE o.ord_no IS NULL;


-- -- -- -- -- -- -- -- -- -- -- -- -- -- 
-- 1
select s.name,c.cust_name,c.city
from customer c
join salesman s on c.city=s.city;

-- 2
select c.cust_name,c.city,s.name,s.commission
from customer c
join salesman s on c.salesman_id=s.salesman_id
where s.commission>0.12;

-- 3
select c.cust_name,c.city,c.grade,s.name,s.city
from customer c
join salesman s on c.salesman_id=s.salesman_id
where c.grade<300;

-- 4
select o.ord_no,o.purch_amt,c.cust_name,c.city
from customer c
join orders o on c.customer_id=o.customer_id
where  o.purch_amt between 100 and 500;

-- 5
select c.cust_name,s.name,o.ord_date
from customer c
join orders o on c.salesman_id=c.salesman_id
join salesman s on s.salesman_id=c.salesman_id
where month(o.ord_date) in(9,10);

-- 6
select c.cust_name,s.name
from customer c
LEFT JOIN orders o ON c.customer_id = o.customer_id 
JOIN salesman s ON c.salesman_id = s.salesman_id 
where ord_no is null;



-- -------------------------------------------------------------
-- 1
select s.name,c.cust_name,c.city
from customer c
join salesman s on c.city=s.city;

-- 2
select c.cust_name,c.city,s.name,s.commission
from customer c
join salesman s on s.salesman_id=c.salesman_id
where s.commission>0.12;

-- 3
select c.cust_name,c.city,c.grade,s.name,s.city
from customer c
join salesman s on s.salesman_id=c.salesman_id
where c.grade<300
order by customer_id asc;

-- 4
select o.ord_no,o.purch_amt,c.cust_name,c.city
from customer c
join orders o on o.customer_id=c.customer_id
where o.purch_amt between 100 and 200;

-- 5
select c.cust_name,s.name,o.ord_date
from customer c
join orders o on o.salesman_id=c.salesman_id
join salesman s on s.salesman_id=o.salesman_id
where month(o.ord_date) in(10,11);

-- 6
select c.cust_name,s.name
from customer c
left join orders o on c.customer_id=o.customer_id
join salesman s on s.salesman_id=c.salesman_id
where o.ord_no is null;

