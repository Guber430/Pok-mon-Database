-- =============================================
-- Author: Umar Kamalitdinov
-- Create date: 07.04.2024
-- Course: PROG 1735
-- Description: Final Project
--Disclaimer: This project is for educational purposes only.
-- =============================================

USE tempdb;

GO

DROP DATABASE IF EXISTS finalProj;

CREATE DATABASE finalProj;

GO

USE finalProj;

GO

DROP TABLE IF EXISTS trainer;
CREATE TABLE trainer(
	trainerId INT IDENTITY(1,1),
	trainerName VARCHAR(25) NOT NULL,
	CONSTRAINT pk_trainer_trainerId PRIMARY KEY (trainerId), 
	CONSTRAINT chk_trainer CHECK(trainerName NOT LIKE '%[^a-zA-Z0-9]%')
); 

DROP TABLE IF EXISTS pokemon;
CREATE TABLE pokemon (
	pokemonId INT IDENTITY(1,1),
    pokemonDexNum CHAR(4) NOT NULL,
    pokemonName VARCHAR(40) NOT NULL,
    pokemonHeightCm INT CHECK (pokemonHeightCm BETWEEN 0 AND 2000),
    pokemonWeightKg DECIMAL(6,2) CHECK (pokemonWeightKg BETWEEN 0.00 AND 2000.00),
    pokemonColor VARCHAR(25),
    pokemonType VARCHAR(20) DEFAULT 'Grass',
    trainerId INT,
	evolvedFrom INT,
    CONSTRAINT pk_pokemon_pokemonId PRIMARY KEY (pokemonId),
    CONSTRAINT uq_pokemon_pokemonName UNIQUE (pokemonName),
    CONSTRAINT fk_pokemon_trainer FOREIGN KEY (trainerId) REFERENCES trainer (trainerId),
	CONSTRAINT fk_pokemon_pokemon FOREIGN KEY (evolvedFrom) REFERENCES pokemon (pokemonId),
	CONSTRAINT uq_pokemon_pokemonDexNum UNIQUE (pokemonDexNum)
);

DROP TABLE IF EXISTS battle;
CREATE TABLE battle (
	battleId INT IDENTITY(1,1),
    battleName VARCHAR(35) NOT NULL,
    CONSTRAINT pk_battle_battleId PRIMARY KEY (battleId),
	CONSTRAINT uq_battle_battleName UNIQUE(battleName)
);

DROP TABLE IF EXISTS battleLocation;
CREATE TABLE battleLocation (
	battleLocationId INT IDENTITY(1,1),
    battleLocationName VARCHAR(40) NOT NULL,
    CONSTRAINT pk_battleLocation_battleLocationId PRIMARY KEY (battleLocationId),
	CONSTRAINT uq_battleLocation_battleLocationName UNIQUE(battleLocationName)
);

DROP TABLE IF EXISTS record;
CREATE TABLE record (
	recordId INT IDENTITY(1,1),
	recordExpPoint INT CHECK (recordExpPoint <= 500000),
	pokemonId INT,
	battleId INT,
	battleLocationId INT,
	CONSTRAINT pk_record_recordId PRIMARY KEY (recordId),
	CONSTRAINT fk_record_pokemon FOREIGN KEY (pokemonId) REFERENCES pokemon (pokemonId),
	CONSTRAINT fk_record_battle FOREIGN KEY (battleId) REFERENCES battle (battleId),
	CONSTRAINT fk_record_battleLocation FOREIGN KEY (battleLocationId) REFERENCES battleLocation (battleLocationId),
	CONSTRAINT uq_record_pokemonId_battleId_battleLocationId UNIQUE (pokemonId, battleId, battleLocationId)
);


INSERT INTO trainer (trainerName) 
VALUES
('Alain'),
('Ash'),
('Brock'),
('Erika'),
('Misty');

INSERT INTO pokemon 
VALUES
('0005', 'Charmeleon', 121, 26.77, 'Red', 'Fire',1,NULL),
('0006', 'Charizard', 182, 98.27, 'Orange', 'Fire',1,1),
('0025', 'Pikachu', 53, 14.27, 'Yellow', 'Electric',2,NULL),
('0044', 'Gloom', 91, 16.37, 'Brown', 'Grass',3,NULL),
('0045', 'Vileplume', 131, 26.37, 'Pink', 'Grass',4,4),
('0074', 'Geodude', 53, 27.77, 'Gray', 'Rock',3,NULL),
('0095', 'Onix', 891, 217.77, 'Gray', 'Rock',3,NULL),
('0111', 'Rhyhorn', 111, 122.77, 'Gray', 'Ground',3,NULL),
('0114', 'Tangela', 111, 42.77, 'Blue', 'Grass',4,NULL),
('0120', 'Staryu', 91, 42.27, 'Brown', 'Water',5,NULL),
('0121', 'Starmie', 121, 87.77, 'Silver', 'Water',5,10),
('0133', 'Eevee', 42, 14.27, 'Brown', 'Normal',5,NULL),
('0134', 'Vaporeon', 111, 36.77, 'Blue', 'Water',5,12),
('0135', 'Jolteon', 96, 32.27, 'Yellow', 'Electric',5,12),
('0136', 'Flareon', 96, 32.77, 'Orange', 'Fire',5,12),
('0182', 'Bellossom', 53, 13.57, 'Green', 'Grass',3,4),
('0189', 'Jumpluff', 91, 10.77, 'Purple', 'Grass',4,NULL),
('0196', 'Espeon', 101, 34.27, 'Purple', 'Psychic',3,12),
('0197', 'Umbreon', 111, 34.77, 'Black', 'Dark',3,12),
('0248', 'Tyranitar', 213, 209.77, 'Green', 'Rock',1,NULL),
('0376', 'Metagross', 172, 557.77, 'Gray', 'Steel',1,NULL),
('0461', 'Weavile', 121, 41.77, 'Purple', 'Dark',1,NULL),
('0470', 'Leafeon', 111, 33.27, 'Green', 'Grass',2,12),
('0722', 'Rowlet', 42, 9.27, 'Brown', 'Grass',2,NULL),
('0726', 'Torracat', 83, 32.77, 'Red', 'Fire',2,NULL),
('0744', 'Rockruff', 63, 16.97, 'Brown', 'Rock',2,NULL),
('0745', 'Lycanroc', 91, 32.77, 'Gray', 'Rock',2,26);

INSERT INTO battle (battleName) 
VALUES
('Battle Royal'),
('Full Battle'),
('Sky Battle'),
('Team Battle'),
('Rotation Battle'),
('Double Battle');

INSERT INTO battleLocation (battleLocationName) 
VALUES
('Battle Royal Dome'),
('Mt. Silver'),
('Azure Bay'),
('Summer Camp'),
('Driftveil City'),
('Pokemon Colosseum');

INSERT INTO record (pokemonId, battleId, battleLocationId, recordExpPoint) 
VALUES
(2, 1, 1, 44), 
(2, 2, 2, 64), 
(2, 3, 3, 79),  
(2, 4, 4, 79),  
(3, 2, 2, 44), 
(3, 5, 5, 84), 
(3, 4, 4, 49), 
(5, 1, 1, 64), 
(6, 1, 1, 49), 
(6, 4, 4, 89), 
(7, 6, 6, 104),
(7, 5, 5, 89), 
(7, 4, 4, 69), 
(8, 6, 6, 94), 
(8, 4, 4, 89), 
(9, 2, 2, 89), 
(9, 5, 5, 59), 
(9, 4, 4, 84), 
(10, 5, 5, 44), 
(11, 6, 6, 59), 
(11, 4, 4, 54), 
(17, 1, 1, 74), 
(17, 6, 6, 74), 
(17, 3, 3, 39), 
(20, 1, 1, 84), 
(20, 2, 2, 74), 
(21, 1, 1, 39), 
(21, 6, 6, 64), 
(21, 4, 4, 54), 
(22, 2, 2, 44), 
(22, 4, 4, 89), 
(24, 3, 3, 109),
(25, 1, 1, 79), 
(25, 6, 6, 109),
(25, 2, 2, 54), 
(26, 1, 1, 99), 
(26, 4, 4, 89)
; 

--qry 1: Output all GREEN pokemon and its type, as well as the name, location, and exp points of its 
--battles, including pokemon with no battles in output as 'None' or 0. Order output by 
--pokemon name, then by battle name.
SELECT 
    p.pokemonName AS 'Pokemon Name',
    p.pokemonType AS 'Type',
    ISNULL(b.battleName, '''None''') AS 'Battle Name',
    ISNULL(bl.battleLocationName, '''None''') AS 'Battle Location',
    ISNULL(r.recordExpPoint, 0) AS 'Experience Point'
FROM pokemon p
LEFT JOIN record r ON p.pokemonId = r.pokemonId
LEFT JOIN battle b ON r.battleId = b.battleId
LEFT JOIN  battleLocation bl ON r.battleLocationId = bl.battleLocationId
WHERE  p.pokemonColor = 'Green'
ORDER BY  p.pokemonName, b.battleName;

--qry 2: For those BASE (original) pokemon that is heavier than 25 kg, show all pokemon that 
--EVOLVES from it. Order by base pokemon dex num, then by evolved pokemon name, at 
--ascending order. Display pokemon dex num, name, and weight in same column as shown.
SELECT 
    CONCAT(a.pokemonDexNum, ' - ', a.pokemonName, ' ->') AS 'Base Pokemon',
    CONCAT(b.pokemonDexNum, ' - ',b.pokemonName,' : ',b.pokemonWeightKg, ' kg') AS 'Evolved Pokemon'
FROM pokemon a
JOIN
    pokemon b 
	ON b.evolvedFrom = a.pokemonId
WHERE a.pokemonWeightKg > 25.0
ORDER BY a.pokemonDexNum ASC, b.pokemonName ASC;

--qry 3: List each trainer, the NUMBER of EVOLVED pokemons and the NUMBER of UNEVOLVED 
--pokemons they own. Order by trainer name.
SELECT 
   t.trainerName AS 'Pokemon Trainer',
    COUNT(CASE WHEN p.evolvedFrom IS NOT NULL THEN 1 END) AS '# of Evolved Pokemons',
    COUNT(CASE WHEN p.evolvedFrom IS  NULL THEN 1 END) AS '# of Unevolved Pokemons'
FROM trainer t
inner JOIN pokemon tp ON t.trainerId = tp.trainerId
inner JOIN  pokemon p ON tp.pokemonId = p.pokemonId
GROUP BY  t.trainerName
ORDER BY t.trainerName;

--qry 4: List the trainer who has the highest of total exp points gained by the pokemons they own.
SELECT TOP 1
    t.trainerName AS 'Pokemon Trainer',
    SUM(r.recordExpPoint) AS 'Max of Total Exp Points'
FROM 
	trainer t
	JOIN pokemon tp ON t.trainerId = tp.trainerId
	JOIN record r ON tp.pokemonId = r.pokemonId
GROUP BY t.trainerName
ORDER BY SUM(r.recordExpPoint) DESC;

--gry 5: [2 bonus marks] Who is the TALLEST EVOLVED pokemon for each TYPE? 
--Also display base pokemon it evolves from. Order height from tallest to shortest.
SELECT p.pokemonName AS 'Pokemon Name',
    CASE WHEN p.pokemonHeightCm < 100 THEN CONCAT('0', p.pokemonHeightCm) ELSE CAST(p.pokemonHeightCm AS VARCHAR(10)) END  AS 'Height',
	p.pokemonType AS 'Type',
    p2.pokemonName AS 'Evolved From'
FROM pokemon p
JOIN pokemon p2 ON p.evolvedFrom = p2.pokemonId
WHERE  p.pokemonHeightCm = (
								SELECT MAX(pokemonHeightCm)
								FROM pokemon
								WHERE evolvedFrom IS NOT NULL AND pokemonType = p.pokemonType
						    )
ORDER BY p.pokemonHeightCm DESC;