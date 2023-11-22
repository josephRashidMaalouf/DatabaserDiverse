USE everyloop;
GO
-- 1. F�retagets totala produktkatalog best�r av 77 unika produkter. Om vi kollar bland v�ra ordrar, hur stor andel av dessa produkter har vi n�gon g�ng leverarat till London?

--SELECT *
--FROM company.products AS p
--JOIN company.order_details AS d ON p.Id = d.ProductId
--JOIN company.orders AS o ON o.Id = d.OrderId
--WHERE ShipCity = 'London'
--ORDER BY ProductName;

--SELECT COUNT(DISTINCT ProductName) AS [Unique products shipped], ShipCity 
--FROM company.products AS p
--JOIN company.order_details AS d ON p.Id = d.ProductId
--JOIN company.orders AS o ON o.Id = d.OrderId
--WHERE ShipCity = 'London'
--GROUP BY ShipCity;

--SELECT (CONVERT(FLOAT, COUNT(DISTINCT ProductName) / 77.0) * 100) AS [Percentage], ShipCity 
--FROM company.products AS p
--JOIN company.order_details AS d ON p.Id = d.ProductId
--JOIN company.orders AS o ON o.Id = d.OrderId
--WHERE ShipCity = 'London'
--GROUP BY ShipCity;

----## SVAR: 53,2% av f�retagets produkter har skickats till London.
----## F�rklaring: 
--Relevanta tabeller f�r att besvara denna fr�ga �r products, order_details och orders.
--Dessa slog jag ihop och plockade ut alla produktnamn och st�der.
--P� produktnamnen k�r jag funktionen COUNT, med DISTINCT i parametern f�r att endast r�kna unika produkter.
--D�refter dividerade jag antalet produkter skickade till LONDON med 77, vilket �r den totala m�ngden unika produkter i sortimentet.
--F�r att detta skulle vara m�jligt beh�vde jag f�rst konvertera till en float. Den sista tabellen �r allts� tabellen som gav mig r�tt
--svar p� fr�gan: 53,2% av f�retagets produkter har skickats till London.



-- 2. Till vilken stad har vi levererat flest unika produkter?

--SELECT COUNT(DISTINCT ProductName) AS [Unique products shipped], ShipCity 
--FROM company.products AS p
--JOIN company.order_details AS d ON p.Id = d.ProductId
--JOIN company.orders AS o ON o.Id = d.OrderId
--GROUP BY ShipCity
--ORDER BY [Unique products shipped] DESC;

--## SVAR: Boise
--## F�rklaring:
--Jag �teranv�nde koden fr�n f�rra uppgiften d�r jag r�knade ut antalet unika produkter skickade till London,
--men h�r tog jag bort vilkoret som filtrerar fram London, f�r att f� en tabell �ver alla st�der.
--D�refter ordnade jag svaren utefter antalet unika produkter s�lda f�r att l�ttare hitta staden som
--f�retaget levererat flest unika produkter till. 


-- 3. Av de produkter som inte l�ngre finns I v�rat sortiment, hur mycket har vi s�lt f�r totalt till Tyskland?


--SELECT COUNT(ProductName) AS [Total products sold], COUNT(DISTINCT ProductName) AS [Unique products sold] , ShipCountry
--FROM company.products AS p
--JOIN company.order_details AS d ON p.Id = d.ProductId
--JOIN company.orders AS o ON o.Id = d.OrderId
--WHERE ShipCountry = 'Germany' AND Discontinued = 1
--GROUP BY ShipCountry;

--## SVAR: Totalt 14 utg�ngna varor har s�lts till Tyskland, varav 7 unika produkter.
--## F�rklaring: 
--Samma t�nk som i uppgifterna ovan, med skillnaden att jag i denna uppgift filtrerar efter tabellen Discontinued, och Land = Tyskland.
--Jag var lite os�ker p� om uppgiften ville ha den totala m�ngden produkter s�lda, eller endast unika varor, d�rf�r tog jag fram b�da.


-- 4. F�r vilken produktkategori har vi h�gst lagerv�rde?


--SELECT TOP 1 CategoryName, SUM(UnitsInStock) AS [Units in stock]
--FROM company.categories AS c
--JOIN Company.products AS p ON  c.Id = p.CategoryId
--GROUP BY CategoryName
--ORDER BY [Units in stock] DESC;

--## SVAR: Seafood har h�gst lagerv�rde (701 produkter)
--## F�rklaring:
--Jag kopplade f�rst ihop categories med products. D�refter tog jag ut kategorinamnen och summan av antalet produkter per kategori.
--D�refter sorterade jag listan i fallande ordning, och valde ut den kategori som l�g h�gst upp, vilket var seafood.


-- 5. Fr�n vilken leverant�r har vi s�lt flest produkter totalt under sommaren 2013?

----SELECT *
----FROM company.suppliers AS s
----JOIN company.products AS p ON p.SupplierId = s.Id
----JOIN company.order_details AS d ON d.ProductId = p.Id
----JOIN company.orders AS o ON d.OrderId = o.id;

----SELECT CompanyName, ProductName, Quantity, d.Id, ShippedDate
----FROM company.suppliers AS s
----JOIN company.products AS p ON p.SupplierId = s.Id
----JOIN company.order_details AS d ON d.ProductId = p.Id
----JOIN company.orders AS o ON d.OrderId = o.id;

----SELECT CompanyName, ProductName, Quantity, d.Id, ShippedDate
----FROM company.suppliers AS s
----JOIN company.products AS p ON p.SupplierId = s.Id
----JOIN company.order_details AS d ON d.ProductId = p.Id
----JOIN company.orders AS o ON d.OrderId = o.id
----WHERE ShippedDate BETWEEN '2013-06' AND '2013-09'
----ORDER BY CompanyName;

--SELECT TOP 5 CompanyName, SUM(Quantity) AS [Products sold summer 2013]
--FROM company.suppliers AS s
--	JOIN company.products AS p ON p.SupplierId = s.Id
--	JOIN company.order_details AS d ON d.ProductId = p.Id
--	JOIN company.orders AS o ON d.OrderId = o.id
--WHERE ShippedDate BETWEEN '2013-06' AND '2013-09'
--GROUP BY CompanyName
--ORDER BY [Products sold summer 2013] DESC;

--## Svar: Plutzer LebensmittelgroBm�rkte AG s�lde 478 produkter sommaren 2013 och var det b�st s�ljande f�retaget.
--## F�rklaring:
--Jag r�knade med juni, juli och augusti som sommarm�nader, och anv�nde ShippedDate n�r som datum f�r n�r produkten s�ldes.
--F�r att f� fram detta svar slog jag ihop tabellerna supliers, products, order_details och orders.
--Jag filtrerade ut sommars�ljen med hj�lp av operatorn BETWEEN. '2013-06' AND '2013-09' inneb�r att alla datum fr�n f�rsta juni till sista augusti filtreras fram.
--Jag r�knade ihop antalet s�lj genom operatorn SUM p� kolumnen Quantity, och grupperade ihop p� companyname f�r att f� summan p� varje f�retags f�rs�ljningar.
--Detta gav mig svaret: Plutzer LebensmittelgroBm�rkte AG s�lde 478 produkter sommaren 2013 och var det b�st s�ljande f�retaget. Den sista queryn var allts� den
--som ledde mig till r�tt svar.

--########## DEL 2 ##########


--declare @playlist varchar(max) = 'Heavy Metal Classic';
--GO

CREATE OR ALTER VIEW [Music]
AS
SELECT 
g.Name AS [Genre],
ar.Name AS [Artist],
a.Title AS [Album],
t.Name AS [Track],
FORMAT(DATEADD(SECOND, t.Milliseconds / 1000, 0), 'mm:ss') AS [Length],
CONVERT(NVARCHAR(10), ROUND(CONVERT(FLOAT, t.Bytes / (1024 * 1024.0)), 1)) + ' ' + 'MiB' AS [Size],
t.Composer AS [Composer]
FROM music.playlists p
JOIN music.playlist_track pjt ON p.PlaylistId = pjt.PlaylistId
JOIN music.tracks t ON pjt.TrackId = t.TrackId
JOIN music.albums a ON t.AlbumId = a.AlbumId
JOIN music.genres g ON g.GenreId = t.GenreId
JOIN music.artists ar ON ar.ArtistId = a.ArtistId;
GO





