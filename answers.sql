--Question 1: Create the ProductDetail table to represent 1NF
CREATE TABLE ProductDetail_1NF (OrderID INT, CustomerName VARCHAR(100),
Product VARCHAR(50)
);

-- Insert data into the normalized table
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product)
VALUES 
    (101, 'John Doe', 'Laptop'),
    (101, 'John Doe', 'Mouse'),
    (102, 'Jane Smith', 'Tablet'),
    (102, 'Jane Smith', 'Keyboard'),
    (102, 'Jane Smith', 'Mouse'),
    (103, 'Emily Clark', 'Phone');

--Question 2: Create Orders table (OrderID -> CustomerName)
CREATE TABLE Orders (OrderID INT PRIMARY KEY, CustomerName VARCHAR(100)
);

-- Create OrderItems table to store product details
CREATE TABLE OrderItems (OrderID INT, Product VARCHAR(50), Quantity INT,
PRIMARY KEY (OrderID, Product),
FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Insert data into Orders table
INSERT INTO Orders (OrderID, CustomerName)
SELECT DISTINCT OrderID, CustomerName
FROM OrderDetails;

-- Insert data into OrderItems table
INSERT INTO OrderItems (OrderID, Product, Quantity)
SELECT OrderID, Product, Quantity
FROM OrderDetails;