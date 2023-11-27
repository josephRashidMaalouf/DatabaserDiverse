Use everyloop;
GO

--1. Ta ut (select) en rad f�r varje (unik) period i tabellen �Elements� med f�ljande kolumner: 
--�period�, 
--�from� med l�gsta atomnumret i perioden, 
--�to� med h�gsta atomnumret i perioden, 
--�average isotopes� med genomsnittligt antal isotoper visat med 2 decimaler, 
--�symbols� med en kommaseparerad lista av alla �mnen i perioden.

--SELECT 
--	[Period], 
--	MIN([Number]) AS [From], 
--	MAX([Number]) AS [To], 
--	ROUND(AVG(CONVERT(FLOAT, [Stableisotopes])), 2) AS [Avarage isotopes],
--	STRING_AGG([Symbol], ',')
--FROM elements
--Group by [Period];

--######################

--2. F�r varje stad som har 2 eller fler kunder i tabellen Customers, ta ut (select) f�ljande kolumner: 
--�Region�,
--�Country�,
--�City�,
--samt �Customers� som anger hur m�nga kunder som finns i staden.

SELECT * FROM company.customers;

SELECT [City], COUNT([CompanyName]) AS [Number of customers]
FROM company.customers
GROUP BY [City]
HAVING COUNT([CompanyName]) >= 2;




--3. Skapa en varchar-variabel och skriv en select-sats som s�tter v�rdet: 
--�S�song 1 s�ndes fr�n april till juni 2011.
--Totalt s�ndes 10 avsnitt, som i genomsnitt s�gs av 2.5 miljoner m�nniskor i USA.�,
--f�ljt av radbyte/char(13), f�ljt av �S�song 2 s�ndes �� osv. 
--N�r du sedan skriver (print) variabeln till messages ska du allts� f� en rad f�r varje s�song enligt ovan, 
--med data sammanst�llt fr�n tabellen GameOfThrones. 
--Tips: Ange �sv� som tredje parameter i format() f�r svenska m�nader.

--4. Ta ut (select) alla anv�ndare i tabellen �Users� s� du f�r tre kolumner: 
--�Namn� som har fulla namnet; 
--��lder� som visar hur m�nga �r personen �r idag (ex. �45 �r�); 
--�K�n� som visar om det �r en man eller kvinna.
--Sortera raderna efter f�r- och efternamn.

--5. Ta ut en lista �ver regioner i tabellen �Countries� d�r det f�r varje region framg�r regionens namn, 
--antal l�nder i regionen, totalt antal inv�nare, 
--total area, befolkningst�theten med 2 decimaler,
--samt sp�dbarnsd�dligheten per 100.000 f�dslar avrundat till heltal.

--6. Fr�n tabellen �Airports�, gruppera per land och ta ut kolumner som visar: land, antal flygplatser (IATA-koder), 
--antal som saknar ICAO-kod, samt hur m�nga procent av flygplatserna i varje land som saknar ICAO-kod.