-- Create a new table called 'users' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.users', 'U') IS NOT NULL
DROP TABLE dbo.users
GO
-- Create the table in the specified schema
CREATE TABLE dbo.users
(
    username [NVARCHAR](50) NOT NULL PRIMARY KEY,
    firstname [NVARCHAR](50)  NOT NULL,
    lastname [NVARCHAR](50)  NOT NULL,
    country [NVARCHAR](50)  NOT NULL,
    password varchar(255) NOT NULL,
    email varchar(255) NOT NULL,
    image varchar(255)
);
GO
