CREATE DATABASE GamesDB;

USE GamesDB;

CREATE TABLE Games (
    Game_ID INT PRIMARY KEY,
    Game_Name VARCHAR(50),
    Game_Type VARCHAR(30),
    Team_Size INT
);

INSERT INTO Games (Game_ID, Game_Name, Game_Type, Team_Size)
VALUES
(1, 'Cricket', 'Outdoor', 11),
(2, 'Football', 'Outdoor', 11),
(3, 'Tennis', 'Outdoor', 1),
(4, 'Basketball', 'Indoor', 5),
(5, 'Badminton', 'Indoor', 1);



CREATE TABLE Players (
    Player_ID INT PRIMARY KEY,
    Player_Name VARCHAR(50),
    Age INT,
    Gender VARCHAR(10),
    Game_ID INT,
    Country VARCHAR(30),
    Matches_Played INT,
    Ranking INT,

    FOREIGN KEY (Game_ID)
    REFERENCES Games(Game_ID)
);

INSERT INTO Players
(Player_ID, Player_Name, Age, Gender, Game_ID, Country, Matches_Played, Ranking)
VALUES
(101, 'Roger Federer', 41, 'Male', 3, 'Switzerland', 1250, 5),
(102, 'LeBron James', 39, 'Male', 4, 'USA', 1400, 3),
(103, 'Virat Kohli', 35, 'Male', 1, 'India', 650, 2),
(104, 'Serena Williams', 40, 'Female', 3, 'USA', 850, 8),
(105, 'Lionel Messi', 37, 'Male', 2, 'Argentina', 900, 1),
(106, 'Rohit Sharma', 36, 'Male', 1, 'India', 500, 10),
(107, 'Neymar Jr', 33, 'Male', 2, 'Brazil', 700, 12),
(108, 'PV Sindhu', 29, 'Female', 5, 'India', 450, 15),
(109, 'Stephen Curry', 36, 'Male', 4, 'USA', 950, 4),
(110, 'Novak Djokovic', 37, 'Male', 3, 'Serbia', 1300, 2);

SELECT * FROM Players;

SELECT
    P.Player_ID,
    P.Player_Name,
    P.Age,
    G.Game_Name,
    G.Game_Type,
    P.Country,
    P.Ranking
FROM Players P
JOIN Games G
ON P.Game_ID = G.Game_ID;

CREATE VIEW Qualified_Players AS
SELECT
    P.Player_ID,
    P.Player_Name,
    P.Age,
    G.Game_Name,
    G.Game_Type,
    P.Country,
    P.Matches_Played,
    P.Ranking,
    'QUALIFY' AS Status
FROM Players P
JOIN Games G
ON P.Game_ID = G.Game_ID
WHERE P.Age > 36;

SELECT * FROM Qualified_Players;

CREATE VIEW Not_Qualified_Players AS
SELECT
    P.Player_ID,
    P.Player_Name,
    P.Age,
    G.Game_Name,
    G.Game_Type,
    P.Country,
    P.Matches_Played,
    P.Ranking,
    'NOT QUALIFY' AS Status
FROM Players P
JOIN Games G
ON P.Game_ID = G.Game_ID
WHERE P.Age <= 36;

SELECT * FROM Not_Qualified_Players;

SELECT
    P.Player_ID,
    P.Player_Name,
    P.Age,
    G.Game_Name,
    P.Country,

    CASE
        WHEN P.Age > 36 THEN 'QUALIFY'
        ELSE 'NOT QUALIFY'
    END AS Status

FROM Players P
JOIN Games G
ON P.Game_ID = G.Game_ID;