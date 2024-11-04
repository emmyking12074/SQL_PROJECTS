

-- Fleet Management Schema

--CREATING NECESSARY TABLES

--CREATE TABLE VEHICLES
CREATE TABLE Vehicles (
LicensePlate VARCHAR (100) NOT NULL,
Make VARCHAR (100) NOT NULL,
Model VARCHAR (100) NOT NULL,
Year INT NOT NULL,
Color VARCHAR (50) NOT NULL,
VIN VARCHAR (100) NOT NULL,
);

--CREATE TABLE DRIVERS
CREATE TABLE Drivers (
FirstName VARCHAR (100) NOT NULL,
LastName VARCHAR (100) NOT NULL,
LicenseNumber VARCHAR (100) NOT NULL,
Phone INT NOT NULL,
Address VARCHAR (255) NOT NULL,
City VARCHAR (100) NOT NULL,
State VARCHAR (50) NOT NULL,
ZipCode INT NOT NULL
);

--CREATE TABLE TRIPS 
CREATE TABLE Trips (
VehicleID INT NOT NULL,
DriverID INT NOT NULL,
StartDate DATE NOT NULL,
EndDate DATE NOT NULL,
StartLocation VARCHAR (100) NOT NULL,
EndLocation VARCHAR (100) NOT NULL,
Distance INT NOT NULL
);


--CREATE TABLE MAINTENANCE 
CREATE TABLE Maintenance (
VehicleID INT NOT NULL,
MaintenanceDate DATE NOT NULL,
Description VARCHAR (100) NOT NULL,
Cost DECIMAL (10, 2) NOT NULL
);


--INSERTING RECORDS INTO RESPECTIVE TABLES 

-- INSERT INTO VEHICLES TABLE 
INSERT INTO Vehicles (LicensePlate, Make, Model, Year, Color, VIN)
VALUES
('ABC123', 'Toyota', 'Corolla', '2020', 'White', '1HGCM82633A004352'),
('XYZ789', 'Ford', 'Fusion', '2018', 'Blue', '2HGCM82633A004353');

--INSERT INTO DRIVERS TABLE 
INSERT INTO Drivers (FirstName, LastName, LicenseNumber, Phone, Address, City, State, ZipCode)
VALUES
('Michael', 'Smith', 'D1234567', '1234567890', '123 Main St', 'Anytown', 'CA', '12345'),
('Sarah', 'Connor', 'D7654321', '0987654321', '456 Elm St', 'Otherville', 'NY', '54321'); 

--INSERT INTO THE TRIPS TABLE 
INSERT INTO Trips (VehicleID, DriverID, StartDate, EndDate, StartLocation, EndLocation, Distance)
VALUES
('1', '1', '2024-07-01', '2024-07-02', 'Los Angeles', 'San Francisco', '380'),
('2', '2', '2024-07-03', '2024-07-04', 'New York', 'Washington D.C.', '225');

--INSERT INTO MAINTENANCE TABLE 
INSERT INTO Maintenance (VehicleID, MaintenanceDate, Description, Cost)
VALUES 
('1', '2024-06-15', 'Oil change', '50.00'),
('2', '2024-06-20', 'Tire replacement', '300.00');


--UPDATE THE SECOND RECORD ON MAINTENANCE 
UPDATE Maintenance
SET Cost = 350.00
WHERE VehicleID = 2;

--DELETE FIRST VEHICLE FROM THE TABLE 
DELETE FROM Vehicles
WHERE LicensePlate = 'ABC123';

--INSERT ONE MORE RECORD INTO TRIPS
INSERT INTO Trips (VehicleID, DriverID, StartDate, EndDate, StartLocation, EndLocation, Distance)
VALUES 
('2', '1', '2024-07-05', '2024-07-06', 'Boston', 'Philadelphia', '300');

--Update the colour of the second vehicle in the Vehicles table to "Red".
UPDATE Vehicles
SET Color = 'Red'
WHERE LicensePlate = 'XYZ789';

--Insert a new maintenance record into the Maintenance table
INSERT INTO Maintenance (VehicleID, MaintenanceDate, Description, Cost)
VALUES
('1', '2024-07-10', 'Brake inspection', '100.00');

--Update the phone number of the first driver in the Drivers table to "2223334444".
UPDATE Drivers
SET Phone = '222333444'
WHERE LicenseNumber = 'D1234567';

--Delete the trip with TripID = 2 from the Trips table.
DELETE FROM Trips
WHERE TripID = 2;

--Trips has no TripID 


SELECT * FROM Vehicles

SELECT * FROM Drivers

SELECT * FROM Trips

SELECT * FROM Maintenance
