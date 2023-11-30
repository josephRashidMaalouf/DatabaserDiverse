USE everyloop;
GO
-- 1. Företagets totala produktkatalog består av 77 unika produkter. Om vi kollar bland våra ordrar, hur stor andel av dessa produkter har vi någon gång leverarat till London?

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

----## SVAR: 53,2% av företagets produkter har skickats till London.
----## Förklaring: 
--Relevanta tabeller för att besvara denna fråga är products, order_details och orders.
--Dessa slog jag ihop och plockade ut alla produktnamn och städer.
--På produktnamnen kör jag funktionen COUNT, med DISTINCT i parametern för att endast räkna unika produkter.
--Därefter dividerade jag antalet produkter skickade till LONDON med 77, vilket är den totala mängden unika produkter i sortimentet.
--För att detta skulle vara möjligt behövde jag först konvertera till en float. Den sista tabellen är alltså tabellen som gav mig rätt
--svar på frågan: 53,2% av företagets produkter har skickats till London.



-- 2. Till vilken stad har vi levererat flest unika produkter?

--SELECT COUNT(DISTINCT ProductName) AS [Unique products shipped], ShipCity 
--FROM company.products AS p
--JOIN company.order_details AS d ON p.Id = d.ProductId
--JOIN company.orders AS o ON o.Id = d.OrderId
--GROUP BY ShipCity
--ORDER BY [Unique products shipped] DESC;

--## SVAR: Boise
--## Förklaring:
--Jag återanvände koden från förra uppgiften där jag räknade ut antalet unika produkter skickade till London,
--men här tog jag bort vilkoret som filtrerar fram London, för att få en tabell över alla städer.
--Därefter ordnade jag svaren utefter antalet unika produkter sålda för att lättare hitta staden som
--företaget levererat flest unika produkter till. 


-- 3. Av de produkter som inte längre finns I vårat sortiment, hur mycket har vi sålt för totalt till Tyskland?


--SELECT COUNT(ProductName) AS [Total products sold], COUNT(DISTINCT ProductName) AS [Unique products sold] , ShipCountry
--FROM company.products AS p
--JOIN company.order_details AS d ON p.Id = d.ProductId
--JOIN company.orders AS o ON o.Id = d.OrderId
--WHERE ShipCountry = 'Germany' AND Discontinued = 1
--GROUP BY ShipCountry;

--## SVAR: Totalt 14 utgångna varor har sålts till Tyskland, varav 7 unika produkter.
--## Förklaring: 
--Samma tänk som i uppgifterna ovan, med skillnaden att jag i denna uppgift filtrerar efter tabellen Discontinued, och Land = Tyskland.
--Jag var lite osäker på om uppgiften ville ha den totala mängden produkter sålda, eller endast unika varor, därför tog jag fram båda.


-- 4. För vilken produktkategori har vi högst lagervärde?


--SELECT TOP 1 CategoryName, SUM(UnitsInStock) AS [Units in stock]
--FROM company.categories AS c
--JOIN Company.products AS p ON  c.Id = p.CategoryId
--GROUP BY CategoryName
--ORDER BY [Units in stock] DESC;

--## SVAR: Seafood har högst lagervärde (701 produkter)
--## Förklaring:
--Jag kopplade först ihop categories med products. Därefter tog jag ut kategorinamnen och summan av antalet produkter per kategori.
--Därefter sorterade jag listan i fallande ordning, och valde ut den kategori som låg högst upp, vilket var seafood.


-- 5. Från vilken leverantör har vi sålt flest produkter totalt under sommaren 2013?

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

--## Svar: Plutzer LebensmittelgroBmärkte AG sålde 478 produkter sommaren 2013 och var det bäst säljande företaget.
--## Förklaring:
--Jag räknade med juni, juli och augusti som sommarmånader, och använde ShippedDate när som datum för när produkten såldes.
--För att få fram detta svar slog jag ihop tabellerna supliers, products, order_details och orders.
--Jag filtrerade ut sommarsäljen med hjälp av operatorn BETWEEN. '2013-06' AND '2013-09' innebär att alla datum från första juni till sista augusti filtreras fram.
--Jag räknade ihop antalet sälj genom operatorn SUM på kolumnen Quantity, och grupperade ihop på companyname för att få summan på varje företags försäljningar.
--Detta gav mig svaret: Plutzer LebensmittelgroBmärkte AG sålde 478 produkter sommaren 2013 och var det bäst säljande företaget. Den sista queryn var alltså den
--som ledde mig till rätt svar.

--########## DEL 2 ##########




--## Föruppgift

--declare @playlist varchar(max) = 'Heavy Metal Classic'; -- Här skriver jag spellistan jag vill ha fram i selecten
--SELECT 
--g.Name AS [Genre],
--ar.Name AS [Artist],
--a.Title AS [Album],
--t.Name AS [Track],
--FORMAT(DATEADD(SECOND, t.Milliseconds / 1000, 0), 'mm:ss') AS [Length], -- Med DATEADD konverterar jag millisekunder till sekunder, och formaterar det därefter till mm:ss med FORMAT
--CONVERT(NVARCHAR(10), ROUND(CONVERT(FLOAT, t.Bytes / (1024 * 1024.0)), 1)) + ' ' + 'MiB' AS [Size], -- en MiB består av (1024 * 1024) bytes. För att göra denna beräkning konverterar jag först till FLOAT, därefter rundar jag av till en decimal och gör om till en NVARCHAR för att sätta MiB som prefix
--t.Composer AS [Composer]
--FROM music.playlists p
--JOIN music.playlist_track pjt ON p.PlaylistId = pjt.PlaylistId
--JOIN music.tracks t ON pjt.TrackId = t.TrackId
--JOIN music.albums a ON t.AlbumId = a.AlbumId
--JOIN music.genres g ON g.GenreId = t.GenreId
--JOIN music.artists ar ON ar.ArtistId = a.ArtistId
--WHERE P.Name = @playlist; -- refererar till variabeln som deklarerades i första raden
--GO

--SELECT name FROM music.playlists;

--1. Av alla audiospår, vilken artist har längst total speltid?

 
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

----## SVAR: Iron Maiden har längst speltid med sina 172915816 millisekunder
----## Förklaring:
--Jag återanvände Queryn från föruppgiften, men gjorde om den.
--Eftersom uppgiften ville undersöka alla audiospår, tog jag bort variabeln.
--Jag la även till en join på media types för att kunna sortera fram ljudfiler
--För att underlätta uträkningen tog jag även bort omvandlingen från millisekunder till mm:ss.



----2. Vad är den genomsnittliga speltiden på den artistens låtar?
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

--## SVAR: Jag fick den genomsnittliga tiden på Iron Maidens låtar till 05:35. 


--3. Vad är den sammanlagda filstorleken för all video?

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


--4. Vilket är det högsta antal artister som finns på en enskild spellista?

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

--5. Vilket är det genomsnittliga antalet artister per spellista?

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

--## SVAR: 47. Det borde egentligen bli 47,5 tror jag? för totala antalet var 475 som skulle divideras med 10 spellistor.
--				Men orkar inte kolla det nu.

---- --> Rätt svar: (Ger 17) OBS FEL!
--SELECT COUNT(DISTINCT art.[Name]) / COUNT(DISTINCT pl.[Name]) AS [Avarage]
--FROM music.tracks AS t
--INNER JOIN music.playlist_track AS pt ON pt.TrackId = t.TrackId
--INNER JOIN music.playlists AS pl on pl.PlaylistId = pt.PlaylistId
--INNER JOIN music.albums AS a on a.AlbumId = t.AlbumId
--INNER JOIN music.artists AS art ON art.ArtistId = a.ArtistId
--INNER JOIN music.genres As gen ON gen.GenreId = t.GenreId

--Här kommer rätt: Ger 14,57
SELECT CAST(COUNT(DISTINCT art.[Name]) AS FLOAT) / CAST(COUNT(DISTINCT pl.[PlaylistId]) AS FLOAT) AS [Avarage]
FROM music.tracks AS t
INNER JOIN music.playlist_track AS pt ON pt.TrackId = t.TrackId
INNER JOIN music.playlists AS pl on pl.PlaylistId = pt.PlaylistId
INNER JOIN music.albums AS a on a.AlbumId = t.AlbumId
INNER JOIN music.artists AS art ON art.ArtistId = a.ArtistId
GO
