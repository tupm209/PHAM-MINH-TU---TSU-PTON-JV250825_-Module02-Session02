CREATE SCHEMA hw05;
USE hw05;

CREATE TABLE Products(
	`productId` INT PRIMARY KEY,
    `productName` VARCHAR(100) UNIQUE NOT NULL,
    `category` VARCHAR(50) NOT NULL,
    `price` DEC(10, 2) CHECK(price > 0) NOT NULL,
    `stockQuantity` INT NOT NULL
);

CREATE TABLE Orders(
	`orderId` INT PRIMARY KEY,
    `orderDate` DATE NOT NULL,
    `productId` INT NOT NULL,
    `quantity` INT CHECK(quantity > 0) NOT NULL,
    `totalAmount` DEC(10, 2) CHECK(totalAmount > 0) NOT NULL,
    FOREIGN KEY (productId)
    REFERENCES Products(productId)
    );
    
INSERT INTO Products
VALUES (1, "Giay Sneaker", "Sneaker", 1500, 100);

INSERT INTO Products
VALUES (2, "Ao Phong", "Ao", 500, 50);

INSERT INTO Products
VALUES (3, "Quan Jeans", "Quan", 700, 80);

INSERT INTO Orders
VALUES(1, "2025-10-15", 1, 3, 3*1500);

INSERT INTO Orders
VALUES(2, "2025-10-15", 2, 2, 2*500);

UPDATE Products
SET `price` = 600
WHERE `productId` = 2;

UPDATE Orders
SET `totalAmount` = `quantity` * (SELECT `price` FROM Products WHERE `productId` = 2)
WHERE `orderId` = 2;

UPDATE Products
SET `price` = 1400
WHERE `productId` = 1;

UPDATE Orders
SET `totalAmount` = `quantity` * (
	SELECT `price` FROM Products 
    WHERE Products.productId = Orders.productId
)
WHERE `orderId` = 1;

UPDATE Products
SET `stockQuantity` = Products.stockQuantity - (
	SELECT `quantity` FROM Orders
    WHERE Products.productId = Orders.productId
)
WHERE `productId` = 1;

UPDATE Products
SET `stockQuantity` = Products.stockQuantity - (
	SELECT `quantity` FROM Orders
    WHERE Products.productId = Orders.productId
)
WHERE `productId` = 2;

SELECT `productId`, `productName`, `stockQuantity` FROM Products;

SELECT 
    p.productName,
    o.quantity,
    o.totalAmount
FROM Orders o
JOIN Products p ON o.productId = p.productId;
