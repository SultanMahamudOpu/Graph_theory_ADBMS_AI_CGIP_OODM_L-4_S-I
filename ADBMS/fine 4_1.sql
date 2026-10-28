use adbms;

-- Create Customer Table
CREATE TABLE CustomerF (
    CustomerID INT,
    Name VARCHAR(50),
    City VARCHAR(50)
);

INSERT INTO CustomerF VALUES
(1, 'Mike', 'New York'),
(2, 'Alice', 'Los Angeles'),
(3, 'Sara', 'Chicago'),
(4, 'Jane', 'New York');

-- Create Orders Table
CREATE TABLE OrdersF (
    OrderID INT,
    CustomerID INT,
    OrderDate DATE,
    OrderTotal DECIMAL(10, 2)
);

INSERT INTO OrdersF VALUES
(100, 1, '2025-07-01', 100.00),
(101, 2, '2025-06-15', 50.00),
(102, 3, '2025-07-05', 150.00),
(103, 1, '2025-07-07', 75.00),
(104, 4, '2025-07-02', 200.00);

-- 1 Find the total number of orders placed by each customer, excluding orders placed in June.
select c.name,count(o.OrderID)
from customerF c
join ordersF o on c.customerid=o.customerid
where month(o.OrderDate) not in(6)
group by c.name,c.customerid;

-- 2 Find the customer who has placed the highest total order value
select c.name,sum(o.orderTotal)
from customerF c
join ordersF o on c.customerid=o.customerid
group by c.name,c.customerid;

-- 3 List all orders placed on specific dates (e.g., 2025-07-04 and 2025-07-06) and their corresponding customer names.

select o.OrderID, o.OrderDate,c.name
from OrdersF o
join CustomerF c on c.customerid=o.customerid
where o.OrderDate in('2025-07-24','2025-07-06');

-- 4 Find the average order value for each city
select c.city, avg(o.orderId), count(o.orderid)
from customerf c
join ordersf o on c.customerid=o.customerid
group by c.city;

-- 5 Identify customers who haven't placed any orders
select name
from customerf
where customerid not in(select distinct customerId
					from ordersf);
                    
                    

-- 1
select c.name,count(*)
from customerF c
join ordersf o on c.customerid=o.customerid
where month(o.orderdate) not in(6)
group by c.name;

-- 2
select c.name,sum(orderTotal) as tt
from customerf c
join ordersf o on c.customerid=o.customerid
group by c.name
order by tt desc
limit 1;

-- 3
select c.name,o.orderdate
from customerf c
join ordersf o on c.customerid=o.customerid
where o.orderdate='2025-07-04' and o.orderdate='2025-07-06';

-- 4
select c.city,avg(o.ordertotal)
from customerf c
join ordersf o on c.customerid=o.customerid
group by c.city;

-- ------------------------------
-- 1
select c.name,count(*)
from customerf c
join ordersf o on c.CustomerID=o.CustomerID
where month(o.OrderDate) not in(6)
group by c.name;


-- 2
select c.name,sum(o.OrderTotal) as tt
from customerf c
join ordersf o on c.CustomerID=o.CustomerID
group by c.name
order by tt desc
limit 1;

-- 3
select o.orderdate,c.name
from customerf c
join ordersf o on c.CustomerID=o.customerId
where o.orderdate not in('2025-07-04','2020-07-06');

-- 4
select c.city, avg(o.ordertotal)
from customerf c
join ordersf o on c.CustomerID=o.customerId
group by c.city;

-- 5
select c.name
from customerf c
join ordersf o on c.CustomerID=o.customerId
where c.CustomerID not in (select distinct o.CustomerID
							from ordersf o);