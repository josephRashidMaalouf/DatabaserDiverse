USE everyloop;

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

SELECT *
FROM company.suppliers AS s
JOIN company.products AS p ON p.SupplierId = s.Id
JOIN company.order_details AS d ON d.ProductId = p.Id
JOIN company.orders AS o ON d.OrderId = o.id;

SELECT CompanyName, ProductName, Quantity, d.Id, ShippedDate
FROM company.suppliers AS s
JOIN company.products AS p ON p.SupplierId = s.Id
JOIN company.order_details AS d ON d.ProductId = p.Id
JOIN company.orders AS o ON d.OrderId = o.id;

SELECT CompanyName, ProductName, Quantity, d.Id, ShippedDate
FROM company.suppliers AS s
JOIN company.products AS p ON p.SupplierId = s.Id
JOIN company.order_details AS d ON d.ProductId = p.Id
JOIN company.orders AS o ON d.OrderId = o.id
WHERE ShippedDate LIKE ('2013-06%') OR ShippedDate LIKE ('2013-07%') OR ShippedDate LIKE ('2013-08%');

