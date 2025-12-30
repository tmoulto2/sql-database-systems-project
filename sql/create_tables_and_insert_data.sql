CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    DOB DATE,
    Role VARCHAR(30),
    Salary MONEY,
    DoorNumber VARCHAR(10),
    StreetName VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(50),
    ZipCode INT
);

INSERT INTO Employee VALUES
(1, 'Alice Johnson', '1980-05-10', 'Dentist', 120000, '123', 'Oak St', 'Atlanta', 'GA', 30301),
(2, 'Ben Carter', '1985-03-20', 'Dental Hygienist', 80000, '200', 'Maple Rd', 'Atlanta', 'GA', 30302),
(3, 'Cathy Lin', '1979-09-15', 'Dentist', 115000, '315', 'Pine Ave', 'Smyrna', 'GA', 30080),
(4, 'David Ross', '1990-07-11', 'Dental Hygienist', 78000, '405', 'Elm Blvd', 'Marietta', 'GA', 30060),
(5, 'Elena Smith', '1982-12-01', 'Dentist', 125000, '111', 'Birch St', 'Decatur', 'GA', 30033);

SELECT * FROM Employee;

CREATE TABLE Patient (
    PatientID INT PRIMARY KEY,
    Name VARCHAR(50),
    DOB DATE,
    Age INT,
    DoorNumber VARCHAR(10),
    StreetName VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(50),
    ZipCode INT,
    DentalRecords VARCHAR(255)
);

INSERT INTO Patient VALUES
(101, 'Tom Brady', '1990-01-01', 34, '400', 'Main St', 'Atlanta', 'GA', 30301, 'Cavity filling'),
(102, 'Lisa Wong', '1992-05-15', 32, '410', 'Peach St', 'Atlanta', 'GA', 30302, 'Root canal'),
(103, 'Mark Lee', '1987-08-10', 37, '420', 'Cedar Dr', 'Decatur', 'GA', 30033, 'Whitening'),
(104, 'Karen Smith', '1995-09-25', 29, '430', 'Oak Way', 'Marietta', 'GA', 30060, 'Cleaning'),
(105, 'Alex Kim', '1988-11-30', 36, '440', 'Birch Ave', 'Smyrna', 'GA', 30080, 'Crowns');

SELECT * FROM Patient;

CREATE TABLE Visit (
    VisitID INT PRIMARY KEY,
    PatientID INT,
    VisitDate DATE,
    Service VARCHAR(50),
    CurrentTreatment VARCHAR(100),
    Cost MONEY,
    NextVisit DATE,
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);

INSERT INTO Visit VALUES
(201, 101, '2024-06-01', 'Checkup', 'Cavity Fill', 150.00, '2024-12-01'),
(202, 102, '2024-06-02', 'Cleaning', 'Routine Clean', 80.00, '2025-01-02'),
(203, 103, '2024-06-03', 'Whitening', 'Teeth Bleach', 200.00, '2024-12-03'),
(204, 104, '2024-06-04', 'Consult', 'Pain Diagnosis', 90.00, '2024-09-04'),
(205, 105, '2024-06-05', 'Crown Fit', 'Crown Installation', 250.00, '2024-12-05');

SELECT * FROM Visit;

CREATE TABLE Service (
    ServiceID INT PRIMARY KEY,
    VisitID INT,
    ServiceType VARCHAR(50),
    EmployeeID INT,
    ServiceCost MONEY,
    FOREIGN KEY (VisitID) REFERENCES Visit(VisitID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

INSERT INTO Service VALUES
(301, 201, 'Filling', 1, 150.00),
(302, 202, 'Cleaning', 2, 80.00),
(303, 203, 'Whitening', 3, 200.00),
(304, 204, 'Consultation', 4, 90.00),
(305, 205, 'Crown Placement', 5, 250.00);

SELECT * FROM Service;

CREATE TABLE DentalLab (
    LabID INT PRIMARY KEY,
    Name VARCHAR(50),
    DoorNumber VARCHAR(10),
    StreetName VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(50),
    ZipCode INT
);

INSERT INTO DentalLab VALUES
(401, 'Smile Lab', '600', 'Tech Park', 'Atlanta', 'GA', 30303),
(402, 'Bright Dental', '601', 'Peachtree Rd', 'Atlanta', 'GA', 30304),
(403, 'Precision Lab', '602', 'Sunset Blvd', 'Smyrna', 'GA', 30080),
(404, 'Pearl Dental Lab', '603', 'Maple Ave', 'Marietta', 'GA', 30060),
(405, 'ToothTech', '604', 'Elm St', 'Decatur', 'GA', 30033);

SELECT * FROM DentalLab;

CREATE TABLE Supplies (
    SupplyID INT PRIMARY KEY,
    LabID INT,
    Description VARCHAR(100),
    Type VARCHAR(50),
    Cost MONEY,
    FOREIGN KEY (LabID) REFERENCES DentalLab(LabID)
);

INSERT INTO Supplies VALUES
(501, 401, 'Composite Resin', 'Filling Material', 50.00),
(502, 402, 'Porcelain Crown', 'Crown', 150.00),
(503, 403, 'Bleaching Gel', 'Whitening', 40.00),
(504, 404, 'Prophy Paste', 'Cleaning Material', 15.00),
(505, 405, 'X-ray Film', 'Diagnostic', 25.00);

SELECT * FROM Supplies;

CREATE TABLE EmployeePhone (
    EmployeeID INT,
    PhoneNumber VARCHAR(15),
    PRIMARY KEY (EmployeeID, PhoneNumber),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

INSERT INTO EmployeePhone VALUES
(1, '4041234567'),
(2, '4042345678'),
(3, '6783456789'),
(4, '7704567890'),
(5, '4705678901');

SELECT * FROM EmployeePhone;

CREATE TABLE PatientEmail (
    PatientID INT,
    Email VARCHAR(100),
    PRIMARY KEY (PatientID, Email),
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);

INSERT INTO PatientEmail VALUES
(101, 'tom.b@gmail.com'),
(102, 'lisa.w@outlook.com'),
(103, 'mark.l@yahoo.com'),
(104, 'karen.s@gmail.com'),
(105, 'alex.k@gmail.com');

SELECT * FROM PatientEmail;

CREATE TABLE VisitEmployee (
    VisitID INT,
    EmployeeID INT,
    Role VARCHAR(30),
    PRIMARY KEY (VisitID, EmployeeID),
    FOREIGN KEY (VisitID) REFERENCES Visit(VisitID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

INSERT INTO VisitEmployee VALUES
(201, 1, 'Dentist'),
(202, 2, 'Dental Hygienist'),
(203, 3, 'Dentist'),
(204, 4, 'Dental Hygienist'),
(205, 5, 'Dentist');

SELECT * FROM VisitEmployee;

CREATE TABLE SelfPayInfo (
    CardID INT PRIMARY KEY,
    PatientID INT,
    CardNumber BIGINT,
    ExpirationDate DATE,
    SecurityCode INT,
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);

INSERT INTO SelfPayInfo VALUES
(1001, 101, 4111111111111111, '2026-01-01', 123),
(1002, 102, 5500000000000004, '2026-02-01', 456),
(1003, 103, 340000000000009,  '2026-03-01', 789),
(1004, 104, 6011000000000004, '2026-04-01', 101),
(1005, 105, 3530111333300000, '2026-05-01', 202);

SELECT * FROM SelfPayInfo;

CREATE TABLE InsuranceInfo (
    InsuranceID INT PRIMARY KEY,
    PatientID INT UNIQUE,
    ProviderName VARCHAR(50),
    PolicyNumber INT,
    ProviderPhone VARCHAR(15),
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);

INSERT INTO InsuranceInfo VALUES
(1, 101, 'DeltaDental', 123456, '8001112222'),
(2, 102, 'Aetna', 234567, '8002223333'),
(3, 103, 'MetLife', 345678, '8003334444'),
(4, 104, 'Cigna', 456789, '8004445555'),
(5, 105, 'Guardian', 567890, '8005556666');

SELECT * FROM InsuranceInfo;

CREATE TABLE PatientPhone (
    PatientID INT,
    PhoneNumber VARCHAR(15),
    PRIMARY KEY (PatientID, PhoneNumber),
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);

INSERT INTO PatientPhone VALUES
(101, '6781230001'),
(102, '6782340002'),
(103, '6783450003'),
(104, '6784560004'),
(105, '6785670005');

SELECT * FROM PatientPhone;

CREATE TABLE EmployeeEmail (
    EmployeeID INT,
    Email VARCHAR(100),
    PRIMARY KEY (EmployeeID, Email),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

INSERT INTO EmployeeEmail VALUES
(1, 'alice.j@gadental.com'),
(2, 'ben.c@gadental.com'),
(3, 'cathy.l@gadental.com'),
(4, 'david.r@gadental.com'),
(5, 'elena.s@gadental.com');

SELECT * FROM EmployeeEmail;

