drop database if exists angaadi_users;
CREATE database angaadi_users ;
use angaadi_users;

CREATE TABLE users(
username int,
password varchar(255) not null,
image blob,
primary key (username)
);

insert into users values(1,'27b54f30a9b06e0088912dc786dc3545',null);

drop database if exists angaadi;
CREATE database angaadi ;
use angaadi;

CREATE TABLE Customer (
  customer_ID int ,
  Email_ID varchar(255),
  UserName varchar(255) ,
  Street_name varchar(255),
  City varchar(255),
  FirstName varchar(255),
  LastName varchar(255),
  PRIMARY KEY (customer_ID)
);

CREATE TABLE Orders (
  order_ID int NOT NULL AUTO_INCREMENT,
  Total_Price numeric(9,2),
  Order_date datetime,
  Delivery_Method enum("Home Delivery","Store Pickup"),
  customer_ID int,
  PRIMARY KEY (order_ID),
  Foreign KEY (customer_ID) references Customer(customer_ID)
);

CREATE TABLE Shipping_Address (
  FirstName varchar(255),
  LastName varchar(255),
  order_ID int,
  City varchar(255),
  State varchar(255),
  Zip_Code varchar(255),
  Address_Line varchar(255),
  PhoneNumber INT(15),
  Primary KEY (order_ID),
  Foreign KEY (order_ID) references Orders(order_ID)
);

CREATE TABLE Payment (
  Payment_ID int NOT NULL AUTO_INCREMENT,
  order_Id int,
  Payment_method enum("pay by card","pay on delivery"),
  Payment_Date datetime,
  Payment_status enum("paid","Not Paid"),
  PRIMARY KEY (Payment_ID),
  Foreign KEY (order_ID) references Orders(order_ID)
);

CREATE TABLE Product (
  product_ID int,
  product_name varchar(255),
  brand varchar(255),
  PRIMARY KEY (product_ID)
);


CREATE TABLE Product_Variant (
  SKU int,
  product_ID int,
  Stock int,
  unit_Price numeric(9,2),
  weight numeric(5,2),
   Image blob,
  PRIMARY KEY (SKU),
   Foreign KEY (product_ID) references Product(product_ID)
);


CREATE TABLE Variant_Detail (
  SKU int,
  Attribute_Name varchar(255),
  Attribute_Value varchar(255),
  Primary KEY  (SKU,Attribute_Name),
  Foreign KEY (SKU) references Product_Variant(SKU)
);


CREATE TABLE Category (
  pid int ,
  category_name varchar(255),
  sub_category_name varchar(255),
  PRIMARY KEY (pid)
);




CREATE TABLE Category_Products (
  pid int,
  product_ID int,
  PRIMARY KEY  (pid, product_ID),
  Foreign KEY (pid) references Category(pid) ,
  Foreign KEY (product_ID) references Product(product_ID)
);



CREATE TABLE Cart (
  Date_Added datetime,
  Quantity int,
  SKU int,
  customer_ID int,
  Primary KEY (customer_ID,SKU),
  Foreign KEY(SKU) references Product_Variant(SKU),
  Foreign KEY (customer_ID) references Customer(customer_ID)
);

CREATE TABLE Freight_Details (
  Tracking_ID int,
  order_ID int,
  Shipping_Status enum ("Processing","delivered"),
  Shipping_date datetime,
  PRIMARY KEY (Tracking_ID),
  Foreign KEY (order_ID) references Orders(order_ID)
);


CREATE TABLE Order_Detail(
  SKU int,
  order_id int,
  Quantity int,
  Primary KEY  (SKU, order_id),
  Foreign KEY (SKU) references Product_Variant(SKU)
);

CREATE TABLE Guest (
customer_ID int,
  Email_ID varchar(255),
  UserName varchar(255) ,
  FirstName varchar(255),
  LastName varchar(255),
  Street_name varchar(255),
  City varchar(255),
  Date_logged_In datetime,
  PRIMARY KEY (customer_ID)
);


CREATE TABLE Customer_Telephone (
  customer_ID int,
  telephone varchar(10),
  PRIMARY KEY (customer_ID,telephone),
   FOREIGN KEY (customer_ID) references Customer(customer_ID)
);
