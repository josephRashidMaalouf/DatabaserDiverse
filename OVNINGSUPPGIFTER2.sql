USE everyloop;

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


SELECT COUNT(ProductName) AS [Total products sold], COUNT(DISTINCT ProductName) AS [Unique products sold] , ShipCountry
FROM company.products AS p
JOIN company.order_details AS d ON p.Id = d.ProductId
JOIN company.orders AS o ON o.Id = d.OrderId
WHERE ShipCountry = 'Germany' AND Discontinued = 1
GROUP BY ShipCountry;

--## SVAR: Totalt 14 utg�ngna varor har s�lts till Tyskland, varav 7 unika produkter.
--## F�rklaring: 
--Samma t�nk som i uppgifterna ovan, med skillnaden att jag i denna uppgift filtrerar efter tabellen Discontinued, och Land = Tyskland.
--Jag var lite os�ker p� om uppgiften ville ha den totala m�ngden produkter s�lda, eller endast unika varor, d�rf�r tog jag fram b�da.


-- 4. F�r vilken produktkategori har vi h�gst lagerv�rde?



-- 5. Fr�n vilken leverant�r har vi s�lt flest produkter totalt under sommaren 2013?