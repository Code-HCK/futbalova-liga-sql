-- Informačný systém pre futbalovú ligu (Oracle SQL)
-- Časť 1: tabuľky a testovacie dáta

CREATE TABLE Leagues (
    league_id NUMBER PRIMARY KEY,
    name VARCHAR2(50),
    country VARCHAR2(50)
);

CREATE TABLE Stadiums (
    stadium_id NUMBER PRIMARY KEY,
    name VARCHAR2(50),
    capacity NUMBER
);

CREATE TABLE Teams (
    team_id NUMBER PRIMARY KEY,
    name VARCHAR2(50),
    city VARCHAR2(50),
    league_id NUMBER,
    stadium_id NUMBER,
    FOREIGN KEY (league_id) REFERENCES Leagues(league_id),
    FOREIGN KEY (stadium_id) REFERENCES Stadiums(stadium_id)
);

CREATE TABLE Players (
    player_id NUMBER PRIMARY KEY,
    name VARCHAR2(50),
    age NUMBER,
    position VARCHAR2(30),
    team_id NUMBER,
    FOREIGN KEY (team_id) REFERENCES Teams(team_id)
);

CREATE TABLE Matches (
    match_id NUMBER PRIMARY KEY,
    match_date DATE,
    stadium_id NUMBER,
    away_team NUMBER,
    home_team NUMBER,
    FOREIGN KEY (stadium_id) REFERENCES Stadiums(stadium_id),
    FOREIGN KEY (away_team) REFERENCES Teams(team_id),
    FOREIGN KEY (home_team) REFERENCES Teams(team_id)
);

CREATE TABLE Stats (
    stat_id NUMBER PRIMARY KEY,
    goals NUMBER,
    assists NUMBER,
    player_id NUMBER,
    match_id NUMBER,
    FOREIGN KEY (player_id) REFERENCES Players(player_id),
    FOREIGN KEY (match_id) REFERENCES Matches(match_id)
);
-- INSERT DATA INSERT INTO Leagues VALUES (1, 'Premier League', 'England');
INSERT INTO Leagues VALUES (2, 'La Liga', 'Spain');
INSERT INTO Leagues VALUES (3, 'Serie A', 'Italy');
INSERT INTO Leagues VALUES (4, 'Bundesliga', 'Germany');
INSERT INTO Leagues VALUES (5, 'Ligue 1', 'France');
INSERT INTO Leagues VALUES (6, 'Eredivisie', 'Netherlands');
INSERT INTO Leagues VALUES (7, 'Primeira Liga', 'Portugal');
INSERT INTO Leagues VALUES (8, 'Super Lig', 'Turkey');
INSERT INTO Leagues VALUES (9, 'Belgian Pro League', 'Belgium');
INSERT INTO Leagues VALUES (10, 'Scottish Premiership', 'Scotland');
INSERT INTO Leagues VALUES (11, 'Austrian Bundesliga', 'Austria');
INSERT INTO Leagues VALUES (12, 'Swiss Super League', 'Switzerland');
INSERT INTO Leagues VALUES (13, 'Czech First League', 'Czech Republic');
INSERT INTO Leagues VALUES (14, 'Slovak Super Liga', 'Slovakia');
INSERT INTO Leagues VALUES (15, 'Ekstraklasa', 'Poland');

INSERT INTO Stadiums VALUES (1, 'Old Trafford', 74000);
INSERT INTO Stadiums VALUES (2, 'Camp Nou', 99000);
INSERT INTO Stadiums VALUES (3, 'Allianz Stadium', 41000);
INSERT INTO Stadiums VALUES (4, 'Signal Iduna Park', 81000);
INSERT INTO Stadiums VALUES (5, 'Parc des Princes', 48000);
INSERT INTO Stadiums VALUES (6, 'Johan Cruyff Arena', 55000);
INSERT INTO Stadiums VALUES (7, 'Estadio da Luz', 65000);
INSERT INTO Stadiums VALUES (8, 'Rams Park', 52000);
INSERT INTO Stadiums VALUES (9, 'Jan Breydel Stadium', 29000);
INSERT INTO Stadiums VALUES (10, 'Celtic Park', 60000);
INSERT INTO Stadiums VALUES (11, 'Red Bull Arena', 30000);
INSERT INTO Stadiums VALUES (12, 'St. Jakob Park', 38000);
INSERT INTO Stadiums VALUES (13, 'Eden Arena', 21000);
INSERT INTO Stadiums VALUES (14, 'Tehelne Pole', 22000);
INSERT INTO Stadiums VALUES (15, 'National Stadium Warsaw', 58000);

INSERT INTO Teams VALUES (1, 'Manchester United', 'Manchester', 1, 1);
INSERT INTO Teams VALUES (2, 'Barcelona', 'Barcelona', 2, 2);
INSERT INTO Teams VALUES (3, 'Juventus', 'Turin', 3, 3);
INSERT INTO Teams VALUES (4, 'Borussia Dortmund', 'Dortmund', 4, 4);
INSERT INTO Teams VALUES (5, 'PSG', 'Paris', 5, 5);
INSERT INTO Teams VALUES (6, 'Ajax', 'Amsterdam', 6, 6);
INSERT INTO Teams VALUES (7, 'Benfica', 'Lisbon', 7, 7);
INSERT INTO Teams VALUES (8, 'Galatasaray', 'Istanbul', 8, 8);
INSERT INTO Teams VALUES (9, 'Club Brugge', 'Bruges', 9, 9);
INSERT INTO Teams VALUES (10, 'Celtic', 'Glasgow', 10, 10);
INSERT INTO Teams VALUES (11, 'Salzburg', 'Salzburg', 11, 11);
INSERT INTO Teams VALUES (12, 'Basel', 'Basel', 12, 12);
INSERT INTO Teams VALUES (13, 'Slavia Prague', 'Prague', 13, 13);
INSERT INTO Teams VALUES (14, 'Slovan Bratislava', 'Bratislava', 14, 14);
INSERT INTO Teams VALUES (15, 'Legia Warsaw', 'Warsaw', 15, 15);

INSERT INTO Players VALUES (1, 'Marcus Rashford', 26, 'Forward', 1);
INSERT INTO Players VALUES (2, 'Robert Lewandowski', 35, 'Forward', 2);
INSERT INTO Players VALUES (3, 'Dusan Vlahovic', 24, 'Forward', 3);
INSERT INTO Players VALUES (4, 'Marco Reus', 35, 'Midfielder', 4);
INSERT INTO Players VALUES (5, 'Kylian Mbappe', 25, 'Forward', 5);
INSERT INTO Players VALUES (6, 'Steven Bergwijn', 26, 'Forward', 6);
INSERT INTO Players VALUES (7, 'Angel Di Maria', 36, 'Midfielder', 7);
INSERT INTO Players VALUES (8, 'Mauro Icardi', 31, 'Forward', 8);
INSERT INTO Players VALUES (9, 'Hans Vanaken', 31, 'Midfielder', 9);
INSERT INTO Players VALUES (10, 'Kyogo Furuhashi', 29, 'Forward', 10);
INSERT INTO Players VALUES (11, 'Karim Konate', 20, 'Forward', 11);
INSERT INTO Players VALUES (12, 'Xherdan Shaqiri', 32, 'Midfielder', 12);
INSERT INTO Players VALUES (13, 'Vaclav Jurecka', 30, 'Forward', 13);
INSERT INTO Players VALUES (14, 'Tigran Barseghyan', 30, 'Forward', 14);
INSERT INTO Players VALUES (15, 'Josue', 33, 'Midfielder', 15);

INSERT INTO Matches VALUES (1, DATE '2026-04-01', 1, 2, 1);
INSERT INTO Matches VALUES (2, DATE '2026-04-02', 2, 3, 2);
INSERT INTO Matches VALUES (3, DATE '2026-04-03', 3, 4, 3);
INSERT INTO Matches VALUES (4, DATE '2026-04-04', 4, 5, 4);
INSERT INTO Matches VALUES (5, DATE '2026-04-05', 5, 6, 5);
INSERT INTO Matches VALUES (6, DATE '2026-04-06', 6, 7, 6);
INSERT INTO Matches VALUES (7, DATE '2026-04-07', 7, 8, 7);
INSERT INTO Matches VALUES (8, DATE '2026-04-08', 8, 9, 8);
INSERT INTO Matches VALUES (9, DATE '2026-04-09', 9, 10, 9);
INSERT INTO Matches VALUES (10, DATE '2026-04-10', 10, 11, 10);
INSERT INTO Matches VALUES (11, DATE '2026-04-11', 11, 12, 11);
INSERT INTO Matches VALUES (12, DATE '2026-04-12', 12, 13, 12);
INSERT INTO Matches VALUES (13, DATE '2026-04-13', 13, 14, 13);
INSERT INTO Matches VALUES (14, DATE '2026-04-14', 14, 15, 14);
INSERT INTO Matches VALUES (15, DATE '2026-04-15', 15, 1, 15);

INSERT INTO Stats VALUES (1, 1, 0, 1, 1);
INSERT INTO Stats VALUES (2, 2, 0, 2, 2);
INSERT INTO Stats VALUES (3, 1, 1, 3, 3);
INSERT INTO Stats VALUES (4, 0, 2, 4, 4);
INSERT INTO Stats VALUES (5, 3, 0, 5, 5);
INSERT INTO Stats VALUES (6, 1, 0, 6, 6);
INSERT INTO Stats VALUES (7, 0, 1, 7, 7);
INSERT INTO Stats VALUES (8, 2, 0, 8, 8);
INSERT INTO Stats VALUES (9, 1, 1, 9, 9);
INSERT INTO Stats VALUES (10, 2, 0, 10, 10);
INSERT INTO Stats VALUES (11, 1, 0, 11, 11);
INSERT INTO Stats VALUES (12, 0, 2, 12, 12);
INSERT INTO Stats VALUES (13, 2, 0, 13, 13);
INSERT INTO Stats VALUES (14, 1, 1, 14, 14);
INSERT INTO Stats VALUES (15, 0, 1, 15, 15);
COMMIT;


-- =====================================================
-- Časť 2: pohľady, sekvencia a triggery
-- =====================================================

-- 1. Netriviálne pohľady (vstavané funkcie)
CREATE VIEW view_players_info AS
SELECT player_id, UPPER(name) AS name_upper, age, LENGTH(name) AS name_length
FROM Players;

CREATE VIEW view_players_short AS
SELECT player_id, SUBSTR(name, 1, 5) AS short_name, position
FROM Players;

-- 2. Spájanie tabuliek (JOIN)
CREATE VIEW view_player_team AS
SELECT p.name, t.name AS team_name
FROM Players p
JOIN Teams t ON p.team_id = t.team_id;

CREATE VIEW view_team_league AS
SELECT t.name AS team, l.name AS league
FROM Teams t
JOIN Leagues l ON t.league_id = l.league_id;

CREATE VIEW view_match_stadium AS
SELECT m.match_id, s.name AS stadium
FROM Matches m
JOIN Stadiums s ON m.stadium_id = s.stadium_id;

-- 3. Agregácie (COUNT, AVG, GROUP BY)
CREATE VIEW view_players_count AS
SELECT team_id, COUNT(*) AS player_count
FROM Players
GROUP BY team_id;

CREATE VIEW view_avg_age AS
SELECT team_id, AVG(age) AS avg_age
FROM Players
GROUP BY team_id;

-- 4. Množinová operácia (UNION)
CREATE VIEW view_union_teams AS
SELECT name FROM Teams
UNION
SELECT name FROM Leagues;

-- 5. Vnorené SELECTy
CREATE VIEW view_players_above_avg AS
SELECT name, age
FROM Players
WHERE age > (SELECT AVG(age) FROM Players);

CREATE VIEW view_teams_with_players AS
SELECT name
FROM Teams
WHERE team_id IN (SELECT team_id FROM Players);

-- 6. Sekvencia + trigger (automatické ID hráča)
CREATE SEQUENCE seq_player_id
START WITH 100
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER trg_player_id
BEFORE INSERT ON Players
FOR EACH ROW
BEGIN
    :NEW.player_id := seq_player_id.NEXTVAL;
END;
/

-- 7. Trigger (kontrola veku hráča)
CREATE OR REPLACE TRIGGER trg_check_age
BEFORE INSERT ON Players
FOR EACH ROW
BEGIN
    IF :NEW.age < 15 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Player too young');
    END IF;
END;
/

-- Ukážka testu:
-- INSERT INTO Players (name, age, position, team_id) VALUES ('OK Player', 20, 'Forward', 1);      -- ID doplní trigger
-- INSERT INTO Players (name, age, position, team_id) VALUES ('Young Player', 10, 'Forward', 1);   -- ORA-20001: Player too young
