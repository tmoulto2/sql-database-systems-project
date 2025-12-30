-- ================================
-- Query 1: List of all insured Patients
-- ================================
SELECT 
    p.PatientID, p.Name, p.DOB, p.Age, 
    i.ProviderName, i.PolicyNumber, i.ProviderPhone
FROM 
    Patient p
JOIN 
    InsuranceInfo i ON p.PatientID = i.PatientID;

-- ================================
-- Query 2: List of Patients and their Card Information
-- ================================
SELECT 
    p.PatientID, p.Name, p.Age, 
    s.CardNumber, s.ExpirationDate, s.SecurityCode
FROM 
    Patient p
JOIN 
    SelfPayInfo s ON p.PatientID = s.PatientID;

-- ================================
-- Query 3: Patients Who Visited Dentists
-- ================================
SELECT 
    p.PatientID, p.Name AS PatientName, 
    v.VisitDate, ve.Role, e.Name AS DentistName
FROM 
    Patient p
JOIN 
    Visit v ON p.PatientID = v.PatientID
JOIN 
    VisitEmployee ve ON v.VisitID = ve.VisitID
JOIN 
    Employee e ON ve.EmployeeID = e.EmployeeID
WHERE 
    ve.Role = 'Dentist';

-- ================================
-- Query 4: List of Dental Hygienists (Alphabetical by Last Name)
-- ================================
SELECT 
    EmployeeID, Name, DOB, Role
FROM 
    Employee
WHERE 
    Role = 'Dental Hygienist'
ORDER BY 
    RIGHT(Name, CHARINDEX(' ', REVERSE(Name)) - 1);

-- ================================
-- Query 5: Total Number of Patients Aged More Than 35
-- ================================
SELECT 
    COUNT(*) AS Patients_Over_35
FROM 
    Patient
WHERE 
    Age > 35;
