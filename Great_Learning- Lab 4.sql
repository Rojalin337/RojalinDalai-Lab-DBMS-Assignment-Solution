create database ecom;
use ecom;
show tables in ecom;
select * from ecom.supplier;
create table ecom.supplier(SUPP_ID int primary key,SUPP_NAME varchar(50) not null,
                      SUPP_CITY varchar(50) not null, SUPP_PHONE varchar(50) not null);
insert into ecom.supplier values(1, 'Rajesh Retails',' Delhi','1234567890');
insert into ecom.supplier values(2, 'Appario Ltd.','Mumbai','2589631470');
insert into ecom.supplier values(3, 'Knome products', 'Banglore ','9785462315');
insert into ecom.supplier values(4, 'Bansal Retails','Kochi', '8975463285');
insert into ecom.supplier values(5, 'Mittal Ltd.', 'Lucknow' ,'7898456532');

create table ecom.customer(CUS_ID int primary key,CUS_NAME varchar(50) not null,
				CUS_PHONE varchar(50) not null,CUS_CITY varchar(50) not null, CUS_GENDER char);
select * from ecom.customer;
insert into ecom.customer values(1,'AAKASH', '9999999999', 'DELHI', 'M');
insert into ecom.customer values(2,'AMAN', '9785463215', 'NOIDA' ,'M');
insert into ecom.customer values(3,'NEHA', '9999999999' ,'MUMBAI', 'F');
insert into ecom.customer values(4,'MEGHA' ,'9994562399' ,'KOLKATA', 'F');
insert into ecom.customer values(5,'PULKIT' ,'7895999999', 'LUCKNOW', 'M');

create table ecom.category(CAT_ID int primary key, CAT_NAME varchar(20) not null);
select * from ecom.category;
insert into ecom.category values(1,'BOOKS');
insert into ecom.category values(2,'GAMES');
insert into ecom.category values(3,'GROCERIES');
insert into ecom.category values(4,'ELECTRONICS');
insert into ecom.category values(5,'CLOTHES');

create table ecom.product(PRO_ID int primary key, PRO_NAME varchar(20) not null default "Dummy",
PRO_DESC varchar(60), CAT_ID int, foreign key(CAT_ID) references category(CAT_ID));
select * from ecom.product;
insert into ecom.product values(1 ,'GTA V', 'Windows 7 and above with i5 processor and 8GB RAM', 2);
insert into ecom.product values(2,'TSHIRT', 'SIZE-L with Black, Blue and White variations', 5);
insert into ecom.product values(3, 'ROG LAPTOP', 'Windows 10 with 15inch screen, i7 processor, 1TB SSD',4);
insert into ecom.product values(4, 'OATS', 'Highly Nutritious from Nestle',3);
insert into ecom.product values(5, 'HARRY POTTER','Best Collection of all time by J.K Rowling',1);
insert into ecom.product values (6 ,'MILK','1L Toned MIlk', 3);
insert into ecom.product values(7,'Boat Earphones', '1.5Meter long Dolby Atmos', 4);
insert into ecom.product values(8, 'Jeans', 'Stretchable Denim Jeans with various sizes and color', 5);
insert into ecom.product values(9, 'Project IGI', 'compatible with windows 7 and above', 2);
insert into ecom.product values(10, 'Hoodie', 'Black GUCCI for 13 yrs and above', 5);
insert into ecom.product values(11, 'Rich Dad Poor Dad', 'Written by RObert Kiyosaki', 1);
insert into ecom.product values(12, 'Train Your Brain' ,'By Shireen Stephen', 1);


create table ecom.supplier_pricing(PRICING_ID int primary key,PRO_ID int, foreign key(PRO_ID) references ecom.product(PRO_ID), 
SUPP_ID int , foreign key(SUPP_ID) references ecom.supplier(SUPP_ID),SUPP_PRICE int default 0);
select * from ecom.supplier_pricing;
INSERT INTO ecom.supplier_pricing VALUES(1, 1, 2, 1500);
INSERT INTO ecom.supplier_pricing VALUES(2, 3, 5, 30000);
INSERT INTO ecom.supplier_pricing VALUES(3, 5, 1, 3000);
INSERT INTO ecom.supplier_pricing VALUES(4,2, 3 ,2500);
INSERT INTO ecom.supplier_pricing VALUES(5,4, 1 ,1000);


create table ecom.order(ORD_ID int primary key, ORD_AMOUNT int not null, ORD_DATE date not null,
CUS_ID int , foreign key(CUS_ID) references ecom.customer(CUS_ID),PRICING_ID int,foreign key(PRICING_ID) references ecom.supplier_pricing(PRICING_ID));
select * from ecom.order;
INSERT INTO ecom.order VALUES (101,1500,"2021-10-06",2,1);
INSERT INTO ecom.order VALUES(102,1000,"2021-10-12",3,5);
INSERT INTO ecom.order VALUES(103,30000,"2021-09-16",5,2);
INSERT INTO ecom.order VALUES(104,1500,"2021-10-05",1,1);
INSERT INTO ecom.order VALUES(105,3000,"2021-08-16",4,3);
INSERT INTO ecom.order VALUES(106,1450,"2021-08-18",1,9);
INSERT INTO ecom.order VALUES(107,789,"2021-09-01",3,7);
INSERT INTO ecom.order VALUES(108,780,"2021-09-07",5,6);
INSERT INTO ecom.order VALUES(109,3000,"2021-0-10",5,3);
INSERT INTO ecom.order VALUES(110,2500,"2021-09-10",2,4);
INSERT INTO ecom.order VALUES(111,1000,"2021-09-15",4,5);
INSERT INTO ecom.order VALUES(112,789,"2021-09-16",4,7);
INSERT INTO ecom.order VALUES(113,31000,"2021-09-16",1,8);
INSERT INTO ecom.order VALUES(114,1000,"2021-09-16",3,5);
INSERT INTO ecom.order VALUES(115,3000,"2021-09-16",5,3);
INSERT INTO ecom.order VALUES(116,99,"2021-09-17",2,14);


 create table ecom.rating(RAT_ID int primary key,ORD_ID int ,foreign key(ORD_ID)references ecom.order(ORD_ID),RAT_RATSTARS int not null);
 select * from ecom.rating;
INSERT INTO ecom.rating VALUES(1,101,4);
INSERT INTO ecom.rating VALUES(2,102,3);
INSERT INTO ecom.rating VALUES(3,103,1);
INSERT INTO ecom.rating VALUES(4,104,2);
INSERT INTO ecom.rating VALUES(5,105,4);
INSERT INTO ecom.rating VALUES(6,106,3);
INSERT INTO ecom.rating VALUES(7,107,4);
INSERT INTO ecom.rating VALUES(8,108,4);
INSERT INTO ecom.rating VALUES(9,109,3);
INSERT INTO ecom.rating VALUES(10,110,5);
INSERT INTO ecom.rating VALUES(11,111,3);
INSERT INTO ecom.rating VALUES(12,112,4);
INSERT INTO ecom.rating VALUES(13,113,2);
INSERT INTO ecom.rating VALUES(14,114,1);
INSERT INTO ecom.rating VALUES(15,115,1);
INSERT INTO ecom.rating VALUES(16,116,0);

/*Display the total number of customers based on gender who have placed orders of worth at least Rs.3000.*/
select CUS_GENDER as gender , count(distinct(CUS_ID)) as no_of_Customer from 
(select  X.CUS_ID, X.CUS_GENDER from ecom.customer as X inner join
(select CUS_ID from ecom.order where ORD_AMOUNT>=3000) as filter
on X.CUS_ID= filter.CUS_ID) as filter_order group by CUS_GENDER;

/*Display all the orders along with product name ordered by a customer having Customer_Id=2*/
select Detail.*, pro.PRO_NAME from ecom.product as pro inner join
(select ORD.*, P.PRO_ID from ecom.order as ORD inner join ecom.supplier_pricing  as P
on ORD.PRICING_ID=P.PRICING_ID where ORD.CUS_ID=2) as Detail 
on Detail.PRO_ID=pro.PRO_ID;

/*Display the Supplier details who can supply more than one product*/
select SUP.*,P.PRO_ID from ecom.supplier as SUP inner join ecom.supplier_pricing as P
on SUP.SUPP_ID=P.SUPP_ID  group by SUPP_ID having count(P.SUPP_ID)>1;

/*Find the least expensive product from each category and print the table with category id, name, product name and price of the product*/
select category.CAT_ID,category.CAT_NAME,min(T3.min_price) as Min_Price from category inner join
(select product.CAT_ID,product.PRO_NAME,T2.* from product inner join 
(select PRO_ID,min(SUPP_PRICE)  as min_price from ecom.supplier_pricing group by PRO_ID) as T2 where T2.PRO_ID=product.PRO_ID)
as T3 where T3.CAT_ID=category.CAT_ID group by T3.CAT_ID ;

 /*Display the Id and Name of the Product ordered after “2021-10-05”.*/
 select pro.PRO_ID,pro.PRO_NAME from ecom.product as  pro ,ecom.supplier_pricing as sp 
 where pro.PRO_ID=sp.PRO_ID and sp.PRICING_ID in (select PRICING_ID from ecom.order where ORD_DATE>"2021-10-05");
 
 /*Display customer name and gender whose names start or end with character 'A'*/
 select CUS_NAME,CUS_GENDER from ecom.customer where CUS_NAME like 'A%' or CUS_NAME like '%A';
 
 /*Create a stored procedure to display supplier id, name, rating and Type_of_Service. For Type_of_Service, If rating =5, print “Excellent 
Service”,If rating >4 print “Good Service”, If rating >2 print “Average Service” else print “Poor Service”.*/
DELIMITER &&
create procedure proc()
BEGIN
select repo.SUPP_ID,repo.SUPP_NAME,repo.Average,
CASE
when repo.Average=5 then "Excellent Service"
when repo.Average>4 then "Good Service"
when repo.Average>2 then "Average Service"
else "Poor Service"
END as "Type of Services" from 
(select final.SUPP_ID,supplier.SUPP_NAME, final.Average from
(select Test2.SUPP_ID ,sum(Test2.RAT_RATSTARS)/count(Test2.RAT_RATSTARS) as Average from
(select supplier_pricing.SUPP_ID,Test.ORD_ID,Test.RAT_RATSTARS from supplier_pricing inner join 
(select ORD.PRICING_ID,rating.RAT_RATSTARS,rating.ORD_ID from ecom.order as ORD inner join rating on ORD.ORD_ID=rating.ORD_ID) as Test
on Test.PRICING_ID=supplier_pricing.PRICING_ID) 
as Test2  group by supplier_pricing.SUPP_ID)
as final inner join supplier where final.SUPP_ID= supplier.SUPP_ID) as repo;
END &&
DELIMITER &&;

call proc()
