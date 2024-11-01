--Creating a database
CREATE DATABASE New_Lesson;

--Making use of the database
USE New_Lesson

--Creating a table called 'Employee'
CREATE TABLE Employees(
		EmployeeID INT PRIMARY KEY,
		FirstName VARCHAR(100),
		LastName VARCHAR(100),
		Department VARCHAR(100),
		Salary DECIMAL(10, 2),
)
SELECT * FROM Employees -- to view the table itself

sp_help[Employees] --to view the internals/backend of the your table created

--Inserting data into the table 
INSERT INTO Employees(EmployeeID, FirstName, LastName, Department, Salary)
VALUES (1, 'John', 'Doe', 'HR', 50000.00),
	   (2, 'Jane', 'Smith', 'Finance', 40000.00),
	   (3, 'Bisi', 'Tosin', 'Marketing', 30000.00);

-- selecting a portion of the Employees table
SELECT FirstName FROM Employees

SELECT FirstName, LastName  FROM Employees

--Using the WHERE clause
SELECT * FROM Employees
WHERE Department = 'Finance'

--Using the WHERE clause with a condition
SELECT * FROM Employees
	WHERE Salary > 30000


--Using UPDATE statement 
UPDATE Employees
SET salary = 58000.00
WHERE EmployeeID = 1

--Alter a column name(updating a column name )
EXEC sp_rename 'Employees.Department', 'Departments', 'COLUMN';


--Delete Function
DELETE FROM Employees
WHERE EmployeeID = 3;


SELECT * FROM [dbo].[house_pricing_dataset]

--Aggregation Functions

--calculate the average
SELECT concat('$', round(AVG(price), 2)) AS AveragePrice --the round there is to round up the decimal averageprice & the (2) is the amt i want round up to.
	FROM [dbo].[house_pricing_dataset]
	WHERE yr_renovated = 2005;

--calculate the Max price
SELECT MAX(price) AS Maximum_price
		FROM [dbo].[house_pricing_dataset]

--calculate the Min price
SELECT MIN(price) AS Minimum_price
		FROM [dbo].[house_pricing_dataset]
		WHERE price >0

--calculate the sum of price
SELECT SUM(price) AS Sum_price
		FROM [dbo].[house_pricing_dataset]

--calculate the average of price
SELECT AVG(price) AS Average_price
		FROM [dbo].[house_pricing_dataset]

--calculate the distinct of cities
SELECT DISTINCT(city) AS Unique_cities
		FROM [dbo].[house_pricing_dataset]

--calculate the count of price
SELECT COUNT(price) AS Price_count
		FROM [dbo].[house_pricing_dataset]

--calculate the count of distinct of city
SELECT COUNT(DISTINCT(city)) AS Unique_cities
		FROM [dbo].[house_pricing_dataset]

--subqueries:
--subquery inside the WHERE clause
SELECT price, yr_renovated, city
	FROM [dbo].[house_pricing_dataset]
		WHERE price > (SELECT AVG(price)
						FROM [dbo].[house_pricing_dataset])
 
--JOINS
SELECT * FROM Employees
INSERT INTO Employees(EmployeeID, FirstName, LastName, Departments, Salary)
VALUES (3, 'Bisi', 'Tosin', 'Marketing', 30000.00);

--Creating a Department table 
CREATE TABLE Departments(
		DepartmentID INT PRIMARY KEY,
		DepartmentName VARCHAR(50)
);
SELECT * FROM Departments
SELECT * FROM Employees

--Inserting data into the Departments table 
INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES (1, 'HR'),
	   (2, 'Finance'),
	   (3, 'Marketing');

--INNER JOIN 
SELECT * FROM Employees

SELECT Employees.Departments, Departments.DepartmentID FROM Employees
INNER JOIN Departments
ON Employees.Departments = Departments.DepartmentName

--LEFT JOIN
SELECT * FROM Employees
LEFT JOIN Departments
ON Employees.Departments = Departments.DepartmentName

--RIGHT JOIN
SELECT * FROM Employees
RIGHT JOIN Departments
ON Employees.Departments = Departments.DepartmentName

-- FULL OUTER JOIN
SELECT * FROM Employees
FULL OUTER JOIN Departments
ON Employees.Departments = Departments.DepartmentName

--INSERT INTO Departments (DepartmentsID, DepartmentName)
--VALUES (4, 'Media');

SELECT Employees,Salary * Departments.DepartmentID AS Net_salary FROM Employees





--CONSTRIANTS
-- PRIMARY KEY

CREATE TABLE Employees_1(
        EmployeeID INT PRIMARY KEY,
		FirstName VARCHAR(50),
		LastName VARCHAR(50)
);

INSERT INTO Employees_1(EmployeeID, FirstName, LastName)
VALUES (1, 'John', 'Doe'),
       (2, NULL, 'Smith'),
	   (3, 'Bob', 'Johnson');


SELECT * FROM Employees_1

--FOREIGN KEY
CREATE TABLE Customers(
       CustomerID INT PRIMARY KEY,
	   CustomerName VARCHAR (50)
);

CREATE TABLE Orders(
       OrderID INT PRIMARY KEY,
	   CustomerID INT,
	   OrderDate DATE,
	   FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID)
	   );

INSERT INTO Customers(CustomerID, CustomerName)
VALUES (101, 'Joe'),
       (102, 'Smith'),
	   (103, 'Jane');

INSERT INTO Orders(OrderID, CustomerID, OrderDate)
VALUES (1, 101, '10-21-2024'),
       (2, 102, '10-22-2024'),
	   (3, 103, '10-23-2024');

INSERT INTO Customers(CustomerID, CustomerName)
VALUES (NULL, 'Steve');

INSERT INTO Orders(OrderID, CustomerID, OrderDate)
VALUES (4, NULL, '10-24-2024');



--UNIQUE CONSTRIANT 
CREATE TABLE Products(
       ProductID INT UNIQUE,
	   ProductName VARCHAR(100)
	   );

--CHECK CONSTRAINT
CREATE TABLE Student(
       StudentID INT PRIMARY KEY,
	   Age INT
	   CHECK (Age >=18)
	   );

INSERT INTO Student(StudentID, Age)
VALUES (10, 18);

INSERT INTO Products(ProductID, ProductName)
VALUES (011, 'Sneakers'),
       (012, 'Shirts');


--DEFULT CONSTRAINT
CREATE TABLE Orders_1(
       OrderID INT PRIMARY KEY,
	   OrderDate DATE DEFAULT GETDATE()
	   );


INSERT INTO Orders_1(OrderID)
VALUES (100);

SELECT * FROM Orders_1

INSERT INTO Student (StudentID, Age)
VALUES (02);

--ENFORCING CONSTRAINT
--ADDING A PRIMARY KEY CONSTRAINT TO AN EXISTING TABLE 
CREATE TABLE Employees_2 (
       EmployeeID INT,
	   FirstName VARCHAR(50),
	   LastName VARCHAR(50)
	   );


ALTER TABLE Employees_2
ALTER COLUMN EmployeeID INT NOT NULL;

ALTER TABLE Employees_2
ADD CONSTRAINT PK_EmployeeID
PRIMARY KEY (EmployeeID);

--LOGICAL OPERATOR 
--Using the AND statement 
SELECT * FROM Employees
WHERE Salary >= 58000 AND Departments = 'HR'

--Using the OR  statement 
SELECT * FROM Employees
WHERE Salary >= 30000 OR Departments = 'HR'

--Using the NOT statement 
SELECT * FROM Employees
WHERE NOT Departments ='HR'

--Using the IN statment 
SELECT * FROM Employees
WHERE Departments IN ('HR', 'FINANCE');

--Using the BETWEEN Statment 
SELECT * FROM Employees
WHERE Salary BETWEEN 30000 AND 58000;

--LIKE
SELECT * FROM Employees
WHERE FirstName LIKE 'J%';

SELECT * FROM Employees
WHERE FirstName NOT LIKE 'J%';

SELECT * FROM Employees
WHERE FirstName LIKE '%J';

SELECT * FROM Employees
WHERE FirstName LIKE '%an%';


SELECT * FROM Employees
WHERE FirstName LIKE '__NE';

-- The CASE Statment 
SELECT * FROM [dbo].[house_pricing_dataset]

SELECT MIN(PRICE) FROM [dbo].[house_pricing_dataset]
WHERE PRICE > 0;

SELECT MAX (PRICE) FROM [dbo].[house_pricing_dataset]
WHERE PRICE > 0;

SELECT * FROM [dbo].[house_pricing_dataset]

WITH Table1 AS(SELECT price, city,
CASE
   WHEN PRICE >= 7800 AND PRICE <= 500000 THEN 'AFFORDABLE'
   WHEN PRICE > 500000 AND PRICE <= 5000000 THEN 'EXECUTIVE'
   WHEN PRICE > 5000000 THEN 'LUXURY'
   ELSE 'T-PAINERS'
END AS LIFESTYLE_STATUS
FROM [dbo].[house_pricing_dataset])

SELECT PRICE, CITY, LIFESTYLE_STATUS
FROM Table1
WHERE LIFESTYLE_STATUS= 'T-PAINERS'

-- GROUP BY
SELECT * FROM [dbo].[house_pricing_dataset]

SELECT COUNT(DISTINCT(floors)) FROM [dbo].[house_pricing_dataset]

SELECT FLOORS, AVG(PRICE) AS AVERAGE_PRICE
FROM [dbo].[house_pricing_dataset]
GROUP BY FLOORS
ORDER BY AVERAGE_PRICE

SELECT COUNT(DISTINCT(BATHROOMS)) FROM [dbo].[house_pricing_dataset]

SELECT BATHROOMS, AVG(PRICE) AS AVERAGE_PRICE
FROM [dbo].[house_pricing_dataset]
GROUP BY BATHROOMS;

--THE HALVING CLAUSE
SELECT DISTINCT(CONDITION) FROM [dbo].[house_pricing_dataset]

SELECT CITY, CONDITION, AVG(PRICE)
FROM [dbo].[house_pricing_dataset]
GROUP BY CITY, CONDITION
HAVING CONDITION >3

SELECT ROUND(AVG(price), 2)AS AVG_PRICE,
	CASE
		WHEN price >= 7800 AND price <= 500000 THEN 'Affordable'
		WHEN price > 500000 AND price <= 5000000 THEN 'Executive'
		WHEN price > 5000000 THEN 'Luxury'
		ELSE 'T-painers'
	END AS Lifestyle_status
FROM house_pricing_dataset
GROUP BY 
	CASE 
		WHEN price >= 7800 AND price <= 500000 THEN 'Affordable'
		WHEN price > 500000 AND price <= 5000000 THEN 'Executive'
		WHEN price > 5000000 THEN 'Luxury'
		ELSE 'T-painers'
	END
	ORDER BY AVG_PRICE DESC;

--CASE ADVANCE USAGE 
SELECT  * FROM Employees

UPDATE Employees
SET Salary=
CASE
    WHEN DEPARTMENTS = 'HR' THEN Salary * 1.02
	WHEN DEPARTMENTS = 'FINANCE' THEN Salary * 1.15
	WHEN DEPARTMENTS = 'MARKETING' THEN Salary * 1.12
	ELSE SALARY
END;


--SET OPERATORS 

INSERT INTO Employees_2(EmployeeID, FirstName, LastName)
VALUES (4, 'Bryan', 'Destiny'),
       (5, 'Nathan', 'Smith'),
	   (6, 'Ruth', 'Balamo'),
	   (7, 'pelu', 'adebowale');



CREATE TABLE Employees_3(
        EmployeeID INT PRIMARY KEY,
		FirstName VARCHAR(50),
		LastName VARCHAR(50)
		);



INSERT INTO Employees_3(EmployeeID, FirstName, LastName)
VALUES (4, 'Edafe', 'Boniface'),
       (5, 'Nathan', 'Smith'),
	   (6, 'Bob', 'Johnson'),
	   (7, 'pelu', 'adebowale');

SELECT * FROM Employees_1
UNION
SELECT * FROM Employees_3
UNION
SELECT * FROM Employees_2



SELECT * FROM Employees_2
UNION
SELECT * FROM Employees_1


SELECT * FROM Employees_2
UNION ALL
SELECT * FROM Employees_3



UPDATE Employees_3
SET EmployeeID = 3 WHERE EmployeeID = 6;

-- Combining two datasets or table together using UNION
SELECT * FROM bike_share_yr_0
UNION 
SELECT * FROM bike_share_yr_1

SELECT * FROM cost_table


-- Using WITH STATEMENT to join a third table to the union

WITH t1 AS (SELECT * FROM bike_share_yr_0
UNION 
SELECT * FROM bike_share_yr_1)

SELECT * FROM t1
INNER JOIN cost_table
ON t1.yr = cost_table.yr
