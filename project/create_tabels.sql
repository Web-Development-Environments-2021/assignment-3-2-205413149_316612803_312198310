-- IF OBJECT_ID('dbo.users', 'U') IS NOT NULL
-- DROP TABLE dbo.users
-- GO
-- CREATE TABLE dbo.users
-- (
--     userId INTEGER IDENTITY(1,1) NOT NULL,
--     username [NVARCHAR](50) NOT NULL,
--     firstname [NVARCHAR](50)  NOT NULL,
--     lastname [NVARCHAR](50)  NOT NULL,
--     country [NVARCHAR](50)  NOT NULL,
--     password varchar(255) NOT NULL,
--     email varchar(255) NOT NULL,
--     image varchar(255),
--     PRIMARY KEY (userId)
-- );
-- GO

-- IF OBJECT_ID('dbo.matches', 'U') IS NOT NULL
-- DROP TABLE dbo.matches
-- GO
-- CREATE TABLE dbo.matches
-- (
--     matchId INT NOT NULL PRIMARY KEY, -- primary key column
--     matchDate DATE NOT NULL,
--     matchHour TIME NOT NULL,
--     hostTeam [NVARCHAR](50)  NOT NULL,
--     guestTeam [NVARCHAR](50)  NOT NULL,
--     staduim [NVARCHAR](50) NOT NULL,
--     coachID [NVARCHAR](50) NOT NULL,
--     score [NVARCHAR](50),
-- );
-- GO

-- IF OBJECT_ID('dbo.eventLog', 'U') IS NOT NULL
-- DROP TABLE dbo.eventLog
-- GO
-- CREATE TABLE dbo.eventLog
-- (   
--     matchId INT NOT NULL,    
--     eventDate DATE NOT NULL,
--     eventHour TIME NOT NULL,
--     CONSTRAINT matchId FOREIGN KEY (matchId)
--     REFERENCES dbo.matches(matchId),
--     CONSTRAINT PK_matchId_hour PRIMARY KEY (matchId, eventHour)
-- );
-- GO

-- IF OBJECT_ID('dbo.FavoriteMatches', 'U') IS NOT NULL
-- DROP TABLE dbo.FavoriteMatches
-- GO
-- CREATE TABLE dbo.FavoriteMatches
-- (
--     userId INT NOT NULL, 
--     matchId INT NOT NULL
-- );
-- GO

--------------insertion section------------

-- INSERT INTO dbo.matches (matchId, matchDate , matchHour , hostTeam , guestTeam , staduim ,coachID,score)
-- VALUES (27, '10/07/2021', '19:00', 'Atletico madrid', 'Paris Saint-Germain', 'Metropolitano',6, '0-3');

-- UPDATE dbo.evenLog
-- SET eventDate = '12/12/2020'
-- WHERE matchId = 1;

-- INSERT INTO dbo.eventLog (matchId, eventDate , eventHour , eventDescription)
-- VALUES (1,'12/12/2021','17:05','Goal Ronaldo');
