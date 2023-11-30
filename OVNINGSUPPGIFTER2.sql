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




--## F�ruppgift

--declare @playlist varchar(max) = 'Heavy Metal Classic'; -- H�r skriver jag spellistan jag vill ha fram i selecten
--SELECT 
--g.Name AS [Genre],
--ar.Name AS [Artist],
--a.Title AS [Album],
--t.Name AS [Track],
--FORMAT(DATEADD(SECOND, t.Milliseconds / 1000, 0), 'mm:ss') AS [Length], -- Med DATEADD konverterar jag millisekunder till sekunder, och formaterar det d�refter till mm:ss med FORMAT
--CONVERT(NVARCHAR(10), ROUND(CONVERT(FLOAT, t.Bytes / (1024 * 1024.0)), 1)) + ' ' + 'MiB' AS [Size], -- en MiB best�r av (1024 * 1024) bytes. F�r att g�ra denna ber�kning konverterar jag f�rst till FLOAT, d�refter rundar jag av till en decimal och g�r om till en NVARCHAR f�r att s�tta MiB som prefix
--t.Composer AS [Composer]
--FROM music.playlists p
--JOIN music.playlist_track pjt ON p.PlaylistId = pjt.PlaylistId
--JOIN music.tracks t ON pjt.TrackId = t.TrackId
--JOIN music.albums a ON t.AlbumId = a.AlbumId
--JOIN music.genres g ON g.GenreId = t.GenreId
--JOIN music.artists ar ON ar.ArtistId = a.ArtistId
--WHERE P.Name = @playlist; -- refererar till variabeln som deklarerades i f�rsta raden
--GO

--SELECT name FROM music.playlists;

--1. Av alla audiosp�r, vilken artist har l�ngst total speltid?

 
--SELECT TOP 1
--ar.Name AS [Artist],
--SUM(t.Milliseconds) AS [Total Length]
--FROM music.playlists p
--JOIN music.playlist_track pjt ON p.PlaylistId = pjt.PlaylistId
--JOIN music.tracks t ON pjt.TrackId = t.TrackId
--JOIN music.albums a ON t.AlbumId = a.AlbumId
--JOIN music.genres g ON g.GenreId = t.GenreId
--JOIN music.artists ar ON ar.ArtistId = a.ArtistId
--JOIN music.media_types m ON m.MediaTypeId = t.MediaTypeId
--WHERE m.Name LIKE '%audio%'
--GROUP BY ar.Name
--ORDER BY [Total Length] DESC;

----## SVAR: Iron Maiden har l�ngst speltid med sina 172915816 millisekunder
----## F�rklaring:
--Jag �teranv�nde Queryn fr�n f�ruppgiften, men gjorde om den.
--Eftersom uppgiften ville unders�ka alla audiosp�r, tog jag bort variabeln.
--Jag la �ven till en join p� media types f�r att kunna sortera fram ljudfiler
--F�r att underl�tta utr�kningen tog jag �ven bort omvandlingen fr�n millisekunder till mm:ss.



----2. Vad �r den genomsnittliga speltiden p� den artistens l�tar?
----SELECT
----ar.Name AS [Artist],
----t.Milliseconds [Total Length] ,
----t.Name AS [TRACK]
----FROM music.playlists p
----JOIN music.playlist_track pjt ON p.PlaylistId = pjt.PlaylistId
----JOIN music.tracks t ON pjt.TrackId = t.TrackId
----JOIN music.albums a ON t.AlbumId = a.AlbumId
----JOIN music.genres g ON g.GenreId = t.GenreId
----JOIN music.artists ar ON ar.ArtistId = a.ArtistId
----WHERE ar.Name = 'Iron Maiden';

--SELECT
--ar.Name AS [Artist],
-- COUNT(t.Name) AS [No of tracks],
--SUM(t.Milliseconds) AS [Total length],
--FORMAT(DATEADD(SECOND, CONVERT(FLOAT, SUM(t.Milliseconds) / COUNT(t.Name)) / 1000, 0), 'mm:ss') AS [Avarage]
--FROM music.playlists p
--JOIN music.playlist_track pjt ON p.PlaylistId = pjt.PlaylistId
--JOIN music.tracks t ON pjt.TrackId = t.TrackId
--JOIN music.albums a ON t.AlbumId = a.AlbumId
--JOIN music.genres g ON g.GenreId = t.GenreId
--JOIN music.artists ar ON ar.ArtistId = a.ArtistId
--WHERE ar.Name = 'Iron Maiden'
--GROUP BY ar.Name;

--## SVAR: Jag fick den genomsnittliga tiden p� Iron Maidens l�tar till 05:35. 


--3. Vad �r den sammanlagda filstorleken f�r all video?

--SELECT SUM(ROUND(CONVERT(FLOAT, t.Bytes / (1024 * 1024.0)), 1)) AS [Total size video (MiB)]
--FROM music.playlists p
--JOIN music.playlist_track pjt ON p.PlaylistId = pjt.PlaylistId
--JOIN music.tracks t ON pjt.TrackId = t.TrackId
--JOIN music.albums a ON t.AlbumId = a.AlbumId
--JOIN music.genres g ON g.GenreId = t.GenreId
--JOIN music.artists ar ON ar.ArtistId = a.ArtistId
--JOIN music.media_types m ON m.MediaTypeId = t.MediaTypeId
--WHERE m.Name LIKE '%video%';

-- ## Svar: 171691,1 MiB


--4. Vilket �r det h�gsta antal artister som finns p� en enskild spellista?

--SELECT 
--	p.Name AS [Playlist],
--	COUNT(DISTINCT ar.Name)  AS [No of Artists]
--FROM music.playlists p
--	JOIN music.playlist_track pjt ON p.PlaylistId = pjt.PlaylistId
--	JOIN music.tracks t ON pjt.TrackId = t.TrackId
--	JOIN music.albums a ON t.AlbumId = a.AlbumId
--	JOIN music.genres g ON g.GenreId = t.GenreId
--	JOIN music.artists ar ON ar.ArtistId = a.ArtistId
--	JOIN music.media_types m ON m.MediaTypeId = t.MediaTypeId
--WHERE m.Name LIKE '%audio%'
--GROUP BY p.Name
--ORDER BY [No of Artists] DESC;

----## SVAR: Spellistan Music har flest artister: 198 st.

--5. Vilket �r det genomsnittliga antalet artister per spellista?

--SELECT
--	CONVERT(FLOAT, SUM([No of Artists]) / COUNT(DISTINCT [Playlist])) AS [Avarage number of artist per track]

--FROM (
--		SELECT 
--			p.Name AS [Playlist],
--			COUNT(DISTINCT ar.Name)  AS [No of Artists]
--		FROM music.playlists p
--			JOIN music.playlist_track pjt ON p.PlaylistId = pjt.PlaylistId
--			JOIN music.tracks t ON pjt.TrackId = t.TrackId
--			JOIN music.albums a ON t.AlbumId = a.AlbumId
--			JOIN music.genres g ON g.GenreId = t.GenreId
--			JOIN music.artists ar ON ar.ArtistId = a.ArtistId
--			JOIN music.media_types m ON m.MediaTypeId = t.MediaTypeId
--		WHERE m.Name LIKE '%audio%'
--		GROUP BY p.Name
--	 ) AS Subquery;

--## SVAR: 47. Det borde egentligen bli 47,5 tror jag? f�r totala antalet var 475 som skulle divideras med 10 spellistor.
--				Men orkar inte kolla det nu.

---- --> R�tt svar: (Ger 17) OBS FEL!
--SELECT COUNT(DISTINCT art.[Name]) / COUNT(DISTINCT pl.[Name]) AS [Avarage]
--FROM music.tracks AS t
--INNER JOIN music.playlist_track AS pt ON pt.TrackId = t.TrackId
--INNER JOIN music.playlists AS pl on pl.PlaylistId = pt.PlaylistId
--INNER JOIN music.albums AS a on a.AlbumId = t.AlbumId
--INNER JOIN music.artists AS art ON art.ArtistId = a.ArtistId
--INNER JOIN music.genres As gen ON gen.GenreId = t.GenreId

--H�r kommer r�tt: Ger 14,57
SELECT CAST(COUNT(DISTINCT art.[Name]) AS FLOAT) / CAST(COUNT(DISTINCT pl.[PlaylistId]) AS FLOAT) AS [Avarage]
FROM music.tracks AS t
INNER JOIN music.playlist_track AS pt ON pt.TrackId = t.TrackId
INNER JOIN music.playlists AS pl on pl.PlaylistId = pt.PlaylistId
INNER JOIN music.albums AS a on a.AlbumId = t.AlbumId
INNER JOIN music.artists AS art ON art.ArtistId = a.ArtistId
GO
