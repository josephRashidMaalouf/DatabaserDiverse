USE everyloop;

-- 1. Företagets totala produktkatalog består av 77 unika produkter. Om vi kollar bland våra ordrar, hur stor andel av dessa produkter har vi någon gång leverarat till London?

SELECT *
FROM company.products AS p
JOIN company.order_details AS d ON p.Id = d.ProductId
JOIN company.orders AS o ON o.Id = d.OrderId
WHERE ShipCity = 'London'
ORDER BY ProductName;

SELECT COUNT(DISTINCT ProductName) AS [Unique products shipped], ShipCity 
FROM company.products AS p
JOIN company.order_details AS d ON p.Id = d.ProductId
JOIN company.orders AS o ON o.Id = d.OrderId
WHERE ShipCity = 'London'
GROUP BY ShipCity;

SELECT (CONVERT(FLOAT, COUNT(DISTINCT ProductName) / 77.0) * 100) AS [Percentage], ShipCity 
FROM company.products AS p
JOIN company.order_details AS d ON p.Id = d.ProductId
JOIN company.orders AS o ON o.Id = d.OrderId
WHERE ShipCity = 'London'
GROUP BY ShipCity;

----## SVAR: 53,2% av företagets produkter har skickats till London.
----## Förklaring: 
--Relevanta tabeller för att besvara denna fråga är products, order_details och orders.
--Dessa slog jag ihop och plockade ut alla produktnamn och städer.
--På produktnamnen kör jag funktionen COUNT, med DISTINCT i parametern för att endast räkna unika produkter.
--Därefter dividerade jag antalet produkter skickade till LONDON med 77, vilket är den totala mängden unika produkter i sortimentet.
--För att detta skulle vara möjligt behövde jag först konvertera till en float. Den sista tabellen är alltså tabellen som gav mig rätt
--svar på frågan: 53,2% av företagets produkter har skickats till London.



-- 2. Till vilken stad har vi levererat flest unika produkter?





-- 3. Av de produkter som inte längre finns I vårat sortiment, hur mycket har vi sålt för totalt till Tyskland?




-- 4. För vilken produktkategori har vi högst lagervärde?



-- 5. Från vilken leverantör har vi sålt flest produkter totalt under sommaren 2013?