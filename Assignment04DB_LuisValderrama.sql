--*************************************************************************--
-- Title: Assignment04
-- Author: Luis Valderrama
-- Desc: This file demonstrates how to process data in a database
-- Change Log: When,Who,What
-- 2021-04-25, Luis Valderrama, (created DB, added and updated tables, deleted data)
--**************************************************************************--

/*
--Objective: Create DB, create three tables, add constraints, complete tasks: insert/update/delete data

1- Create Assignment04DB_LuisValderrama
2- Create tables: Categories, Products, Inventories
3- Add Constraints 
4- Complete Tasks 1 - 5
    4.1 Task 1: Add data to the Categories table
	4.2 Task 2: Add data to the Products table
	4.3 Task 3: Add data to the Inventories table
	4.4 Task 4: Write code to update the Category "Beverages" to "Drinks"
	4.5 Task 5: Write code to delete all Condiments data from the database
5- Compare Results to Assignment04 Word Doc.
*/

Use Master;
go

If Exists(Select Name from SysDatabases Where Name = 'Assignment04DB_LuisValderrama')
 Begin 
  Alter Database [Assignment04DB_LuisValderrama] set Single_user With Rollback Immediate;
  Drop Database Assignment04DB_LuisValderrama;
 End
go

Create Database Assignment04DB_LuisValderrama;
go

Use Assignment04DB_LuisValderrama;
go

-- Create Tables (Module 01)-- 
Create Table Categories
([CategoryID] [int] IDENTITY(1,1) NOT NULL 
,[CategoryName] [nvarchar](100) NOT NULL
);
go

Create Table Products
([ProductID] [int] IDENTITY(1,1) NOT NULL 
,[ProductName] [nvarchar](100) NOT NULL 
,[CategoryID] [int] NULL  
,[UnitPrice] [money] NOT NULL
);
go

Create Table Inventories
([InventoryID] [int] IDENTITY(1,1) NOT NULL
,[InventoryDate] [Date] NOT NULL
,[ProductID] [int] NOT NULL
,[Count] [int] NOT NULL
);
go

-- Add Constraints (Module 02) -- 
Alter Table Categories 
 Add Constraint pkCategories 
  Primary Key (CategoryId);
go

Alter Table Categories 
 Add Constraint ukCategories 
  Unique (CategoryName);
go

Alter Table Products 
 Add Constraint pkProducts 
  Primary Key (ProductId);
go

Alter Table Products 
 Add Constraint ukProducts 
  Unique (ProductName);
go

Alter Table Products 
 Add Constraint fkProductsToCategories 
  Foreign Key (CategoryId) References Categories(CategoryId);
go

Alter Table Products 
 Add Constraint ckProductUnitPriceZeroOrHigher 
  Check (UnitPrice >= 0);
go

Alter Table Inventories 
 Add Constraint pkInventories 
  Primary Key (InventoryId);
go

Alter Table Inventories
 Add Constraint dfInventoryDate
  Default GetDate() For InventoryDate;
go

Alter Table Inventories
 Add Constraint fkInventoriesToProducts
  Foreign Key (ProductId) References Products(ProductId);
go

Alter Table Inventories 
 Add Constraint ckInventoryCountZeroOrHigher 
  Check ([Count] >= 0);
go


-- Show the Current data in the Categories, Products, and Inventories Tables
Select * from Categories;
go
Select * from Products;
go
Select * from Inventories;
go

/********************************* TASKS *********************************/

-- Add the following data to this database.
-- All answers must include the Begin Tran, Commit Tran, and Rollback Tran transaction statements. 
-- All answers must include the Try/Catch blocks around your transaction processing code.
-- Display the Error message if the catch block is invoked.

/* Add the following data to this database:
Beverages	Chai	18.00	2017-01-01	61
Beverages	Chang	19.00	2017-01-01	87
Condiments	Aniseed Syrup	10.00	2017-01-01	19
Condiments	Chef Anton's Cajun Seasoning	22.00	2017-01-01	81
Beverages	Chai	18.00	2017-02-01	13
Beverages	Chang	19.00	2017-02-01	2
Condiments	Aniseed Syrup	10.00	2017-02-01	1
Condiments	Chef Anton's Cajun Seasoning	22.00	2017-02-01	79
Beverages	Chai	18.00	2017-03-01	18
Beverages	Chang	19.00	2017-03-01	12
Condiments	Aniseed Syrup	10.00	2017-03-01	84
Condiments	Chef Anton's Cajun Seasoning	22.00	2017-03-02	72
*/

--Please use Assignment04DB_LuisValderrama to execute Tasks 1 - 5 below--

USE Assignment04DB_LuisValderrama;
GO

-- Task 1 (20 pts): Add data to the Categories table

BEGIN TRY
  BEGIN TRAN
  --TRANSACTION CODE--
  INSERT INTO Categories (CategoryName)
  VALUES ('Beverages');
  COMMIT TRAN
END TRY
BEGIN CATCH
  IF @@TRANCOUNT > 0
   BEGIN
    ROLLBACK TRAN
   END
  PRINT ERROR_MESSAGE()
END CATCH
GO

BEGIN TRY
  BEGIN TRAN
  --TRANSACTION CODE--
  INSERT INTO Categories (CategoryName)
  VALUES ('Condiments');
  COMMIT TRAN
END TRY
BEGIN CATCH
  IF @@TRANCOUNT > 0
   BEGIN
    ROLLBACK TRAN
   END
  PRINT ERROR_MESSAGE()
END CATCH
GO

SELECT * FROM Categories;
GO

-- Task 2 (20 pts): Add data to the Products table

BEGIN TRY
  BEGIN TRAN
  --TRANSACTION CODE--
  INSERT INTO Products (ProductName, CategoryID, UnitPrice)
  VALUES ('Chai', 1, 18);
  COMMIT TRAN
END TRY
BEGIN CATCH
  IF @@TRANCOUNT > 0
   BEGIN
    ROLLBACK TRAN
   END
  PRINT ERROR_MESSAGE()
END CATCH
GO

BEGIN TRY
  BEGIN TRAN
  --TRANSACTION CODE--
  INSERT INTO Products (ProductName, CategoryID, UnitPrice)
  VALUES ('Chang', 1, 19);
  COMMIT TRAN
END TRY
BEGIN CATCH
  IF @@TRANCOUNT > 0
   BEGIN
    ROLLBACK TRAN
   END
  PRINT ERROR_MESSAGE()
END CATCH
GO

BEGIN TRY
  BEGIN TRAN
  --TRANSACTION CODE--
  INSERT INTO Products (ProductName, CategoryID, UnitPrice)
  VALUES ('Aniseed Syrup', 2, 10);
  COMMIT TRAN
END TRY
BEGIN CATCH
  IF @@TRANCOUNT > 0
   BEGIN
    ROLLBACK TRAN
   END
  PRINT ERROR_MESSAGE()
END CATCH
GO

BEGIN TRY
  BEGIN TRAN
  --TRANSACTION CODE--
  INSERT INTO Products (ProductName, CategoryID, UnitPrice)
  VALUES ('Chef Anton"s Cajun Seasoning', 2, 22);
  COMMIT TRAN
END TRY
BEGIN CATCH
  IF @@TRANCOUNT > 0
   BEGIN
    ROLLBACK TRAN
   END
  PRINT ERROR_MESSAGE()
END CATCH
GO

SELECT * FROM Products;
GO

-- Task 3 (20 pts): Add data to the Inventories table

BEGIN TRY
  BEGIN TRAN
  --TRANSACTION CODE--
  INSERT INTO Inventories (InventoryDate, ProductID, Count)
  VALUES ('20170101', 1, 61);
  COMMIT TRAN
END TRY
BEGIN CATCH
  IF @@TRANCOUNT > 0
   BEGIN
    ROLLBACK TRAN
   END
  PRINT ERROR_MESSAGE()
END CATCH
GO

BEGIN TRY
  BEGIN TRAN
  --TRANSACTION CODE--
  INSERT INTO Inventories (InventoryDate, ProductID, Count)
  VALUES ('20170101', 2, 87);
  COMMIT TRAN
END TRY
BEGIN CATCH
  IF @@TRANCOUNT > 0
   BEGIN
    ROLLBACK TRAN
   END
  PRINT ERROR_MESSAGE()
END CATCH
GO

BEGIN TRY
  BEGIN TRAN
  --TRANSACTION CODE--
  INSERT INTO Inventories (InventoryDate, ProductID, Count)
  VALUES ('20170101', 3, 19);
  COMMIT TRAN
END TRY
BEGIN CATCH
  IF @@TRANCOUNT > 0
   BEGIN
    ROLLBACK TRAN
   END
  PRINT ERROR_MESSAGE()
END CATCH
GO

BEGIN TRY
  BEGIN TRAN
  --TRANSACTION CODE--
  INSERT INTO Inventories (InventoryDate, ProductID, Count)
  VALUES ('20170101', 4, 81);
  COMMIT TRAN
END TRY
BEGIN CATCH
  IF @@TRANCOUNT > 0
   BEGIN
    ROLLBACK TRAN
   END
  PRINT ERROR_MESSAGE()
END CATCH
GO

BEGIN TRY
  BEGIN TRAN
  --TRANSACTION CODE--
  INSERT INTO Inventories (InventoryDate, ProductID, Count)
  VALUES ('20170201', 1, 13);
  COMMIT TRAN
END TRY
BEGIN CATCH
  IF @@TRANCOUNT > 0
   BEGIN
    ROLLBACK TRAN
   END
  PRINT ERROR_MESSAGE()
END CATCH
GO

BEGIN TRY
  BEGIN TRAN
  --TRANSACTION CODE--
  INSERT INTO Inventories (InventoryDate, ProductID, Count)
  VALUES ('20170201', 2, 2);
  COMMIT TRAN
END TRY
BEGIN CATCH
  IF @@TRANCOUNT > 0
   BEGIN
    ROLLBACK TRAN
   END
  PRINT ERROR_MESSAGE()
END CATCH
GO

BEGIN TRY
  BEGIN TRAN
  --TRANSACTION CODE--
  INSERT INTO Inventories (InventoryDate, ProductID, Count)
  VALUES ('20170201', 3, 1);
  COMMIT TRAN
END TRY
BEGIN CATCH
  IF @@TRANCOUNT > 0
   BEGIN
    ROLLBACK TRAN
   END
  PRINT ERROR_MESSAGE()
END CATCH
GO

BEGIN TRY
  BEGIN TRAN
  --TRANSACTION CODE--
  INSERT INTO Inventories (InventoryDate, ProductID, Count)
  VALUES ('20170201', 4, 79);
  COMMIT TRAN
END TRY
BEGIN CATCH
  IF @@TRANCOUNT > 0
   BEGIN
    ROLLBACK TRAN
   END
  PRINT ERROR_MESSAGE()
END CATCH
GO

BEGIN TRY
  BEGIN TRAN
  --TRANSACTION CODE--
  INSERT INTO Inventories (InventoryDate, ProductID, Count)
  VALUES ('20170301', 1, 18);
  COMMIT TRAN
END TRY
BEGIN CATCH
  IF @@TRANCOUNT > 0
   BEGIN
    ROLLBACK TRAN
   END
  PRINT ERROR_MESSAGE()
END CATCH
GO

BEGIN TRY
  BEGIN TRAN
  --TRANSACTION CODE--
  INSERT INTO Inventories (InventoryDate, ProductID, Count)
  VALUES ('20170301', 2, 12);
  COMMIT TRAN
END TRY
BEGIN CATCH
  IF @@TRANCOUNT > 0
   BEGIN
    ROLLBACK TRAN
   END
  PRINT ERROR_MESSAGE()
END CATCH
GO

BEGIN TRY
  BEGIN TRAN
  --TRANSACTION CODE--
  INSERT INTO Inventories (InventoryDate, ProductID, Count)
  VALUES ('20170301', 3, 84);
  COMMIT TRAN
END TRY
BEGIN CATCH
  IF @@TRANCOUNT > 0
   BEGIN
    ROLLBACK TRAN
   END
  PRINT ERROR_MESSAGE()
END CATCH
GO

BEGIN TRY
  BEGIN TRAN
  --TRANSACTION CODE--
  INSERT INTO Inventories (InventoryDate, ProductID, Count)
  VALUES ('20170301', 4, 72);
  COMMIT TRAN
END TRY
BEGIN CATCH
  IF @@TRANCOUNT > 0
   BEGIN
    ROLLBACK TRAN
   END
  PRINT ERROR_MESSAGE()
END CATCH
GO

-- Task 4 (10 pts): Write code to update the Category "Beverages" to "Drinks"

BEGIN TRY
  BEGIN TRAN
  --TRANSACTION CODE--
  UPDATE Categories
  SET CategoryName = 'Drinks'
  WHERE CategoryID = 1
  COMMIT TRAN
END TRY
BEGIN CATCH
  IF @@TRANCOUNT > 0
   BEGIN
    ROLLBACK TRAN
   END
  PRINT ERROR_MESSAGE()
END CATCH
GO

SELECT * FROM Categories;
GO
-- Task 5 (30 pts): Write code to delete all Condiments data from the database (in all three tables!)  

BEGIN TRY
  BEGIN TRAN
  --TRANSACTION CODE--
  DELETE FROM Inventories
  WHERE ProductID = 3;

  DELETE FROM Inventories
  WHERE ProductID = 4;
  
  DELETE FROM Products
  WHERE CategoryID = 2;
  
  DELETE FROM Categories
  WHERE CategoryID = 2;

  COMMIT TRAN
END TRY
BEGIN CATCH
  IF @@TRANCOUNT > 0
   BEGIN
    ROLLBACK TRAN
   END
  PRINT ERROR_MESSAGE()
END CATCH
GO

USE Assignment04DB_LuisValderrama;
GO 

SELECT * FROM Inventories;
SELECT * FROM Products;
SELECT * FROM Categories;
GO
 
/***************************************************************************************/