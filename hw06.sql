CREATE SCHEMA hw06;
USE hw06;

CREATE TABLE Orders(
	`orderId` INT PRIMARY KEY,
    `orderDate` DATE NOT NULL,
    `customerId` INT NOT NULL,
    FOREIGN KEY (customerId)
    REFERENCES Customers(customerId)
);

CREATE TABLE Customers(
	`customerId` INT PRIMARY KEY,
    `customerName` VARCHAR(100),
    `email` VARCHAR(100) UNIQUE NOT NULL,
    `phone` VARCHAR(15) UNIQUE NOT NULL
);

CREATE TABLE OrderDetails(
	`orderDetailId` INT PRIMARY KEY,
    `orderID` INT NOT NULL,
    `productId` INT NOT NULL,
    `quantity` INT CHECK(quantity > 0),
    `unitPrice` DEC(10, 2) CHECK(unitPrice > 0),
    FOREIGN KEY (orderID)
    REFERENCES Orders(orderID)
);

INSERT INTO Customers
VALUES (1, "Nguyen Van A", "nva@gmail.com", "0989999");

INSERT INTO Customers
VALUES (2, "Tran Van B", "tvb@gmail.com", "0978888");

INSERT INTO Orders
VALUES (1, "2025-10-15",1);

INSERT INTO Orders
VALUES (2, "2025-10-08",2);

INSERT INTO Orders
VALUES (3, "2025-09-30",2);

INSERT INTO OrderDetails
VALUES (1, 1, 1, 3, 200);

INSERT INTO OrderDetails
VALUES (2, 1, 3, 1, 500);

INSERT INTO OrderDetails
VALUES (3, 2, 2, 4, 300);

INSERT INTO OrderDetails
VALUES (4, 2, 5, 1, 600);

INSERT INTO OrderDetails
VALUES (5, 3, 4, 10, 100);

INSERT INTO OrderDetails
VALUES (6, 3, 2, 5, 300);

UPDATE Customers
SET `phone` = "0976666"
WHERE `customerId` = 2;

INSERT INTO Orders
VALUES (4, "2021-05-03",3);

SELECT `customerId` FROM Orders
WHERE `orderDate` LIKE "2021%";

DELETE FROM Orders
WHERE `customerId` = 3;

SELECT 
	c.customerId,
    c.customerName,
    COUNT(o.orderId) AS `totalOrders`
FROM
	Customers c
LEFT JOIN
	Orders o ON c.customerId = o.customerId
GROUP BY
	c.customerId, c.customerName;
  
CREATE TABLE Products(
	`productId` INT PRIMARY KEY,
    `productName` VARCHAR(100) NOT NULL
);   

INSERT INTO Products VALUES (1, 'Bàn phím');
INSERT INTO Products VALUES (2, 'Chuột');
INSERT INTO Products VALUES (3, 'Màn hình');
INSERT INTO Products VALUES (4, 'Tai nghe');
INSERT INTO Products VALUES (5, 'Laptop');

SELECT 
	d.orderId,
	p.productName,
    d.quantity,
    d.unitPrice,
    (d.quantity * d.unitPrice) AS lineTotal
FROM
	OrderDetails d
JOIN
	Products p ON d.productId = p.productId
ORDER BY
	d.orderId;