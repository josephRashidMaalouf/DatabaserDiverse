USE everyloop;

--1. Ta ut data (select) från tabellen GameOfThrones
--på sådant sätt att ni får ut en kolumn ’Title’
--med titeln samt en kolumn ’Episode’ som visar episoder
--och säsonger i formatet ”S01E01”, ”S01E02”,
--osv. Tips: kolla upp funktionen format()

--SELECT title, ('S' + FORMAT(season, '00') + 'E' + FORMAT(EpisodeInSeason, '00')) AS 'Season and episode'
--FROM GameOfThrones;

--SELECT * INTO users2 FROM users;

--2. Uppdatera (kopia på) tabellen user och sätt username för
--alla användare så den blir de 2 första bokstäverna i förnamnet,
--och de 2 första i efternamnet (istället för 3+3 som det är i orginalet).
--Hela användarnamnet ska vara i små bokstäver.

--UPDATE users2
--SET username =
--(SUBSTRING(LOWER(firstname), 1, 2) + 
-- SUBSTRING(LOWER(lastname), 1, 2));

--3. Uppdatera (kopia på) tabellen airports 
--så att alla null-värden i kolumnerna Time och DST byts ut mot ’-’

--SELECT time, dst,
--CASE
--	WHEN time IS NULL then '-' ELSE time
--	END
--	AS time,
--	CASE 
--	WHEN dst IS NULL then '-' ELSE dst
--	END
--	AS dst
--FROM airports2;

--UPDATE airports2
--SET time, dst,
--CASE
--	WHEN time IS NULL then '-' ELSE time
--	END
--	AS time,
--	CASE 
--	WHEN dst IS NULL then '-' ELSE dst
--	END
--	AS dst;

--UPDATE airports2
--SET time = '-'
--WHERE time IS NULL;

--UPDATE airports2
--SET dst = '-'
--WHERE dst IS NULL;

--ELLER:

--UPDATE Airports2
--SET time = COALESCE(time, '-'),
--    DST = COALESCE(DST, '-')
--WHERE time IS NULL OR DST IS NULL;

--ELLER:
--UPDATE Airports2

--SET DST = ISNULL(DST, '-'),
--    Time = ISNULL(Time, '-')


-- 4. Ta bort de rader från (kopia på) tabellen Elements där ”Name” är någon av följande:
--'Erbium', 'Helium', 'Nitrogen', 'Platinum', 'Selenium',
--samt alla rader där ”Name” börjar på någon av bokstäverna d, k, m, o, eller u.

--DELETE FROM Elements2
--WHERE
--[Name] IN ('Erbium', 'Helium', 'Nitrogen', 'Platinum', 'Selenium')
--OR [Name] LIKE ('D%')
--OR [Name] LIKE ('K%')
--OR [Name] LIKE ('M%')
--OR [Name] LIKE ('O%')
--OR [Name] LIKE ('U%');


--5. Skapa en ny tabell med alla rader från tabellen Elements.
--Den nya tabellen ska innehålla ”Symbol” och ”Name” från orginalet,
--samt en tredje kolumn med värdet ’Yes’ för de rader där ”Name” börjar med
--bokstäverna i ”Symbol”, och ’No’ för de rader där de inte gör det.

--Ex: ’He’ -> ’Helium’ -> ’Yes’, ’Mg’ -> ’Magnesium’ -> ’No’.

--SELECT symbol, name INTO elements4 FROM elements;

--ALTER TABLE elements4
--ADD matching nvarchar(MAX);

--UPDATE elements4
--SET matching =
--	CASE
--		WHEN name LIKE CONCAT(symbol, '%') THEN 'Yes'
--        ELSE 'No'
--	END;

--SELECT * FROM elements4;


--6. Kopiera tabellen Colors till Colors2, men skippa kolumnen ”Code”.
--Gör sedan en select från Colors2 som ger samma resultat som du skulle fått från select * from Colors;
--(Dvs, återskapa den saknade kolumnen från RGBvärdena i resultatet).

--SELECT * INTO colors2 FROM colors;

--ALTER TABLE colors2
--DROP COLUMN code;

--SELECT 
--  Name,
--  Red,
--  Green,
--  Blue,
--  '#' + FORMAT(Red, 'X2') + FORMAT(Green, 'X2') + FORMAT(Blue, 'X2') AS Code
--FROM Colors2;

--SELECT * FROM colors;

--7. Kopiera kolumnerna ”Integer” och ”String” från tabellen ”Types” till en ny tabell.
--Gör sedan en select från den nya tabellen som ger samma resultat 
--som du skulle fått från select * from types;

--SELECT integer, string INTO types2 FROM types;

--SELECT integer, CAST(integer / 100.0 AS float) AS Float, string, ('2019-01-' + FORMAT(integer, '00') + ' 09:' + FORMAT(integer, '00') + ':00.000000') AS 'DateTime', (integer % 2) AS Bool 
--FROM types2;




