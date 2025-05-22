-- Create database if not exists
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'collateral_db')
BEGIN
    CREATE DATABASE collateral_db;
END
GO

-- Use the database
USE collateral_db;
GO

-- Create table if not exists
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='MyTable' AND xtype='U')
BEGIN
    CREATE TABLE MyTable (
        Id INT PRIMARY KEY IDENTITY(1,1),
        Name NVARCHAR(100) NOT NULL
    );
END
GO