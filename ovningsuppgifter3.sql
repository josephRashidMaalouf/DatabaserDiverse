Use everyloop;
GO

--1. Ta ut (select) en rad för varje (unik) period i tabellen ”Elements” med följande kolumner: 
--”period”, 
--”from” med lägsta atomnumret i perioden, 
--”to” med högsta atomnumret i perioden, 
--”average isotopes” med genomsnittligt antal isotoper visat med 2 decimaler, 
--”symbols” med en kommaseparerad lista av alla ämnen i perioden.

--SELECT 
--	[Period], 
--	MIN([Number]) AS [From], 
--	MAX([Number]) AS [To], 
--	ROUND(AVG(CONVERT(FLOAT, [Stableisotopes])), 2) AS [Avarage isotopes],
--	STRING_AGG([Symbol], ',')
--FROM elements
--Group by [Period];

--######################

--2. För varje stad som har 2 eller fler kunder i tabellen Customers, ta ut (select) följande kolumner: 
--”Region”,
--”Country”,
--”City”,
--samt ”Customers” som anger hur många kunder som finns i staden.

--SELECT 
--	[Region],
--	[Country],
--	[City],
--	COUNT([CompanyName]) AS [Customers]
--FROM company.customers
--GROUP BY [City], [Region], [Country]
--HAVING COUNT([CompanyName]) >= 2;

--###########################


--3. Skapa en varchar-variabel och skriv en select-sats som sätter värdet: 
--”Säsong 1 sändes från april till juni 2011. Totalt sändes 10 avsnitt, som i genomsnitt sågs av 2.5 miljoner människor i USA.”,
--följt av radbyte/char(13), följt av ”Säsong 2 sändes …” osv. 
--När du sedan skriver (print) variabeln till messages ska du alltså få en rad för varje säsong enligt ovan, 
--med data sammanställt från tabellen GameOfThrones. 
--Tips: Ange ’sv’ som tredje parameter i format() för svenska månader.



SELECT 
	[Season],
	FORMAT(MIN([Original air date]), 'MMMM', 'sv') AS [Start date],
	FORMAT(MAX([Original air date]), 'MMMM yyyy', 'sv') AS [End date],
	COUNT([Episode]) AS [Episodes], 
	SUM([U.S. viewers(millions)]) AS [million viewers in U.S]
FROM GameOfThrones
GROUP BY [Season];


DECLARE @EpiInfo AS NVARCHAR(max) = 
(SELECT 'Säsong ' +
	CONVERT(NVARCHAR(MAX),[Season]) + ' sändes från ' +
	CONVERT(NVARCHAR(MAX), FORMAT(MIN([Original air date]), 'MMMM', 'sv')) + ' till ' +
	CONVERT(NVARCHAR(MAX), FORMAT(MAX([Original air date]), 'MMMM yyyy', 'sv')) + '. Totalt sändes ' + 
	CONVERT(NVARCHAR(MAX), COUNT([Episode])) + ' avsnitt, som i genomsnitt sågs av ' + 
	CONVERT(NVARCHAR(MAX), SUM([U.S. viewers(millions)])) + ' miljoner människor i USA.' 
FROM GameOfThrones
GROUP BY [Season]
HAVING [Season] = 1) + char(13) + 
(SELECT 'Säsong ' +
	CONVERT(NVARCHAR(MAX),[Season]) + ' sändes från ' +
	CONVERT(NVARCHAR(MAX), FORMAT(MIN([Original air date]), 'MMMM', 'sv')) + ' till ' +
	CONVERT(NVARCHAR(MAX), FORMAT(MAX([Original air date]), 'MMMM yyyy', 'sv')) + '. Totalt sändes ' + 
	CONVERT(NVARCHAR(MAX), COUNT([Episode])) + ' avsnitt, som i genomsnitt sågs av ' + 
	CONVERT(NVARCHAR(MAX), SUM([U.S. viewers(millions)])) + ' miljoner människor i USA.' 
FROM GameOfThrones
GROUP BY [Season]
HAVING [Season] = 2) + char(13) +
(SELECT 'Säsong ' +
	CONVERT(NVARCHAR(MAX),[Season]) + ' sändes från ' +
	CONVERT(NVARCHAR(MAX), FORMAT(MIN([Original air date]), 'MMMM', 'sv')) + ' till ' +
	CONVERT(NVARCHAR(MAX), FORMAT(MAX([Original air date]), 'MMMM yyyy', 'sv')) + '. Totalt sändes ' + 
	CONVERT(NVARCHAR(MAX), COUNT([Episode])) + ' avsnitt, som i genomsnitt sågs av ' + 
	CONVERT(NVARCHAR(MAX), SUM([U.S. viewers(millions)])) + ' miljoner människor i USA.' 
FROM GameOfThrones
GROUP BY [Season]
HAVING [Season] = 3) + char(13) + 
(SELECT 'Säsong ' +
	CONVERT(NVARCHAR(MAX),[Season]) + ' sändes från ' +
	CONVERT(NVARCHAR(MAX), FORMAT(MIN([Original air date]), 'MMMM', 'sv')) + ' till ' +
	CONVERT(NVARCHAR(MAX), FORMAT(MAX([Original air date]), 'MMMM yyyy', 'sv')) + '. Totalt sändes ' + 
	CONVERT(NVARCHAR(MAX), COUNT([Episode])) + ' avsnitt, som i genomsnitt sågs av ' + 
	CONVERT(NVARCHAR(MAX), SUM([U.S. viewers(millions)])) + ' miljoner människor i USA.' 
FROM GameOfThrones
GROUP BY [Season]
HAVING [Season] = 4) + char(13) + 
(SELECT 'Säsong ' +
	CONVERT(NVARCHAR(MAX),[Season]) + ' sändes från ' +
	CONVERT(NVARCHAR(MAX), FORMAT(MIN([Original air date]), 'MMMM', 'sv')) + ' till ' +
	CONVERT(NVARCHAR(MAX), FORMAT(MAX([Original air date]), 'MMMM yyyy', 'sv')) + '. Totalt sändes ' + 
	CONVERT(NVARCHAR(MAX), COUNT([Episode])) + ' avsnitt, som i genomsnitt sågs av ' + 
	CONVERT(NVARCHAR(MAX), SUM([U.S. viewers(millions)])) + ' miljoner människor i USA.' 
FROM GameOfThrones
GROUP BY [Season]
HAVING [Season] = 5) + char(13) + 
(SELECT 'Säsong ' +
	CONVERT(NVARCHAR(MAX),[Season]) + ' sändes från ' +
	CONVERT(NVARCHAR(MAX), FORMAT(MIN([Original air date]), 'MMMM', 'sv')) + ' till ' +
	CONVERT(NVARCHAR(MAX), FORMAT(MAX([Original air date]), 'MMMM yyyy', 'sv')) + '. Totalt sändes ' + 
	CONVERT(NVARCHAR(MAX), COUNT([Episode])) + ' avsnitt, som i genomsnitt sågs av ' + 
	CONVERT(NVARCHAR(MAX), SUM([U.S. viewers(millions)])) + ' miljoner människor i USA.' 
FROM GameOfThrones
GROUP BY [Season]
HAVING [Season] = 6) + char(13) + 
(SELECT 'Säsong ' +
	CONVERT(NVARCHAR(MAX),[Season]) + ' sändes från ' +
	CONVERT(NVARCHAR(MAX), FORMAT(MIN([Original air date]), 'MMMM', 'sv')) + ' till ' +
	CONVERT(NVARCHAR(MAX), FORMAT(MAX([Original air date]), 'MMMM yyyy', 'sv')) + '. Totalt sändes ' + 
	CONVERT(NVARCHAR(MAX), COUNT([Episode])) + ' avsnitt, som i genomsnitt sågs av ' + 
	CONVERT(NVARCHAR(MAX), SUM([U.S. viewers(millions)])) + ' miljoner människor i USA.' 
FROM GameOfThrones
GROUP BY [Season]
HAVING [Season] = 7) + char(13) + 
(SELECT 'Säsong ' +
	CONVERT(NVARCHAR(MAX),[Season]) + ' sändes från ' +
	CONVERT(NVARCHAR(MAX), FORMAT(MIN([Original air date]), 'MMMM', 'sv')) + ' till ' +
	CONVERT(NVARCHAR(MAX), FORMAT(MAX([Original air date]), 'MMMM yyyy', 'sv')) + '. Totalt sändes ' + 
	CONVERT(NVARCHAR(MAX), COUNT([Episode])) + ' avsnitt, som i genomsnitt sågs av ' + 
	CONVERT(NVARCHAR(MAX), SUM([U.S. viewers(millions)])) + ' miljoner människor i USA.' 
FROM GameOfThrones
GROUP BY [Season]
HAVING [Season] = 8) + char(13);

PRINT @EpiInfo;







-- Är det så uppgiften ska lösas?

-- Nej, chatgpt visade en mycket bättre lösning:
DECLARE @meddelande VARCHAR(MAX);

SELECT @meddelande = COALESCE(@meddelande + CHAR(13), '') +
    'Säsong ' + CAST(Season AS NVARCHAR(10)) + ' sändes från ' +
    FORMAT(MIN([Original air date]), 'MMMM', 'sv') + ' till ' +
    FORMAT(MAX([Original air date]), 'MMMM yyyy', 'sv') + '. ' +
    'Totalt sändes ' + CAST(COUNT([Episode]) AS NVARCHAR(10)) + ' avsnitt, ' +
    'som i genomsnitt sågs av ' + CAST(SUM([U.S. viewers(millions)]) AS NVARCHAR(20)) +
    ' miljoner människor i USA.'
FROM GameOfThrones
GROUP BY [Season]; 

PRINT @meddelande;

----- Gjorde min egen version:
DECLARE @EpiInfo2 AS NVARCHAR(max);

SELECT @EpiInfo2 = COALESCE(@EpiInfo2 + CHAR(13), '') + -- COALESCE Gör att vi kan fortsätta bygga på strängen.
	'Säsong ' +
	CONVERT(NVARCHAR(MAX),[Season]) + ' sändes från ' +
	CONVERT(NVARCHAR(MAX), FORMAT(MIN([Original air date]), 'MMMM', 'sv')) + ' till ' +
	CONVERT(NVARCHAR(MAX), FORMAT(MAX([Original air date]), 'MMMM yyyy', 'sv')) + '. Totalt sändes ' + 
	CONVERT(NVARCHAR(MAX), COUNT([Episode])) + ' avsnitt, som i genomsnitt sågs av ' + 
	CONVERT(NVARCHAR(MAX), SUM([U.S. viewers(millions)])) + ' miljoner människor i USA.' 
FROM GameOfThrones
GROUP BY [Season];

PRINT @EpiInfo2;
GO


--####################################


--4. Ta ut (select) alla användare i tabellen ”Users” så du får tre kolumner: 
--”Namn” som har fulla namnet; 
--”Ålder” som visar hur många år personen är idag (ex. ’45 år’); 
--”Kön” som visar om det är en man eller kvinna.
--Sortera raderna efter för- och efternamn.

--5. Ta ut en lista över regioner i tabellen ”Countries” där det för varje region framgår regionens namn, 
--antal länder i regionen, totalt antal invånare, 
--total area, befolkningstätheten med 2 decimaler,
--samt spädbarnsdödligheten per 100.000 födslar avrundat till heltal.

--6. Från tabellen ”Airports”, gruppera per land och ta ut kolumner som visar: land, antal flygplatser (IATA-koder), 
--antal som saknar ICAO-kod, samt hur många procent av flygplatserna i varje land som saknar ICAO-kod.