CREATE SCHEMA hw04;
USE hw04;

CREATE TABLE Orders(
	`orderId` INT PRIMARY KEY,
    `orderDate` DATE NOT NULL,
    `customerId` INT NOT NULL,
    `totalAmount` DEC CHECK (totalAmount >= 0),
    FOREIGN KEY(customerId) 
    REFERENCES customers(customerId)
);

CREATE TABLE Customers(
	`customerID` INT PRIMARY KEY
);