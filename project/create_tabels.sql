-- Create a new table called 'users' in schema 'dbo'
-- Drop the table if it already exists
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

<<<<<<< HEAD
-- IF OBJECT_ID('dbo.event_log', 'U') IS NOT NULL
-- DROP TABLE dbo.event_log
-- GO

-- CREATE TABLE dbo.event_log
-- ( 
--     game_id INTEGER NOT NULL PRIMARY KEY,
--     game_date DATE NOT NULL,
--     minute INTEGER NOT NULL,
--     event_description INTEGER NOT NULL 
-- );
-- GO



-- IF OBJECT_ID('dbo.past_matches', 'U') IS NOT NULL
-- DROP TABLE dbo.past_matches
-- GO

-- CREATE TABLE dbo.matches
-- (
--     stage INTEGER NOT NULL PRIMARY KEY,
--     match_date DATE NOT NULL,
--     hour [NVARCHAR](50)  NOT NULL,
--     home_team [NVARCHAR](50)  NOT NULL,
--     away_team [NVARCHAR](50)  NOT NULL,
--     court [NVARCHAR](50) NOT NULL,
--     result [NVARCHAR](50),
--     game_id INTEGER REFERENCES db.event_log (game_id)-- check for object insertion
-- );
-- GO

-- IF OBJECT_ID('dbo.FavoritePlayers', 'U') IS NOT NULL
-- DROP TABLE dbo.FavoritePlayers
-- GO

-- CREATE TABLE dbo.FavoritePlayers
-- (
--     user_id INTEGER NOT NULL PRIMARY KEY,
--     player_id INTEGER NOT NULL ,
-- );
-- GO

-- Create the table in the specified schema
=======
-- -- Create a new table called 'TableName' in schema 'SchemaName'
-- -- Drop the table if it already exists
-- IF OBJECT_ID('dbo.matches', 'U') IS NOT NULL
-- DROP TABLE dbo.matches
-- GO
-- -- Create the table in the specified schema
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

-- -- Create a new table called 'TableName' in schema 'SchemaName'
-- -- Drop the table if it already exists
-- IF OBJECT_ID('dbo.eventLog', 'U') IS NOT NULL
-- DROP TABLE dbo.eventLog
-- GO
-- -- Create the table in the specified schema
>>>>>>> 0f20a22... yof
-- CREATE TABLE dbo.eventLog
-- (   
--     matchId INT NOT NULL,    
--     eventDate DATE NOT NULL,
--     eventHour TIME NOT NULL,
<<<<<<< HEAD
--     eventDescription [NVARCHAR](50) NOT NULL,
=======
>>>>>>> 0f20a22... yof
--     CONSTRAINT matchId FOREIGN KEY (matchId)
--     REFERENCES dbo.matches(matchId),
--     CONSTRAINT PK_matchId_hour PRIMARY KEY (matchId, eventHour)
-- );
-- GO
<<<<<<< HEAD

-- INSERT INTO dbo.matches (matchId, matchDate , matchHour , hostTeam , guestTeam , staduim ,coachID,score)
-- VALUES (27, '10/07/2021', '19:00', 'Atletico madrid', 'Paris Saint-Germain', 'Metropolitano',6, '0-3');

-- UPDATE dbo.evenLog
-- SET eventDate = '12/12/2020'
-- WHERE matchId = 1;

-- -- INSERT INTO dbo.eventLog (matchId, eventDate , eventHour , eventDescription)
-- -- VALUES (1,'12/12/2021','17:05','Goal Ronaldo');
=======
>>>>>>> 0f20a22... yof
