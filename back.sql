
CREATE TABLE `Shipping_Address` (
  `order_ID` int,
  `City` varchar(255),
  `Zip_Code` varchar(255),
  `Address_Line1` varchar(255),
  `Address_Line2` varchar(255),
  Primary KEY (`order_ID`),
  Foreign KEY (`order_ID`)
);

CREATE TABLE `Payment` (
  `Payment_ID` int,
  `order_Id` int,
  `Payment_method` enum("pay by card","pay on delivery"),
  `Payment_Date` date,
  `Payment_status` enum("paid","Not Paid"),
  PRIMARY KEY (`Payment_ID`),
  Foreign KEY (`order_Id`)
);

CREATE TABLE `Variant_Detail` (
  `SKU` int,
  `Attribute_Name` varchar(255),
  `Attribute_Value` varchar(255),
  Primary KEY(`SKU`)
  Foreign KEY (`SKU`)
);

CREATE TABLE `Category_Products` (
  `category_name` varchar(255),
  `sub_category_name` varchar(255),
  `product_ID`int,
  PRIMARY KEY  (`category_name`, `sub_category_name`, `product_ID`),
  Foreign KEY (`category_name`),
  Foreign KEY (`sub_category_name`),
  Foreign KEY (`product_ID`)
);

CREATE TABLE `Product_Variant` (
  `SKU` int,
  `product_ID` int,
  `order_ID` int,
  `stock` int,
  `unit_Price` numeric(9,2),
  `weight` numeric(5,2),
  PRIMARY KEY (`SKU`),
  foreign KEY(`product_ID`)
);

CREATE TABLE `Cart` (
  `Date_Added` datetime,
  `Quantity` int,
  `SKU` int,
  `customer_ID` int,
  Primary KEY(`customer_ID`),
  Foreign KEY(`SKU`),
  FOREIGN key (`customer_ID`)
);

CREATE TABLE `Freight_Details` (
  `Tracking_ID` int,
  `order_ID` int,
  `Shipping_Status` enum ("Processing","delivered"),
  `Shipping_date` datetime,
  PRIMARY KEY (`Tracking_ID`),
  Foreign KEY (`order_ID`)
);

CREATE TABLE `Order` (
  `order_ID` int,
  `Total_Price` numeric(9,2),
  `Order_date` datetime,
  `Delivery_Method` enum("Home Delivery","Store Pickup"),
  `customer_ID` int,
  PRIMARY KEY (`order_ID`),
  Foreign KEY (`customer_ID`)
);

CREATE TABLE `Product` (
  `product_ID` <type>,
  `product_name` <type>,
  `brand` <type>,
  PRIMARY KEY (`product_ID`)
);

CREATE TABLE `Order_Detail` (
  `SKU` <type>,
  `order_id` <type>,
  `Quantity` <type>,
  `` <type>,
  `` <type>,
  `` <type>,
  KEY `PK,FK` (`SKU`, `order_id`)
);

CREATE TABLE `Guest` (
  `Date_logged_In` <type>
);

CREATE TABLE `Customer` (
  `customer_ID` <type>,
  `Email_ID` <type>,
  `UserName` <type>,
  `City` <type>,
  `Street_name` <type>,
  `FirstName` <type>,
  `LastName` <type>,
  PRIMARY KEY (`customer_ID`)
);

CREATE TABLE `Category` (
  `category_name` <type>,
  `sub_category_name` <type>,
  `product_ID` <type>,
  PRIMARY KEY (`category_name`, `sub_category_name`),
  KEY `FK` (`product_ID`)
);

CREATE TABLE `Customer_Telephone` (
  `customer_ID` <type>,
  `telephone` <type>,
  KEY `PK,FK` (`customer_ID`)
);

