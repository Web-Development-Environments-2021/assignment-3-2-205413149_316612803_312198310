-- -- Create a new table called 'users' in schema 'dbo'
-- -- Drop the table if it already exists
-- IF OBJECT_ID('dbo.users', 'U') IS NOT NULL
-- DROP TABLE dbo.users
-- GO
-- -- Create the table in the specified schema
-- CREATE TABLE dbo.users
-- (
--     username [NVARCHAR](50) NOT NULL PRIMARY KEY,
--     firstname [NVARCHAR](50)  NOT NULL,
--     lastname [NVARCHAR](50)  NOT NULL,
--     country [NVARCHAR](50)  NOT NULL,
--     password varchar(255) NOT NULL,
--     email varchar(255) NOT NULL,
--     image varchar(255)
-- );
-- GO

-- Create a new table called 'TableName' in schema 'SchemaName'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.matches', 'U') IS NOT NULL
DROP TABLE dbo.matches
GO
-- Create the table in the specified schema
CREATE TABLE dbo.matches
(
    matchId INT NOT NULL PRIMARY KEY, -- primary key column
    matchDate DATE NOT NULL,
    matchHour TIME NOT NULL,
    hostTeam [NVARCHAR](50)  NOT NULL,
    guestTeam [NVARCHAR](50)  NOT NULL,
    staduim [NVARCHAR](50) NOT NULL,
    coachID [NVARCHAR](50) NOT NULL,
    score [NVARCHAR](50),
);
GO

-- Create a new table called 'TableName' in schema 'SchemaName'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.eventLog', 'U') IS NOT NULL
DROP TABLE dbo.eventLog
GO
-- Create the table in the specified schema
CREATE TABLE dbo.eventLog
(   
    matchId INT NOT NULL,    
    eventDate DATE NOT NULL,
    eventHour TIME NOT NULL,
    CONSTRAINT matchId FOREIGN KEY (matchId)
    REFERENCES dbo.matches(matchId),
    CONSTRAINT PK_matchId_hour PRIMARY KEY (matchId, eventHour)
);
GO
