CREATE DB_Ventas_ETL;
GO

USE DB_Ventas_ETL;
GO


CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(50),
    City VARCHAR(50),
    Country VARCHAR(50)
);


CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10, 2),
    Stock INT
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    Status VARCHAR(20),
    CONSTRAINT FK_Customer FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);


CREATE TABLE OrderDetails (
    OrderID INT,
    ProductID INT,
    Quantity INT,
    TotalPrice DECIMAL(10, 2),
    PRIMARY KEY (OrderID, ProductID), 
    CONSTRAINT FK_Order FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    CONSTRAINT FK_Product FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

