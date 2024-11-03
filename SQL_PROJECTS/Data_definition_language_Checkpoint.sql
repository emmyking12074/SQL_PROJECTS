

--- Below is the SQL schema based on the provided entities, relationships, and constraints. 
--- Each column is defined with the NOT NULL constraint as instructed, and foreign key relationships are established where appropriate.

--CREATE CUSTOMER TABLE
CREATE TABLE Customer (
CustomerID INT PRIMARY KEY NOT NULL,
FirstName VARCHAR (100) NOT NULL,
LastName VARCHAR (100) NOT NULL,
Email VARCHAR (100) NOT NULL,
Phone VARCHAR (15) NOT NULL,
Address VARCHAR (255) NOT NULL,
City VARCHAR (50) NOT NULL,
State VARCHAR (50) NOT NULL,
ZipCode VARCHAR (15) NOT NULL
);

--CREATE CATEGORY TABLE 
CREATE TABLE Category (
CategoryID INT PRIMARY KEY NOT NULL,
CategoryName VARCHAR (100) NOT NULL,
Description VARCHAR (100) NOT NULL
);

--CREATE PRODUCTS TABLE 
CREATE TABLE products (
ProductID INT PRIMARY KEY NOT NULL,
ProductName VARCHAR (100) NOT NULL,
Descrption VARCHAR (100) NOT NULL,
Price DECIMAL (10, 2) NOT NULL,
StockQuantity INT NOT NULL,
CategoryID INT NOT NULL
FOREIGN KEY (CategoryID) REFERENCES Category (CategoryID)
);

--CREATE TABLE ORDERS
CREATE TABLE Orders (
OrderID INT PRIMARY KEY NOT NULL,
CustomerID INT NOT NULL,
OrderDate DATE NOT NULL,
TotalAmount DECIMAL(10, 2) NOT NULL,
FOREIGN KEY (CustomerID) REFERENCES Customer (CustomerID)
);

--CREATE ORDERDETAILS TABLE 
CREATE TABLE Orderdetail (
OrderdetailID INT PRIMARY KEY NOT NULL,
ProductID INT NOT NULL,
OrderID INT NOT NULL,
Quantity INT NOT NULL,
UnitPrice DECIMAL (10, 2) NOT NULL,
FOREIGN KEY (OrderID) REFERENCES Orders (OrderID),
FOREIGN KEY (ProductID) REFERENCES Products (ProductID)
);



SELECT * FROM Customer

SELECT * FROM Category

SELECT * FROM products

SELECT * FROM Orders

SELECT * FROM Orderdetail