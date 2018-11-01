CREATE TABLE `Customer` (
  `customer_ID` int NOT NULL AUTO_INCREMENT,
  `Email_ID` varchar(255),
  `UserName` varchar(255) ,
  `Street_name` varchar(255),
  `FirstName` varchar(255),
  `LastName` varchar(255),
  PRIMARY KEY (`customer_ID`) 
);

CREATE TABLE `Orders` (
  `order_ID` int,
  `Total_Price` numeric(9,2),
  `Order_date` datetime,
  `Delivery_Method` enum("Home Delivery","Store Pickup"),
  `customer_ID` int,
  PRIMARY KEY (`order_ID`),
  Foreign KEY (`customer_ID`) references `Customer`(`customer_ID`)
);

CREATE TABLE `Shipping_Address` (
  `order_ID` int,
  `City` varchar(255),
  `Zip_Code` varchar(255),
  `Address_Line1` varchar(255),
  `Address_Line2` varchar(255),
  Primary KEY (`order_ID`),
  Foreign KEY (`order_ID`) references `Orders`(`order_ID`)
);

CREATE TABLE `Payment` (
  `Payment_ID` int,
  `order_Id` int,
  `Payment_method` enum("pay by card","pay on delivery"),
  `Payment_Date` date,
  `Payment_status` enum("paid","Not Paid"),
  PRIMARY KEY (`Payment_ID`),
  Foreign KEY (`order_ID`) references `Orders`(`order_ID`)
);

CREATE TABLE `Product` (
  `product_ID` int,
  `product_name` varchar(255),
  `brand` varchar(255),
  PRIMARY KEY (`product_ID`)
);

CREATE TABLE `Product_Variant` (
  `SKU` int,
  `product_ID` int,
  `order_ID` int,
  `stock` int,
  `unit_Price` numeric(9,2),
  `weight` numeric(5,2),
  PRIMARY KEY (`SKU`),
   Foreign KEY (`product_ID`) references `Product`(`product_ID`)
);

CREATE TABLE `Variant_Detail` (
  `SKU` int,
  `Attribute_Name` varchar(255),
  `Attribute_Value` varchar(255),
  Primary KEY(`SKU`)
  Foreign KEY (`SKU`) references `Product_Variant`(`SKU`)
);


CREATE TABLE `Category` (
  `category_name` varchar(255),
  `sub_category_name` varchar(255),
  `product_ID` int,
  PRIMARY KEY (`category_name`,`sub_category_name`),
  Foreign KEY  (`product_ID`) references `Product`(`product_ID`)
);

CREATE TABLE `Category_Products` (
  `category_name` varchar(255),
  `sub_category_name` varchar(255),
  `product_ID`int,
  PRIMARY KEY  (`category_name`, `sub_category_name`, `product_ID`),
  Foreign KEY (`category_name`) references `Category` (`category_name`) ,
  Foreign KEY (`sub_category_name`) references `Category` (`sub_category_name`) ,
  Foreign KEY (`product_ID`) references `Product`(`product_ID`)
);



CREATE TABLE `Cart` (
  `Date_Added` datetime,
  `Quantity` int,
  `SKU` int,
  `customer_ID` int,
  Primary KEY(`customer_ID`),
  Foreign KEY(`SKU`) references 'Product_Variant'('SKU'),
  Foreign KEY (`customer_ID`) references `Customer`(`customer_ID`)
);

CREATE TABLE `Freight_Details` (
  `Tracking_ID` int,
  `order_ID` int,
  `Shipping_Status` enum ("Processing","delivered"),
  `Shipping_date` datetime,
  PRIMARY KEY (`Tracking_ID`),
  Foreign KEY (`order_ID`) references `Orders`(`order_ID`)
);




CREATE TABLE `Order_Detail` (
  `SKU` int,
  `order_id` int,
  `Quantity` int,
  Primary KEY  (`SKU`, `order_id`),
  Foreign KEY (`SKU`) references `Product_Variant`(`SKU`)
);

CREATE TABLE `Guest` (
`customer_ID` int NOT NULL AUTO_INCREMENT,
  `Email_ID` varchar(255),
  `UserName` varchar(255) ,
  `Street_name` varchar(255),
  `FirstName` varchar(255),
  `LastName` varchar(255),
  `Date_logged_In` date,
  PRIMARY KEY (`customer_ID`) 
);



CREATE TABLE `City`(
	`City` varchar(255),
	`Street_name` varchar(255), 
     Primary KEY (`City`,`Street_name`)
);


CREATE TABLE `Customer_Telephone` (
  `customer_ID` int,
  `telephone` varchar(10),
  PRIMARY KEY `customer_ID`,
   FOREIGN KEY (`customer_ID`) references `Customer`(customer_ID`)
);

