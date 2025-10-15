USE hw02;

CREATE TABLE Products(
	`productID` INT PRIMARY KEY,
    `productName` VARCHAR(50) NOT NULL,
    `category` VARCHAR(50) NOT NULL,
    `price` DEC CHECK(price >= 0),
    `stockQuantity` INT CHECK(stockQuantity >= 0)
);

ALTER TABLE Products
ADD `placeOfManufacture` VARCHAR(50) NOT NULL;

ALTER TABLE Products
ADD `manufacturer` VARCHAR(50) NOT NULL;

ALTER TABLE Products
ADD `expirationDate` DATE NOT NULL;