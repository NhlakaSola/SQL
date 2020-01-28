

--CREATION OF TABLES
CREATE TABLE Customers(
   CustomerID  SERIAL PRIMARY KEY,
   FirstName   VARCHAR(50),
   LastName    VARCHAR(50),
   Gender      VARCHAR,
   Address     VARCHAR(200),
   Phone       BIGINT,
   Email       VARCHAR(100),
   City        VARCHAR(20),
   Country     VARCHAR(50)
);

CREATE TABLE Employees(
   EmployeeID SERIAL PRIMARY KEY,
   FirstName  VARCHAR(50),
   LastName   VARCHAR(50),
   Email      VARCHAR(100),
   JobTitle   VARCHAR(20)
);

CREATE TABLE Payments(
   PaymentID      SERIAL PRIMARY KEY,
   CustomerID     INT                references Customers(CustomerID),
   PaymentDate    DATE,
   Amount         NUMERIC(5,2)
);

CREATE TABLE Products(
   ProductID      SERIAL PRIMARY KEY,
   ProductName    VARCHAR(100),
   Description    VARCHAR(300),
   BuyPrice       NUMERIC(5,2)
);

CREATE TABLE Orders(
   OrderID                   SERIAL PRIMARY KEY,
   ProductID                 INT references Products(ProductID),
   PaymentID                 INT references Payments(PaymentID),
   FulfilledByEmployeeID     INT references Employees(EmployeeID),
   DateRequired              DATE,
   DateShipped               DATE,
   Status                    VARCHAR(20)
);

-- INSERTING INTO TABLES
INSERT INTO CUSTOMERS(FirstName,LastName,Gender,Address,Phone,Email,City,Country)
                  VALUES('John','Hibert','Male','284 chaucer st',084789657,'john@gmail.com','Johannesburg','South'),
                        ('Thando','Sithole','Female','240 Sect 1',0794445584,'thando@gmail.com','Cape Town','South Africa'),
                        ('Leon','Glen','Male','81 Everton Rd,Gillits',0820832830,'Leon@gmail.com','Durban','South Africa'),
                        ('Charl','Muller','Mal','290A Dorset Ecke',+44856872553,'Charl.muller@yahoo.com','Berlin','Germany'),
                        ('Julia','Stein','Female','2 Wernerring',+448672445058,'Js234@yahoo.com','Frankfurt','Germany');


INSERT INTO EMPLOYEES(FirstName,LastName,Email,JobTitle)
            VALUES('Kani','Matthew','mat@gmail.com','Manager'),
                  ('Lesly','Cronje','LesC@gmail.com','Clerk'),
                  ('Gideon','Maduku','m@gmail.com','Accountant');

INSERT INTO PAYMENTS(CustomerID,PaymentDate,Amount)
            VALUES(1,'01-09-2018',150.75),
                  (5,'03-09-2018',150.75),
                  (4,'03-09-2018',700.60);


INSERT INTO PRODUCTS(ProductName,Description,BuyPrice)
            VALUES('Harley Davidson Chopper','This replica features working kickstand, front suspension, gear-shift lever',150.75),
                  ('Classic Car','Turnable front wheels, steering function',550.75),
                  ('Sports car','Turnable front wheels, steering function',700.60);


INSERT INTO ORDERS(ProductID,PaymentID,FulfilledByEmployeeID,DateRequired,DateShipped,Status)
            VALUES(1,1,2,'05-09-2018',NULL,'Not shipped'),
                  (1,2,2,'04-09-2018','03-09-2018','Shipped'),
                  (3,3,3,'06-09-2018',NULL,'Not shipped');
