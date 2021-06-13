-- IF OBJECT_ID('dbo.users', 'U') IS NOT NULL
-- DROP TABLE dbo.users
-- GO
-- CREATE TABLE dbo.users
-- (
--     userId INTEGER IDENTITY(1,1) NOT NULL,
--     username VARCHAR(50) NOT NULL,
--     firstname VARCHAR(50)  NOT NULL,
--     lastname VARCHAR(50)  NOT NULL,
--     country VARCHAR(50)  NOT NULL,
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
--     matchId INTEGER IDENTITY(1,1) NOT NULL, -- primary key column
--     league INT NOT NULL,
--     season VARCHAR(50) NOT NULL,
--     stage INT NOT NULL,
--     matchDate DATE NOT NULL,
--     matchHour VARCHAR(50) NOT NULL,
--     hostTeam VARCHAR(50)  NOT NULL,
--     guestTeam VARCHAR(50)  NOT NULL,
--     stadium VARCHAR(50) NOT NULL,
--     refereeId INT NOT NULL,
--     score VARCHAR(50),
--     PRIMARY KEY (matchId)
-- );
-- GO

-- IF OBJECT_ID('dbo.eventLog', 'U') IS NOT NULL
-- DROP TABLE dbo.eventLog
-- GO
-- CREATE TABLE dbo.eventLog
-- (   
--     matchId INT NOT NULL,
--     eventId INT IDENTITY(1,1) NOT NULL, 
--     event_type VARCHAR (20) NOT NULL CHECK (event_type IN('Goal', 'Offside', 'Fault', 'YellowCard', 'RedCard', 'Injury', 'Sub')),
--     eventDate DATE NOT NULL,
--     eventHour VARCHAR(50) NOT NULL,
--     minuteInGame INT NOT NULL,
--     eventDescription VARCHAR(200) NOT NULL,
--     CONSTRAINT matchId FOREIGN KEY (matchId)
--     REFERENCES dbo.matches(matchId),
--     CONSTRAINT PK_matchId_hour PRIMARY KEY (matchId, eventId)
-- );
-- GO

-- IF OBJECT_ID('dbo.FavoriteMatches', 'U') IS NOT NULL
-- DROP TABLE dbo.FavoriteMatches
-- GO
-- CREATE TABLE dbo.FavoriteMatches
-- (
--     userId INT FOREIGN KEY REFERENCES dbo.users(userId) NOT NULL, 
--     matchId INT FOREIGN KEY REFERENCES dbo.matches(matchId) NOT NULL,
--     PRIMARY KEY (userId, matchId)
-- );
-- GO

-- -- PROJECT - create FAR table --
-- IF OBJECT_ID('dbo.FARs', 'U') IS NOT NULL
-- DROP TABLE dbo.FARs
-- GO
-- CREATE TABLE dbo.FARs
-- (
--     FARId INT FOREIGN KEY REFERENCES dbo.users(userId) NOT NULL PRIMARY KEY
-- );
-- GO

-------------------------------------------insertion section------------------------------------------------------------
-- INSERT INTO dbo.matches (league, season, stage, matchDate, matchHour , hostTeam , guestTeam , stadium , refereeId, score)
-- VALUES (271, '2020/2021', 10, '2021-01-01','19:00', 'AGF', 'SønderjyskE', 'Metropolitano', 6, '0-3');

-- INSERT INTO dbo.matches (league, season, stage, matchDate, matchHour , hostTeam , guestTeam , stadium , refereeId, score)
-- VALUES (271, '2020/2021', 10, '2021-01-02', '21:00', 'NY Cosmos', 'Randers', 'Teddy', 7, '2-1');

-- INSERT INTO dbo.matches (league, season,stage, matchDate, matchHour , hostTeam , guestTeam , stadium , refereeId)
-- VALUES (271, '2020/2021', 10, '2021-07-11', '19:00', 'Randers', 'AGF', 'Camp Nou', 8);

-- INSERT INTO dbo.matches (league, season, stage, matchDate, matchHour , hostTeam , guestTeam , stadium , refereeId)
-- VALUES (271, '2020/2021', 10, '2021-07-10', '20:00', 'SønderjyskE', 'NY Cosmos', 'Maracana', 9);


-- INSERT INTO dbo.eventLog (matchId, event_type, eventDate , eventHour ,minuteInGame, eventDescription)
-- VALUES (1, 'Goal' , '2021-01-01','19:05', 5, 'Goal Ronaldo');

-- INSERT INTO dbo.eventLog (matchId, event_type, eventDate , eventHour ,minuteInGame, eventDescription)
-- VALUES (1, 'Goal' , '2021-01-01','19:30', 30, 'Goal Messi');

-- INSERT INTO dbo.eventLog (matchId, event_type, eventDate , eventHour ,minuteInGame, eventDescription)
-- VALUES (1, 'Goal' , '2021-01-01','19:55', 55, 'Goal Buzaglo');

-- INSERT INTO dbo.eventLog (matchId, event_type, eventDate , eventHour ,minuteInGame, eventDescription)
-- VALUES (2, 'Goal' , '2021-01-02','21:30', 30, 'Goal Auzil');

-- INSERT INTO dbo.eventLog (matchId, event_type, eventDate , eventHour ,minuteInGame, eventDescription)
-- VALUES (2, 'Goal' , '2021-01-02','21:35', 35, 'Goal Pele');

-- INSERT INTO dbo.eventLog (matchId, event_type, eventDate , eventHour ,minuteInGame, eventDescription)
-- VALUES (2, 'Goal' , '2021-01-02','21:45', 45, 'Goal Tevez');


 -- INSERT INTO dbo.FARs (FARId)
-- VALUES (1)

-- delete FROM users where userId=5

-- update matches set hostTeam = 'Silkeborg'
-- where hostTeam = 'Esbjerg'

-- update matches set guestTeam = 'Silkeborg'
-- where guestTeam = 'Esbjerg'

-- update matches set hostTeam = 'Midtjylland'
-- where hostTeam = 'SønderjyskE'

-- update matches set guestTeam = 'Midtjylland'
-- where guestTeam = 'SønderjyskE'