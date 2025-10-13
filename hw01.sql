CREATE SCHEMA company_db;

USE company_db;

CREATE TABLE Employees (
	`employeeID` INT PRIMARY KEY,
    `firstName` VARCHAR(50) NOT NULL,
    `lastName` VARCHAR(50) NOT NULL,
    `hireDate` DATE NOT NULL,
    `salary` INT NOT NULL
);

ALTER TABLE employees
ADD `department` VARCHAR(50);

ALTER TABLE employees
MODIFY COLUMN `salary` DEC(10, 2); 