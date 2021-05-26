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
--     refereeID [NVARCHAR](50) NOT NULL,
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
--     eventDescription [NVARCHAR](50) NOT NULL,
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
--     matchId INT NOT NULL,
--     PRIMARY KEY (userId, matchId)
-- );
-- GO

--------------insertion section------------

-- INSERT INTO dbo.matches (matchId, matchDate , matchHour , hostTeam , guestTeam , staduim , refereeID, score)
-- VALUES (5, '01/01/2021', '19:00', 'Charlton Athletic', 'Sunderland', 'Metropolitano', 6, '0-3');

-- INSERT INTO dbo.matches (matchId, matchDate , matchHour , hostTeam , guestTeam , staduim , refereeID, score)
-- VALUES (10, '02/01/2021', '21:00', 'Blackburn Rovers', 'West Ham United', 'Teddy', 7, '2-1');

-- INSERT INTO dbo.matches (matchId, matchDate , matchHour , hostTeam , guestTeam , staduim , refereeID)
-- VALUES (15, '10/07/2021', '19:00', 'West Ham United', 'Charlton Athletic', 'Camp Nou', 8);

-- INSERT INTO dbo.matches (matchId, matchDate , matchHour , hostTeam , guestTeam , staduim , refereeID)
-- VALUES (20, '10/07/2021', '20:00', 'Sunderland', 'Blackburn Rovers', 'Maracana', 9);

-- UPDATE dbo.matches
-- SET stage = 10;


-- -- INSERT INTO dbo.eventLog (matchId, eventDate , eventHour , eventDescription)
-- -- VALUES (1,'12/12/2021','17:05','Goal Ronaldo');


-- ALTER TABLE dbo.matches
-- ADD stage INTEGER;

-- ALTER TABLE dbo.matches
-- Change "column 1" "column 2" ["Data Type"];

-- EXEC sp_rename 'dbo.matches.coachID', 'refereeID', 'COLUMN';

-- INSERT INTO dbo.eventLog (matchId, eventDate , eventHour , eventDescription)
-- VALUES (1,'12/12/2021','17:05','Goal Ronaldo');

