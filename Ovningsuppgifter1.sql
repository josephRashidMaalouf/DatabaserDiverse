USE everyloop;

--1. Ta ut data (select) fr�n tabellen GameOfThrones
--p� s�dant s�tt att ni f�r ut en kolumn �Title�
--med titeln samt en kolumn �Episode� som visar episoder
--och s�songer i formatet �S01E01�, �S01E02�,
--osv. Tips: kolla upp funktionen format()

--SELECT title, ('S' + FORMAT(season, '00') + 'E' + FORMAT(EpisodeInSeason, '00')) AS 'Season and episode'
--FROM GameOfThrones;

--SELECT * INTO users2 FROM users;

--2. Uppdatera (kopia p�) tabellen user och s�tt username f�r
--alla anv�ndare s� den blir de 2 f�rsta bokst�verna i f�rnamnet,
--och de 2 f�rsta i efternamnet (ist�llet f�r 3+3 som det �r i orginalet).
--Hela anv�ndarnamnet ska vara i sm� bokst�ver.

--UPDATE users2
--SET username =
--(SUBSTRING(LOWER(firstname), 1, 2) + 
-- SUBSTRING(LOWER(lastname), 1, 2));

--3. Uppdatera (kopia p�) tabellen airports 
--s� att alla null-v�rden i kolumnerna Time och DST byts ut mot �-�

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


-- 4. Ta bort de rader fr�n (kopia p�) tabellen Elements d�r �Name� �r n�gon av f�ljande:
--'Erbium', 'Helium', 'Nitrogen', 'Platinum', 'Selenium',
--samt alla rader d�r �Name� b�rjar p� n�gon av bokst�verna d, k, m, o, eller u.

--DELETE FROM Elements2
--WHERE
--[Name] IN ('Erbium', 'Helium', 'Nitrogen', 'Platinum', 'Selenium')
--OR [Name] LIKE ('D%')
--OR [Name] LIKE ('K%')
--OR [Name] LIKE ('M%')
--OR [Name] LIKE ('O%')
--OR [Name] LIKE ('U%');


--5. Skapa en ny tabell med alla rader fr�n tabellen Elements.
--Den nya tabellen ska inneh�lla �Symbol� och �Name� fr�n orginalet,
--samt en tredje kolumn med v�rdet �Yes� f�r de rader d�r �Name� b�rjar med
--bokst�verna i �Symbol�, och �No� f�r de rader d�r de inte g�r det.

--Ex: �He� -> �Helium� -> �Yes�, �Mg� -> �Magnesium� -> �No�.

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


--6. Kopiera tabellen Colors till Colors2, men skippa kolumnen �Code�.
--G�r sedan en select fr�n Colors2 som ger samma resultat som du skulle f�tt fr�n select * from Colors;
--(Dvs, �terskapa den saknade kolumnen fr�n RGBv�rdena i resultatet).

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

--7. Kopiera kolumnerna �Integer� och �String� fr�n tabellen �Types� till en ny tabell.
--G�r sedan en select fr�n den nya tabellen som ger samma resultat 
--som du skulle f�tt fr�n select * from types;

--SELECT integer, string INTO types2 FROM types;

--SELECT integer, CAST(integer / 100.0 AS float) AS Float, string, ('2019-01-' + FORMAT(integer, '00') + ' 09:' + FORMAT(integer, '00') + ':00.000000') AS 'DateTime', (integer % 2) AS Bool 
--FROM types2;




