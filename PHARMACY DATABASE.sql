CREATE DATABASE Pharmacy;
USE Pharmacy;

CREATE TABLE Tablets (
    Tablet_ID INT PRIMARY KEY,
    Tablet_Name VARCHAR(50),
    Tablet_Weight DECIMAL(6,2),
    Disease VARCHAR(50),
    Symptom VARCHAR(50)
);

ALTER TABLE Tablets
ADD Cost DECIMAL(10,2);

ALTER TABLE Tablets
RENAME COLUMN Cost TO Tablet_Cost;

INSERT INTO Tablets
(Tablet_ID, Tablet_Name, Tablet_Weight, Disease, Symptom, Tablet_Cost)
VALUES
(101, 'Paracetamol', 500.00, 'Fever', 'Headache', 2.50),
(102, 'Ibuprofen', 400.00, 'Pain', 'Body Pain', 3.00),
(103, 'Cetirizine', 10.00, 'Allergy', 'Sneezing', 1.50),
(104, 'Azithromycin', 250.00, 'Infection', 'Sore Throat', 5.00),
(105, 'Amoxicillin', 500.00, 'Bacterial Infection', 'Fever', 4.50),
(106, 'Omeprazole', 20.00, 'Acidity', 'Heartburn', 2.00),
(107, 'Metformin', 500.00, 'Diabetes', 'Fatigue', 3.50),
(108, 'Amlodipine', 5.00, 'Hypertension', 'Dizziness', 2.75),
(109, 'Loratadine', 10.00, 'Allergy', 'Sneezing', 2.25),
(110, 'Aspirin', 325.00, 'Pain', 'Headache', 1.75),
(111, 'Pantoprazole', 40.00, 'Acidity', 'Heartburn', 2.50),
(112, 'Diclofenac', 50.00, 'Arthritis', 'Joint Pain', 3.25),
(113, 'Montelukast', 10.00, 'Asthma', 'Breathing Difficulty', 4.00),
(114, 'Levocetirizine', 5.00, 'Allergy', 'Runny Nose', 2.00),
(115, 'Losartan', 50.00, 'Hypertension', 'Dizziness', 3.50),
(116, 'Glimepiride', 2.00, 'Diabetes', 'Fatigue', 2.75),
(117, 'Naproxen', 250.00, 'Pain', 'Joint Pain', 3.00),
(118, 'Doxycycline', 100.00, 'Infection', 'Fever', 4.50),
(119, 'Ondansetron', 4.00, 'Nausea', 'Vomiting', 2.25),
(120, 'Ranitidine', 150.00, 'Acidity', 'Heartburn', 2.50);


UPDATE Tablets
SET Tablet_Cost = 3.00
WHERE Tablet_ID = 101;

UPDATE Tablets
SET Tablet_Cost = 4.00
WHERE Tablet_ID = 102;

UPDATE Tablets
SET Tablet_Cost = 2.00
WHERE Tablet_ID = 103;


ALTER TABLE Tablets
DROP COLUMN Tablet_Cost;

ALTER TABLE Tablets
ADD Age_Group VARCHAR(30);

UPDATE Tablets
SET Age_Group = 'Children'
WHERE Tablet_ID IN (103, 109, 114);

UPDATE Tablets
SET Age_Group = 'Adults'
WHERE Tablet_ID IN (101, 102, 104, 105, 106, 107, 108, 110, 111, 112, 113, 115, 116, 117, 118, 119, 120);

SELECT Age_Group, COUNT(*) AS Total_Tablets
FROM Tablets
GROUP BY Age_Group
HAVING Age_Group = 'Adults';

SELECT Symptom, COUNT(*) AS Number_of_Tablets
FROM Tablets
GROUP BY Symptom;


SELECT *
FROM Tablets;


SELECT
    MIN(Tablet_Weight) AS Minimum_Weight,
    MAX(Tablet_Weight) AS Maximum_Weight
FROM Tablets;


ALTER TABLE Tablets
ADD Qty INT;


UPDATE Tablets
SET Qty = 10
WHERE Tablet_ID BETWEEN 101 AND 110;

UPDATE Tablets
SET Qty = 20
WHERE Tablet_ID BETWEEN 111 AND 120;

SELECT
    Tablet_ID,
    Tablet_Name,
    (Tablet_Weight * Qty) AS Total_Weight,
    Symptom
FROM Tablets;

SELECT
    Tablet_ID,
    Tablet_Name,
    Tablet_Weight,
    Disease,
    Symptom
FROM Tablets
WHERE Tablet_Weight > 100
AND Disease = 'Pain';

SELECT *
FROM Tablets;