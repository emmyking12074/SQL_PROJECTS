--- A business manager wants to create a database to more easily manage their business operations data. He provides the following information about the entity-relationship model.
---https://i.imgur.com/EBW9HDY.png

CREATE DATABASE Relational_Model_Checkpoint
 USE Relational_Model_Checkpoint
 
 CREATE TABLE orders (
 orderID INT PRIMARY KEY,
 orderdate DATE NOT NULL,
 headquaterID VARCHAR (255) NOT NULL
 );

 CREATE TABLE supplier (
 supplierID INT PRIMARY KEY,
 deliveryID INT NOT NULL,
 deliveryDate DATE NOT NULL
 );

 CREATE TABLE products (
 productID INT PRIMARY KEY NOT NULL,
 supplierID INT NOT NULL,
 FOREIGN KEY (supplierID) REFERENCES supplier (supplierID)
 );
 

 CREATE TABLE orderdetail (
 orderdetailID INT PRIMARY KEY,
 productID INT NOT NULL,
 orderID INT NOT NULL,
 ProductQuantity INT NOT NULL
 FOREIGN KEY (orderID) REFERENCES orders(orderID),
 FOREIGN KEY (productID) REFERENCES products (productID)
 );

 CREATE TABLE delivery (
 deliveryID INT PRIMARY KEY,
 deliverDate DATE NOT NULL,
 suplierID INT NOT NULL,
 FOREIGN KEY (suplierID) REFERENCES supplier (supplierID)
 );

 SELECT * FROM orders

 SELECT * FROM supplier

 SELECT * FROM products

 SELECT * FROM orderdetail

 SELECT * FROM delivery