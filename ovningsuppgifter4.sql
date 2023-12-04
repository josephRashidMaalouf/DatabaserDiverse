USE everyloop;
GO

--1. Kopiera hela tabellen Users till en ny tabell.
--Skapa sedan en vy med kolumnerna ID, Firstname, Lastname, Phone som listar alla kvinnliga anv�ndare fr�n den nya tabellen.
--Om man l�gger till nya anv�ndare i vyn s� ska det bara g� om personnummret indikerar att det �r en kvinna.

--SELECT * INTO Users3 FROM USERS;

--SELECT * FROM users3;
--GO

--CREATE OR ALTER VIEW [Women] AS
--SELECT 
--	[ID], 
--	[FirstName], 
--	[LastName], 
--	[Phone]
--FROM users3
--WHERE SUBSTRING([ID], 10, 1) % 2 = 0;
--GO


--2. Skapa en tabell �ActiveUsers� med all data fr�n �Users�. 
--Skapa en tabell �DeletedUsers� med samma struktur men utan n�gra rader. 
--Skapa sedan en stored procedure �DeleteUser� som tar ett username som argument. 
--N�r man exekverar SP:n s� ska de rader som matchar username i �ActiveUsers� flyttas �ver till �DeletedUsers�. 
--SP:n ska returnera hur m�nga rader som flyttats.

--SELECT * INTO [ActiveUsers] FROM [Users];
--GO

--SELECT TOP 0 * INTO [DeletedUsers] FROM [Users];
--GO

SELECT * FROM [ActiveUsers];
SELECT * FROM [DeletedUsers];



--3. Skapa en SP som tar ett startdatum och ett slutdatum som parameterar och visar (select) en kolumn med datum
--och en kolumn med veckodag f�r alla dagar mellan (inklusive) start- och slutdatumet.

--4. Antag att vi har en fabrik med 4 produktionslinjer d�r vi d� och d� kollar av hur m�nga enheter 
--som producerats sedan senaste avcheckning och lagrar en timestamp, vilken linje och hur m�nga produkter. 
--Skapa en ny tabell med testdata f�r att simulera att vi samlat in s�dan data under 10 �rs tid. 
--Tabellen ska inneh�lla 1 miljon rader med kolumnerna �timestamp� som �r random datum 
--och tid i spannet 10 �r tillbaks och nu; �line� som �r ett random v�rde �A�, �B�, �C� eller �D�; 
--samt �count� som �r ett random v�rde 1-5.

--5. Skriv en SP som tar en linje, en starttid, en stoptid, och ett intervall (antal minuter) som inparametrar. 
--SP:n arbetar med tabellen vi skapade i uppgift (d), och ska visa en tabell med antal producerade enheter p� en given linje,
--per intervall. Dvs, om vi skickar in linje A, starttid �2015-02-01 10:00�, stopptid �2015-02-01 12:00�
--och intervallet 30 (minuter), s� vill vi ha ut 4 rader som visar summan av producerade enheter p� linjen per 30 minuter,
--med start- och stop-tid p� varje intervall. Exempel output:

--Start	End	Units
--2015-02-01 10:00	2015-02-01 10:30	6
--2015-02-01 10:30	2015-02-01 11:00	3
--2015-02-01 11:00	2015-02-01 11:30	0
--2015-02-01 11:30	2015-02-01 12:00	5


--6. Skapa en funktion som tar ett personnummer (varchar) som inparameter och kontrollerar s� att det �r korrekt formaterat,
--samt om kontrollsiffran st�mmer. Funktionen ska returnera 1 om det �r ett riktigt personnummer, annars 0.