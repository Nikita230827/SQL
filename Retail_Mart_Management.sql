-- Write a query to create a database named SQL basics.
create database SQL_basics;

-- Write a query to select the database SQL basics.
use SQL_basics;

/*  Write a query to create a product table with fields as 
product code, product name, price, stock and category, 
*/
create table product_table(
product_code int,
product_name varchar(20),
price int,
stock int,
catehory varchar(20)
);

-- create customer table with the fields as customer id, customer name, customer location,and customer phone number
create table customer_table(
customer_id int,
customer_name varchar(20),
customer_location varchar(30),
customer_phone_number int
);

-- create sales table with the fields as date, order number, product code, product name, quantity, and price.
create table sales_table (
date date,
order_number int,
product_code int,
product_name varchar(20),
quantity int,
price int
);

-- Write a query to insert values into   the tables.
insert into product_table values
(111,'ReynoldsPen',50,10,'Stationary'),
(112,'waterbottle',99,20,'Stationary'),
(113,'Screw',199,25,'Tools'),
(114,'NUT',99,22,'Tools'),
(115,'Bat',1059,35,'Sports');

insert into customer_table values
(1001,'Annad','LasVegas',341324),
(1852,'Noor','Chicago',916714),
(1212,'Jack','Miami',963284),
(1111,'Atula','Washington','874931'),
(1111,'Jen','Newyork','124949');

insert into sales_table values
('2022-12-21',154,534,'Mobile',1,21000),
('2022-11-19',134,512,'SchoolBag',1,499),
('2022-12-18',981,315,'CarToys',3,1599),
('2022-12-13',176,242,'Table',2,999),
('2022-12-21',254,134,'TV',1,1399);

select * from product_table;
select * from customer_table;
select * from sales_table;


-- Write a query to add two new columns such as S_no and categories to the sales table.
ALTER TABLE sales_table ADD COLUMN S_no INT, ADD COLUMN Categories VARCHAR(50);
desc sales_table;

-- Write a query to change the column type of stock in the product table to varchar.
alter table product_table
modify column stock varchar(34);

-- Write a query to change the table name from customer-to-customer details.
rename table customer_table to customer_details;

-- Write a query to drop the columns S_no and categories from the sales table.
alter table sales_table
drop column S_no,
drop column categories;

-- Write a query to display order id, customer id, order date, price, and quantity from the sales table.
select order_number,product_code,date,price,quantity
from sales_table;

-- Write a query to display all the details in the product table if the category is stationary.
select *
from product_table
where catehory = 'stationary';

-- Write a query to display a unique category from the product table.
select distinct catehory from product_table;

-- Write a query to display the sales details if quantity is greater than 2 and price is lesser than 500 from the sales table.
select *
from sales_table
where quantity<2
and price>499;

-- Write a query to display the customer’s name if the name start with a.
select customer_name
from customer_details
where customer_name like 'a%';

-- Write a query to display the product details in descending order of the price.
select * from product_table
order by price desc;

-- Write a query to display the product code and category from similar categories that are greater than or equal to 2.
select product_code , catehory
from product_table
where catehory in (
		select catehory
        from product_table
		group by catehory
        having count(*)>=2
);

-- Write a query to display the order number and the customer name to combine the results of the order and the customer tables including duplicate rows.
SELECT o.order_number, c.customer_name
FROM orders o
JOIN customers c ON o.customer_id = c.id;








