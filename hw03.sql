CREATE SCHEMA hw03;

USE hw03;

CREATE TABLE Employees(
	`employeeId` INT PRIMARY KEY,
    `employeeName` VARCHAR(50) NOT NULL,
    `salary` DEC NOT NULL,
    `departments` VARCHAR(50) NOT NULL
);

SELECT * FROM Employees
WHERE departments IN ("ke toan");

UPDATE Employees
SET `salary` = 1600
WHERE `employeeID` = 2;

SELECT employeeId FROM Employees
WHERE `salary` < 1150;

DELETE FROM Employees
WHERE `employeeId` = 1;