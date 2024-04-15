-- Chapter 04 - Implementation

-- Scema Creation
CREATE DATABASE Online_Food_Ordering_System;
USE Online_Food_Ordering_System;

-- Table  Definitions
create table Administration (
	Admin_Id varchar(50) not null,
    First_name varchar(20) not null,
    Last_name varchar(20),
    UserName varchar(255) not null,
    Admin_password varchar(20) not null,
    Email varchar(255) ,
	primary key(Admin_Id)
);

create table Customer(
	Customer_Id varchar(10) not null,
    First_name varchar(20) not null,
    Last_name varchar(20) not null,
    Email varchar(30) ,
    Cus_Username varchar(255) not null,
    Cus_password varchar(50) not null,
	Address_no varchar(10) not null,
    Street varchar(20),
    City varchar(10) not null,
    Dateofbirth date not null,
    Age int,
    primary key(Customer_Id)
);

create table Customer_contact(
	Cus_Id varchar(10) not null,
    ContactNo varchar(25) not null,
    
    primary key(Cus_Id,ContactNo),
    constraint fk_Cus foreign key(Cus_Id) references Customer(Customer_Id)
);

create table Chef(
	Chef_Id varchar(10) not null,
    First_name varchar(20) not null,
    Last_name varchar(20) not null,
    Email varchar(30) ,
    Working_experience int, 
    HeadChef_Id varchar(10),
    primary key(Chef_Id),
    constraint fk_Chef foreign key(HeadChef_Id) references Chef(Chef_Id)
);


create table Chef_contact(
	Chef_Id varchar(10) not null,
    Contact_No varchar(25) not null,
    
    primary key(Chef_Id,Contact_No),
    constraint fk_Cheff foreign key(Chef_Id) references Chef(Chef_Id)
);


create table Orders(
	Order_Id varchar(10) not null,
    Order_date date not null,
    Order_Time time not null,
    Processed_by varchar(20) not null,
	Cust_Id varchar(20) not null,
    Order_status varchar(50) not null,
    Total_amount double not null,
    primary key(Order_Id),
    CONSTRAINT FK_ORDER foreign key(Processed_by) REFERENCES Administration(Admin_Id),
    CONSTRAINT fk_ord foreign key(Cust_Id) references Customer(Customer_Id)
);

create table Payment(
	Payment_Id varchar(10) not null,
    Payment_date date not null,
    Processed_by varchar(20) not null,
    Order_Id varchar(20) not null,
    Total_amount double not null,
    Payment_time time not null,
    primary key(Payment_Id),
    CONSTRAINT FK_payment foreign key(Processed_by) REFERENCES Administration(Admin_Id),
    CONSTRAINT fk_pymt foreign key(Order_Id) references Orders(Order_Id)
);


create table Discount(
	Type_name varchar(255) not null,
    Descriptions varchar(255) not null,
    pay_Id varchar(20) not null,
    
    constraint FK_Discount foreign key(pay_Id) references Payment(Payment_Id)
);

create table Menu_Item(
	Item_Id varchar(10) not null,
    Item_name varchar(20) not null,
    Availability boolean not null,
    Price double not null,
    Cheff_Id varchar(20),
    primary key(Item_Id),
    
    CONSTRAINT fk_menu foreign key(Cheff_Id) references Chef(Chef_Id)
);

create table Rating(
	Rating_Id varchar(10) not null,
	Cus_Id varchar(10) not null,
    Score int,
    Date_recorded date not null,
    primary key(Rating_Id),
    
    constraint fk_ratings foreign key(Cus_Id) references Customer(Customer_Id)
);

create table Feedback(
	Comments varchar(255) not null,
    Date_recorded date,
    RatingId varchar(10) not null,
    
    constraint fk_feedback foreign key(RatingId) references Rating(Rating_Id)
);

create table Loyality_points(
	Member_level varchar(255),
    Last_purcheseDate date,
    Total_points int,
    CusId varchar(50) not null,
    
    constraint fk_Loyality foreign key(CusId) references Customer(Customer_Id)
    
);

create table Order_MenuItem(
	OrderId varchar(10) not null,
    Menu_Item_ID varchar(10) not null,
	
    primary key(OrderId,Menu_Item_ID),
    
    constraint fk_orders foreign key(OrderId) references Orders(Order_Id),
	constraint fk_MenuItem foreign key(Menu_Item_ID) references Menu_Item(Item_Id)
);

create table MenuItem_Ratings(
	Rating_Id varchar(10) not null,
    MenuItem_ID varchar(10) not null,
	
    primary key(Rating_Id,MenuItem_ID),
    
    constraint fk_rating foreign key(Rating_Id) references Rating(Rating_Id),
	constraint fk_MenuIm foreign key(MenuItem_ID) references Menu_Item(Item_Id)
);


-- Insert Operations

INSERT INTO Administration 
VALUES ('Ad001', 'Kasun',  'De silva',  'Kasun123' , '12345', 'kasun123@gmail.com');
INSERT INTO Administration 
VALUES ('Ad002', 'Madhava',  'Fernando',  'Madhava123' , '24680', 'madhava123@gmail.com');
INSERT INTO Administration 
VALUES ('Ad003', 'Amanda',  'Rajapaksha',  'Amanda123' , '12456', 'amanda123@gmail.com');
INSERT INTO Administration 
VALUES ('Ad004', 'Dasun',  'Kalhara',  'Dasun058' , '45896', 'dasun123@gmail.com');
INSERT INTO Administration 
VALUES ('Ad005', 'Sithum',  'Guruge',  'Sithum123' , '15486', null );
INSERT INTO Administration 
VALUES ('Ad006', 'Raveen',  'Dhanusha',  'Raveen123' , '15865', null);


INSERT INTO customer
VALUES ('Cus_001', 'Ama',  'Wijerathne', 'Ama456@gmail.com', 'Ama123' , '15426', '1/22', 'New moore street', 'Dehiwala', '1999-07-06', '24');
INSERT INTO customer
VALUES ('Cus_002', 'Kamal',  'Suneera', 'kamal@gmail.com', 'kamal566' , '12546', '7/25', 'Mangala street', 'Maharagama','2000-05-22', '23');
INSERT INTO customer
VALUES ('Cus_003', 'Gayan',  'Kavinda', null , 'Gayan23' , '15165', '51/255', 'flower street', 'Colombo 02','1990-08-06', '33');
INSERT INTO customer
VALUES ('Cus_004', 'Sanduni',  'Fernando', null , 'Sandu123' , '145650', '85/2', 'Sripali Street', 'Dehiwala','1989-10-16', '34');
INSERT INTO customer
VALUES ('Cus_005', 'Shamika',  'Piyumal', 'Shamik@Ggmail.com', 'shamika125' , '46969', '1/75', 'Gamage street', 'Negambo','1992-12-05', '31');
INSERT INTO customer
VALUES ('Cus_006', 'Sayumi',  'Yuthara', 'Sayu99@gmail.com', 'sayu123' , '58962', '45/2', 'Gover street', 'Moratuwa','1999-10-12', '24');


INSERT INTO Customer_contact
VALUES ('Cus_001', '0765420593');
INSERT INTO Customer_contact
VALUES ('Cus_001', '0780215469');
INSERT INTO Customer_contact
VALUES ('Cus_002', '0712546395');
INSERT INTO Customer_contact
VALUES ('Cus_003', '0784669235');
INSERT INTO Customer_contact
VALUES ('Cus_003', '0712456987');
INSERT INTO Customer_contact
VALUES ('Cus_004', '0765420593');
INSERT INTO Customer_contact
VALUES ('Cus_005', '0715589756');
INSERT INTO Customer_contact
VALUES ('Cus_006', '0778945256');
INSERT INTO Customer_contact
VALUES ('Cus_006', '0784596253');

INSERT INTO chef
VALUES ('C001', 'Kalpa',  'Perera', 'kalpa152@gmail.com','20' , null );
INSERT INTO chef
VALUES ('C002', 'Priya',  'Amarasinghe', 'Priya45@gmail.com','15' , 'C001' );
INSERT INTO chef
VALUES ('C003', 'Ashen',  'Liyanage', 'ashen55@gmail.com','18' , 'C001' );
INSERT INTO chef
VALUES ('C004', 'Naveen',  'perera', null , '05' , 'C001' );
INSERT INTO chef
VALUES ('C005', 'Niranjan',  'Samarasinghe', 'Nira85@gmail.com','12' , 'C001' );
INSERT INTO chef
VALUES ('C006', 'Dharshana',  'Gamage', 'dhara123@gmail.com','06' , 'C001' );



INSERT INTO Chef_contact
VALUES ('C001', '0714568395');
INSERT INTO Chef_contact
VALUES ('C001', '0717852595');
INSERT INTO Chef_contact
VALUES ('C002', '0774455395');
INSERT INTO Chef_contact
VALUES ('C003', '0714588535');
INSERT INTO Chef_contact
VALUES ('C004', '0755314552');
INSERT INTO Chef_contact
VALUES ('C004', '0475893053');
INSERT INTO Chef_contact
VALUES ('C005', '0781256365');
INSERT INTO Chef_contact
VALUES ('C005', '0754896305');
INSERT INTO Chef_contact
VALUES ('C006', '0475896232');
INSERT INTO Chef_contact
VALUES ('C006', '0719584863');

INSERT INTO orders
VALUES('Order_001','2023-01-25', '00:08:30' , 'Ad001' , 'Cus_002' , 'Payment Confirmed', '1580.00');
INSERT INTO orders
VALUES('Order_002','2023-02-02', '00:10:50' , 'Ad005' , 'Cus_003' , 'Order completed', '4530.00');
INSERT INTO orders
VALUES('Order_003','2023-03-21', '00:11:20' , 'Ad002' , 'Cus_001' , 'Order completed', '1320.00');
INSERT INTO orders
VALUES('Order_004','2023-03-25', '00:22:30' , 'Ad001' , 'Cus_002' , 'Payment Confirmed', '8500.00');
INSERT INTO orders
VALUES('Order_005','2023-03-31', '00:21:45' , 'Ad006' , 'Cus_005' , 'Payment Confirmed', '4550.00');
INSERT INTO orders
VALUES('Order_006','2023-04-12', '00:12:35' , 'Ad003' , 'Cus_004' , 'Payment being verified', '2100.00');
INSERT INTO orders
VALUES('Order_007','2023-04-25', '00:09:42' , 'Ad003' , 'Cus_006' , 'Payment Confirmed', '3680.00');
INSERT INTO orders
VALUES('Order_008', '2023-05-23', '00:20:38' , 'Ad004' , 'Cus_006' , 'Order completed', '1850.00');

INSERT INTO payment
VALUES('Pay_001', '2023-05-23', 'Ad001' , 'Order_001' , '1580.00', '00:08:38' );
INSERT INTO payment
VALUES('Pay_002', '2023-02-02', 'Ad002' , 'Order_003' , '1320.00', '00:10:35' );
INSERT INTO payment
VALUES('Pay_003', '2023-03-21', 'Ad003' , 'Order_007' , '3680.00', '00:21:46' );
INSERT INTO payment
VALUES('Pay_004', '2023-05-23', 'Ad001' , 'Order_004' , '8500.00', '00:11:50' );
INSERT INTO payment
VALUES('Pay_005', '2023-04-25', 'Ad003' , 'Order_006' , '2100.00', '00:12:14' );
INSERT INTO payment
VALUES('Pay_006', '2023-04-12', 'Ad004' , 'Order_008' , '1850.00', '00:20:30' );


INSERT INTO discount
VALUES('Birthday sale','Enjoy 10% off on your bill','Pay_006');
INSERT INTO discount
VALUES('Christmas Season Offer','Get 15% off on your bill','Pay_001');
INSERT INTO discount
VALUES('Special Sunday Offer','Try something every sunday at up to 20% off','Pay_003');
INSERT INTO discount
VALUES('Weekend Deals','Special dishes with 50% off on your bill','Pay_002');
INSERT INTO discount
VALUES('Summer promotion','Save 20% on your bill','Pay_004');
INSERT INTO discount
VALUES('New Year season Offer','Enjoy with 30% off on your bill','Pay_005');

INSERT INTO Menu_item 
VALUES  ('Item_001', 'Burger' ,true , '1200.00', 'C001');
INSERT INTO Menu_item 
VALUES  ('Item_002', 'Pasta' , true , '1750.00', 'C005');
INSERT INTO Menu_item 
VALUES  ('Item_003', 'Pizza' , true , '2100.00', 'C002');
INSERT INTO Menu_item 
VALUES  ('Item_004', 'Sandwiches' , true , '1250.00', 'C004');
INSERT INTO Menu_item 
VALUES  ('Item_005', 'Chicken submarine' , true , '1700.00', 'C003');
INSERT INTO Menu_item 
VALUES  ('Item_006', 'Noodles' , true , '1450.00', 'C002');
INSERT INTO Menu_item 
VALUES  ('Item_007', 'Fried chicken' , true , '2300.00', 'C006');


INSERT INTO Rating
VALUES ('R1', 'Cus_001', '5' , '2023-10-21');
INSERT INTO Rating
VALUES ('R2', 'Cus_002', '3' , '2023-08-09');
INSERT INTO Rating
VALUES ('R3', 'Cus_003', '5' , '2022-12-25');
INSERT INTO Rating
VALUES ('R4', 'Cus_005', '4' , '2022-11-29');
INSERT INTO Rating
VALUES ('R5', 'Cus_004', '5' , '2023-01-12');
INSERT INTO Rating
VALUES ('R6', 'Cus_006', '4' , '2023-02-23');


INSERT INTO feedback
VALUES ('Portions were generous, value for money.',  '2023-02-23','R1');
INSERT INTO feedback
VALUES ('Great variety of menu options and excellent quality.', '2023-08-09','R2');
INSERT INTO feedback
VALUES ('Quick delivery and the food was delicious!',  '2022-12-25','R3');
INSERT INTO feedback
VALUES ('The packaging was perfect, no spills or mess.',  '2022-11-29','R4');
INSERT INTO feedback
VALUES ('Impressed with the freshness of ingredients.',  '2023-01-15','R5');
INSERT INTO feedback
VALUES ('Timely updates on order status, appreciated.',  '2023-03-02','R6');

INSERT INTO Loyality_points
VALUES ('Silver',  '2023-03-02','102', 'Cus_001');
INSERT INTO Loyality_points
VALUES ('Silver',  '2023-05-14','145', 'Cus_002');
INSERT INTO Loyality_points
VALUES ('Gold',  '2023-01-25','195', 'Cus_004');
INSERT INTO Loyality_points
VALUES ('Platinum',  '2023-07-06','202', 'Cus_003');
INSERT INTO Loyality_points
VALUES ('Gold',  '2022-12-27','157', 'Cus_005');
INSERT INTO Loyality_points
VALUES ('Silver',  '2023-08-09','130', 'Cus_006');


-- Update Operations
Update Administration
set First_name = 'Mihiran', Last_name = 'Perera', UserName = 'Mihi123', Admin_password = '12305' , Email = 'Mihi123@gmail.com' 
where Admin_Id = 'Ad006' ;
Update Administration
set First_name = 'Pasan', Last_name = 'Withanage', UserName = 'pasan456' , Admin_password = '54620' , Email = 'pasan456@gmail.com' 
where Admin_Id = 'Ad004' ;

Update customer 
set First_name = 'Sineli',  Last_name='Yumithma', Email = null , Cus_Username= 'sine123' , Cus_password='45612', Address_no= '54/2', 
Street= 'Gemunu road', City = 'Matara', Dateofbirth='1999-08-12', Age = '24' where Customer_Id= 'Cus_002'; 
Update customer 
set First_name = 'Minoli',  Last_name='Pananya', Email ='Mono156@gmail.com' , Cus_Username= 'mino456' , Cus_password='45632', Address_no= '177/4', 
Street= 'folwer road', City = 'Kaluthara', Dateofbirth='1998-12-05', Age = '25' where Customer_Id= 'Cus_004'; 

Update Customer_contact
set  ContactNo = '0475896582' where Cus_Id= 'Cus_005';
Update Customer_contact
set  ContactNo = '0478956231' where Cus_Id= 'Cus_002';

Update chef 
set First_name = 'Disara', Last_name= 'Wijesinghe', Email = null , Working_experience = '5', HeadChef_Id = 'C001' 
where Chef_Id = 'C003';
update chef 
set First_name = 'Uvindu', Last_name= 'Kalpage', Email = 'Uvi99@gmail.com' , Working_experience = '7', HeadChef_Id = 'C001' 
where Chef_Id = 'C006';

Update Chef_contact 
set contact_No = '0475689235' where Chef_Id = 'C002';
Update Chef_contact 
set contact_No = '0785239635' where Chef_Id = 'C003';

Update orders 
set Order_date = '2023-05-06' , Order_Time = '00:08:50', Processed_by = 'Ad002', Cust_Id = 'Cus_002', Order_status ='Payment Confirmed', 
Total_amount= '1450.00' where order_Id = 'Order_006';
Update orders 
set Order_date = '2023-12-19' , Order_Time = '00:11:56', Processed_by = 'Ad003', Cust_Id = 'Cus_006', Order_status ='Order completed', 
Total_amount= '2200.00' where order_Id = 'Order_002';

update payment 
set Payment_date = '2023-07-09', Processed_by= 'Ad002', Order_Id = 'Order_002', Total_amount ='1560.00' where Payment_Id = 'Pay_006';
update payment 
set Payment_date = '2022-08-16', Processed_by= 'Ad003', Order_Id = 'Order_003', Total_amount ='2560.00' where Payment_Id = 'Pay_004';

update discount
set Type_name = 'Holiday Savor Savings', Descriptions = '15% off catering for holiday parties.' where pay_Id = 'Pay_001';
update discount
set Type_name = 'Spring into Flavor', Descriptions = 'Get 20% off all spring-inspired dishes.' where pay_Id = 'Pay_005';


update menu_item 
set Item_name= 'Seafood Platter', Availability = true , Price = '3990', Cheff_Id = 'C001' where Item_Id = 'Item_005';
update menu_item 
set Item_name= 'Thai Chicken Skewers', Availability = true , Price = '4300', Cheff_Id = 'C005' where Item_Id = 'Item_006';

update Rating
set Cus_Id = 'Cus_001', Score= '5',  Date_recorded ='2023-02-15' where Rating_Id = 'R2';
update Rating
set Cus_Id = 'Cus_003', Score= '4',  Date_recorded ='2022-06-15' where Rating_Id = 'R5';

update feedback 
set Comments = 'Consistently reliable service, thank you!', Date_recorded= '2022-05-18' where RatingId = 'R3';
update feedback 
set Comments = 'Excellent service, highly recommended!', Date_recorded= '2023-12-25' where RatingId = 'R4';

update Loyality_points
set Member_level = 'Gold', Last_purcheseDate= '2023-11-10', Total_points='182'where CusId = 'Cus_002';
update Loyality_points
set Member_level = 'Platinum', Last_purcheseDate= '2023-09-28', Total_points='230' where CusId = 'Cus_005';


-- Delete Operations
delete from Customer_contact where Cus_Id= 'Cus_001';

delete from chef_contact where Chef_Id = 'C001';

delete from discount where Pay_Id = 'Pay_004';

delete from menu_item where Item_Id = 'Item_004';

delete from feedback where RatingId = 'R6';

delete from loyality_points where CusId = 'Cus_006';


-- Chapter 5 - Transactions

-- Simple queries

-- 01) Select Operation
select * from Orders where Processed_by = 'Ad001';

-- 02) Project Operation
select Member_Level, Total_points from Loyality_points where Total_points > 180 && Member_level = 'Gold';

-- 03) Cartesian product operation
select * from Orders cross join Payment;

-- 04) Creating a user view
create view UV1 as select * from Chef as C1 natural join chef_contact as C2 ;
select * from UV1;

-- 05) Renaming operation
alter table payment change Processed_by Calculated_by varchar(20);

-- 06) Aggregation function
select Calculated_by, Avg(Total_amount) , count(Order_Id) as Orders_count from payment group by Calculated_by;
select Calculated_by, min(Total_amount) , count(Order_Id) as Orders_count from payment group by Calculated_by having Orders_count > 1;

-- 07) Use of LIKE keyword
select CusId, Member_Level from loyality_points where Last_purcheseDate like '2023-1_-__';


-- Complex queries

-- 1. Union Operation
(SELECT Cust_Id as Cus_Id, Order_Id FROM Orders where Processed_by = 'Ad001')
UNION
(SELECT Cust_Id as Cus_Id, Order_Id FROM Orders where Processed_by = 'Ad003');


-- 2. Intersection Operation
SELECT Cust_Id as Cus_Id, Order_Id FROM Orders where Processed_by = 'Ad002' AND Order_Status = "Payment Confirmed";


-- 3.Set difference Operation
SELECT Customer_Id FROM Customer WHERE Customer_Id NOT IN (SELECT CusId FROM Loyality_points);

-- 4. Division Operation
SELECT C.Customer_Id, C.First_name, C.Last_name
FROM Customer C
WHERE NOT EXISTS (SELECT M.Item_Id FROM Menu_Item M
   WHERE NOT EXISTS (SELECT OM.Menu_Item_ID FROM Order_MenuItem OM
       LEFT JOIN Orders O ON OM.OrderId = O.Order_Id WHERE O.Cust_Id = C.Customer_Id AND OM.Menu_Item_ID = M.Item_Id
   )
);

-- 5.Inner Join
CREATE view UV2 as select C.Customer_Id, C.First_name, CC.ContactNo from Customer as C inner join Customer_Contact As CC on C.Customer_Id = CC.Cus_Id 
where C.Age > 25;
select * from UV2;


-- 6. Natural join
CREATE view UV3 as select Ch.Chef_Id, Ch.First_name, ChC.Contact_No from Chef as Ch natural join Chef_Contact As ChC where Working_experience > 10;
select * from UV3;

-- 7. Left Outer join
CREATE view UV4 as select * from Chef as C left outer join Menu_Item as M  on M.Cheff_Id = C.Chef_Id;
select * from UV4;

-- 7. Right Outer join
CREATE view UV5 as select * from Chef as C right outer join Menu_Item as M  on M.Cheff_Id = C.Chef_Id;
select * from UV5;

-- 8. Full Outer join
CREATE view UV6 as 
(select * from Chef as C left outer join Menu_Item as M  on M.Cheff_Id = C.Chef_Id)
UNION
(select * from Chef as C right outer join Menu_Item as M  on M.Cheff_Id = C.Chef_Id);
select * from UV6;

-- 9. Outer Union
CREATE view UV7 as
(SELECT C.Chef_Id, C.First_name, C.Last_name, CC.Contact_No
FROM Chef C LEFT OUTER JOIN Chef_contact CC ON C.Chef_Id = CC.Chef_Id)
UNION
(SELECT C.Chef_Id, C.First_name, C.Last_name, CC.Contact_No
FROM Chef_contact CC LEFT OUTER JOIN Chef C ON C.Chef_Id = CC.Chef_Id);
SELECT * from UV7;

-- 10. Nested query
SELECT Cust_Id, Order_Id
FROM Orders
WHERE Cust_Id IN (
    SELECT Customer_Id
    FROM Customer
    WHERE Age >= 30
    UNION
    SELECT CusId
    FROM Loyality_points
    WHERE Member_level = 'Gold'
);

SELECT C.Customer_Id, C.First_name, C.Last_name
FROM Customer AS C
LEFT OUTER JOIN (
    SELECT Cust_Id, COUNT(Order_Id) AS OrderCount
    FROM Orders
    GROUP BY Cust_Id
) AS OCount ON C.Customer_Id = OCount.Cust_Id
WHERE OCount.OrderCount >= 2;



SELECT C.Customer_Id, C.First_name, C.Last_name
FROM Customer AS C
WHERE C.Customer_Id IN (
    SELECT O.Cust_Id
    FROM Orders AS O
    WHERE O.Order_Id IN (
        SELECT P.Order_Id
        FROM Payment AS P
        WHERE P.Total_amount > 2000.00
    )
);

-- Tuning Query 1
show index from payment;
explain (select O.Order_Id, O.Cust_Id, O.Processed_by from orders as O inner join payment  as P where P.Total_amount > 1500 and payment_time > '00:10:00');
create index PT_Index using BTree on payment(payment_time);
create index TA_Index using BTree on payment(Total_amount);
show index from payment;
explain (select O.Order_Id, O.Cust_Id, O.Processed_by from orders as O inner join payment  as P where P.Total_amount > 1500 and payment_time > '00:10:00');
drop index PT_Index on payment;
drop index TA_Index on payment;


-- Tuning Query 2
SHOW INDEX FROM payment;									

EXPLAIN 
SELECT O.Order_Id, O.Cust_Id, O.Processed_by 
FROM orders AS O 
INNER JOIN payment AS P ON O.Order_Id = P.Order_Id
WHERE P.Total_amount > 1500 AND P.payment_time > '00:10:00';

CREATE INDEX PT_Index USING BTREE ON payment(payment_time);
CREATE INDEX TA_Index USING BTREE ON payment(Total_amount);

SHOW INDEX FROM payment;

EXPLAIN 
SELECT O.Order_Id, O.Cust_Id, O.Processed_by 
FROM orders AS O 
INNER JOIN payment AS P ON O.Order_Id = P.Order_Id
WHERE P.Total_amount > 1500 AND P.payment_time > '00:10:00';

DROP INDEX PT_Index ON payment;
DROP INDEX TA_Index ON payment;							

-- Tuning Query 3
show index from Chef;				
explain(select * from UV1);
create index WE_Index using BTree on Chef(Working_experience);
show index from Chef;
explain(select * from UV1);
drop index WE_Index on Chef;

-- Tuning Query 4						
select * from Customer;
show index from Customer;
explain(select * from UV2);
create index A_Index using BTree on Customer(Age);
explain(select * from UV2);
drop index A_Index on Customer;

-- Tuning Query 5

show index from Chef;
explain(select * from UV3);
create index WE_Index using BTree on Chef(Working_experience);
show index from Chef;
explain(select * from UV3);
drop index WE_Index on Chef;



-- Tuning Query 6
show index from Chef;							
explain(select * from UV4);
create index FN_Index using BTree on Chef(First_name);
show index from Chef;
explain(select * from UV4);
drop index FN_Index on Chef;



-- Tuning Query 7
show index from Chef;                        
explain(select * from UV5);
create index WE_Index using BTree on Chef(Working_experience);
show index from Chef;
explain(select * from UV5);
drop index WE_Index on Chef;



-- Tuning Query 8
show index from Customer;
explain(select * from UV6);
create index FN_Index using BTree on Customer(First_name);
show index from Customer;
explain(select * from UV6);
drop index FN_Index on Customer;


-- Tuning Query 9							
show index from Customer_contact;
explain(select * from UV7);
create index CN_Index using BTree on Customer_contact(ContactNo);
show index from Customer_contact;
explain(select * from UV7);
drop index CN_Index on Customer_contact;



-- Tuning Query 10 intersection
show index from customer;
explain(SELECT DISTINCT C1.First_name, C1.First_name FROM customer AS C1
INNER JOIN customer AS C2 ON C1.First_name = C2.First_name AND C1.Last_name = C2.Last_name 
WHERE C1.Age > 20 AND C2.Dateofbirth like '1999-__-__');

create index AD_index using BTREE on customer(Age,Dateofbirth);
explain(SELECT DISTINCT C1.First_name, C1.First_name FROM customer AS C1
INNER JOIN customer AS C2 ON C1.First_name = C2.First_name AND C1.Last_name = C2.Last_name 
WHERE C1.Age > 20 AND C2.Dateofbirth like '1999-__-__');
drop index AD_index on customer;