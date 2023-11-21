--CREATE DATABASE Labb1_Bokhandel2;

USE Labb1_Bokhandel2;

----###Create tables###---

--CREATE TABLE Authors
--	(
--		[Id] INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
--		[First Name] NVARCHAR(20),
--		[Last Name] NVARCHAR(20),
--		[Birthday] DATETIME2
--	);

--ALTER TABLE AUTHORS
--ALTER COLUMN [Birthday] DATE;

--CREATE TABLE Publishers
--	(
--		[Id] INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
--		[Name] NVARCHAR(50),
--		[Head Office City] NVARCHAR(20),
--	);


--CREATE TABLE Publisher_Author
--	(
--		[AuthorId] INT NOT NULL,
--		[PublisherId] INT NOT NULL,
--		CONSTRAINT PK_Pub_AUT PRIMARY KEY (AuthorId, PublisherId),
--		CONSTRAINT FK_PublisherId_Publishers FOREIGN KEY (PublisherId) REFERENCES Publishers(Id),
--		CONSTRAINT FK_AuthorId_Authors FOREIGN KEY (AuthorId) REFERENCES Authors(Id)
--	);


--CREATE TABLE Genres
--(
--	[Id] INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
--	[Name] NVARCHAR(20)

--);

--CREATE TABLE Descriptions
--(
--	[Id] INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
--	[Description] NVARCHAR(MAX)
--);

--CREATE TABLE Books
--(
--	[Isbn13] NVARCHAR(13) PRIMARY KEY CHECK((Isbn13 NOT LIKE '%[^0-9]%') AND LEN(Isbn13) = 13) NOT NULL,
--	[Title] NVARCHAR(50),
--	[Language] NVARCHAR(20),
--	[Price] FLOAT,
--	[Publishing_Date] DATE,
--	[GenreId] INT FOREIGN KEY REFERENCES Genres([Id])
--);

--ALTER TABLE Books
--ADD [DescriptionId] INT FOREIGN KEY REFERENCES Descriptions([Id]);


--CREATE TABLE Author_Book
--	(
--		[AuthorId] INT NOT NULL,
--		[Isbn13] NVARCHAR(13) CHECK((Isbn13 NOT LIKE '%[^0-9]%') AND LEN(Isbn13) = 13) NOT NULL,
--		CONSTRAINT [PK_Author_Book] PRIMARY KEY ([AuthorId], [Isbn13]),
--		CONSTRAINT [FK_AuthorId_Authors2] FOREIGN KEY ([AuthorId]) REFERENCES Authors(Id),
--		CONSTRAINT [FK_BookId_Books] FOREIGN KEY ([Isbn13]) REFERENCES Books(Isbn13)
--	);



--CREATE TABLE Customers
--(	
--	[Id] INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
--	[First Name] NVARCHAR(20) NOT NULL,
--	[Last Name] NVARCHAR(20) NOT NULL,
--	[Street] NVARCHAR(50) NOT NULL,
--	[City] NVARCHAR(20) NOT NULL,
--	[Postal No] INT NOT NULL,
--	[Email] NVARCHAR(50) NOT NULL
--)

--CREATE TABLE Stores
--(	
--	[Id] INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
--	[Name] NVARCHAR(20) NOT NULL,
--	[Street] NVARCHAR(50) NOT NULL,
--	[City] NVARCHAR(20) NOT NULL,
--	[Postal No] INT NOT NULL,
--)

--CREATE TABLE Orders
--(
--	[Id] INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
--	[Customer Id] INT FOREIGN KEY REFERENCES Customers(Id),
--	[Store Id] INT FOREIGN KEY REFERENCES Stores(Id),
--);

--CREATE TABLE Order_Book
--	(
--		[OrderId] INT NOT NULL,
--		[Isbn13] NVARCHAR(13) CHECK((Isbn13 NOT LIKE '%[^0-9]%') AND LEN(Isbn13) = 13) NOT NULL,
--		CONSTRAINT [PK_Order_Book] PRIMARY KEY ([OrderId], [Isbn13]),
--		CONSTRAINT [FK_OrderId_Orders] FOREIGN KEY ([OrderId]) REFERENCES Orders(Id),
--		CONSTRAINT [FK_IsbnId_Isbn13] FOREIGN KEY ([Isbn13]) REFERENCES Books(Isbn13)
--	);

--CREATE TABLE IventoryBalance
--(
--	[StoreId] INT FOREIGN KEY REFERENCES Stores(Id) NOT NULL,
--	[Isbn13] NVARCHAR(13) CHECK((Isbn13 NOT LIKE '%[^0-9]%') AND LEN(Isbn13) = 13) NOT NULL,
--	[Quantity] INT NOT NULL,
--	CONSTRAINT [PK_Store_Book] PRIMARY KEY ([StoreId], [Isbn13]),
--	CONSTRAINT [FK_StoreId_Stores] FOREIGN KEY ([StoreId]) REFERENCES Stores(Id),
--	CONSTRAINT [FK_Isbn13_Books2] FOREIGN KEY ([Isbn13]) REFERENCES Books(Isbn13)
--);

----###Populate the tables###---

--INSERT INTO Publishers
--VALUES
--	('Studentlitteratur', 'Lund'),
--	('AstridLindgrenTextAB', 'Stockholm'),
--	('Raben & Sjögren', 'Stockholm'),
--	('Nordstedts', 'Stockholm'),
--	('HarperCollinsUK', 'Manchester'),
--	('Harper Perennial', 'New York'),
--	('Albert Bonniers', 'Stockholm');

--INSERT INTO Authors
--VALUES
--	('Zhiwar', 'Rashid', '1998-09-16'),
--	('Astrid', 'Lindgren', '1907-11-14'),
--	('Jonas Hassen', 'Khemiri', '1978-12-27'),
--	('George R.R', 'Martin', '1948-12-27'),
--	('Yuval Noah', 'Harari', '1976-02-24'),
--	('Bo', 'Sandberg', '1952-06-29'),
--	('Sven', 'Faugert', '1945-10-12');
--UPDATE Authors SET Birthday = '1988-09-16' WHERE [First Name] = 'Zhiwar';


--INSERT INTO Publisher_Author (AuthorId, PublisherId) 
--VALUES
--	(1,4),
--	(2,2),
--	(2,3),
--	(3,7),
--	(3,4),
--	(4,5),
--	(5,6),
--	(6,1),
--	(7,1);

--INSERT INTO GENRES
--VALUES
--('Skönlitteratur'),
--('Barn'),
--('Fantasy'),
--('Sagalitteratur'),
--('Historia'),
--('Science fiction');
--INSERT INTO Genres VALUES ('Forskningslitteratur');

--INSERT INTO Books
--VALUES
--('9789144135991', 'Perspektiv på utvärdering', 'Svenska', 348.0, '2020-05-13', 7),
--('9789113125725', 'Under mullbärsträdet', 'Svenska', 249.0, '2023-09-27', 1),
--('9789129697285', 'Här kommer Pippi Långstrump', 'Svenska', 99.0, '2015-04-20', 2),
--('9789129688313', 'Bröderna Lejonhjärta',  'Svenska', 149.0, '2013-09-26', 3),
--('9789129717211', 'Mio min Mio', 'Svenska', 229.0, '2020-09-18', 3),
--('9789174295788', 'Ett öga rött', 'Svenska', 89.0, '2017-01-11', 1),
--('9789100800765', 'Systrarna', 'Svenska', 269.0, '2023-09-04', 4),
--('9780062316110', 'Sapiens: A brief history of humankind', 'Engelska', '174.0', '2018-05-01', 5),
--('9780006479888', 'A Game of Thrones', 'Engelska', 98.0, '1997-04-01', 3);

--INSERT INTO Descriptions
--VALUES
--('Utifrån principen att utvärdering måste ses ur olika perspektiv och utformas på olika sätt beroende på sammanhanget och hur resultaten skall användas, ger denna bok en introduktion till utvärderingsdesign och frågeställningar som behöver hanteras i en utvärdering.'),
--('Azad växer upp ensam med sin mamma, i en orolig närhet där vissa frågor aldrig får ställas, vissa ämnen aldrig beröras. Då stänger mamma sovrumsdörren och lämnar sin pojke ensam.'),
--('Både stora och små - alla kan väl sången om Pippi! Här som älskad visa i en egen liten bok med Ingrid Vang Nymans färgstarka bilder.'),
--('Skorpans bror Jonathan har berättat om landet Nangijala, dit man kommer när man dör. För Skorpan är sjuk och ska dö.'),
--('Historien om Bo Vilhelm Olsson, som blir Mio och hamnar i Landet i fjärran där han får i uppdrag att bekämpa den onda riddar Kato.'),
--('Halim har genomskådat allt. Han har genomskådat Integrationsplanen. Han har genomskådat varför de intellektuella liknar halta kameler.'),
--('Allt förändras när Ina, Evelyn och Anastasia flyttar till Jonas kvarter. De mytomspunna systrarna pratar engelska med varandra, fast de är födda i Sverige.'),
--('From a renowned historian comes a groundbreaking narrative of humanitys creation and evolution'),
--('The first volume of A Song of Ice and Fire, the greatest fantasy epic of the modern age.');



--UPDATE Books SET [DescriptionId] = (1) WHERE Isbn13 = '9789144135991';
--UPDATE Books SET [DescriptionId] = (2) WHERE Isbn13 = '9789113125725';
--UPDATE Books SET [DescriptionId] = (3) WHERE Isbn13 = '9789129697285';
--UPDATE Books SET [DescriptionId] = (5) WHERE Isbn13 = '9789129717211';
--UPDATE Books SET [DescriptionId] = (4) WHERE Isbn13 = '9789129688313';
--UPDATE Books SET [DescriptionId] = (6) WHERE Isbn13 = '9789174295788';
--UPDATE Books SET [DescriptionId] = (7) WHERE Isbn13 = '9789100800765';
--UPDATE Books SET [DescriptionId] = (8) WHERE Isbn13 = '9780062316110';
--UPDATE Books SET [DescriptionId] = (9) WHERE Isbn13 = '9780006479888';



--INSERT INTO Author_Book (AuthorId, Isbn13) 
--VALUES
--	(1,9789113125725),
--	(2,9789129697285),
--	(2,9789129688313),
--	(2,9789129717211),
--	(3,9789174295788),
--	(3,9789100800765),
--	(4,9780006479888),
--	(5,9780062316110),
--	(6,9789144135991),
--	(7,9789144135991);

--INSERT INTO Stores
--VALUES
--('Duckeys Böcker', 'Brådgatan 35', 'Norrköping', 60220),
--('Bocke bok', 'St Persgatan 45', 'Norrköping', 61234),
--('Fenders Bokbränder', 'Skepparegatan 7', 'Norrköping', 62162);

--INSERT INTO IventoryBalance
--VALUES 
--(1, '9789129717211', 50),
--(1, '9789129697285', 78),
--(1, '9789129688313', 100),
--(2, '9789144135991', 34),
--(2, '9789113125725', 112),
--(2, '9789174295788', 56),
--(2, '9789100800765', 102),
--(3, '9780062316110', 32),
--(3, '9780006479888', 29),
--(3, '9789144135991', 56);

--INSERT INTO Customers
--VALUES
--('Joseph','Rashid-Maalouf','Östra Högvintergatan 3','Göteborg',41743,'joe@gmail.com'),
--('Rania','Ringstrand-Fannoun','Repslagaregatan 5','Norrköping',60232,'rania@hotmail.com'),
--('Dolan','Dack','Ankeborgsvägen 3','Ankeborg',98743,'dolangoobypls@yahoo.com'),
--('Simba','Mufasasson','Lejonklippan 1','Malmö',12345,'simba@live.se');

--INSERT INTO Orders
--VALUES
--(17,1),
--(17,2),
--(18,2),
--(18,3),
--(19,1),
--(20,2);

--INSERT INTO Order_Book
--VALUES
--(1,'9789129717211'),
--(1,'9789129688313'),
--(2,'9789113125725'),
--(2,'9789100800765'),
--(3,'9789144135991'),
--(4,'9780062316110'),
--(5,'9789129697285'),
--(6,'9789113125725');



----####Lite test för Views###---

--SELECT Stores.Id, Name, Title, Books.Isbn13 FROM Stores
--JOIN IventoryBalance ON StoreId = Stores.Id
--JOIN Books ON Books.Isbn13 = IventoryBalance.Isbn13;

--SELECT [First Name], [Name], [Title]
--FROM Customers
--JOIN Orders ON Customers.Id = Orders.[Customer Id]
--JOIN Stores ON Stores.Id = Orders.[Store Id]
--JOIN Order_Book ON Order_Book.OrderId = Orders.Id
--JOIN Books ON Books.Isbn13 = Order_Book.Isbn13;

----### CREATE Views ### ---

--CREATE VIEW [TitlarPerFörfattare] AS
--SELECT ([First Name] + ' ' + [Last Name]) AS [Name], DATEDIFF(year, [Birthday], GETDATE()) AS [Age], COUNT(DISTINCT [Title]) AS [Titles], SUM(Quantity * [Price]) AS [Inventory value]
--FROM Authors
--FULL JOIN Author_Book ON Author_Book.AuthorId = Authors.Id
--FULL JOIN Books ON Books.Isbn13 = Author_Book.Isbn13
--FULL JOIN IventoryBalance ON IventoryBalance.Isbn13 = Books.Isbn13
--GROUP BY [First Name] + ' ' + [Last Name], [Birthday];

--SELECT * FROM TitlarPerFörfattare;




----This view displays the most successful book stores in term of sales. This is useful for the executive director of the store chain when making decisions about things such as investments and promotions.

--CREATE VIEW [MostSuccessfulStore] AS
--SELECT [Name] AS [Book store], COUNT([Store Id]) AS [Sales], SUM([Price]) AS [Total revenue]
--FROM Stores 
--JOIN Orders ON Stores.Id = Orders.[Store Id]
--JOIN Order_Book ON Order_Book.OrderId = Orders.Id
--JOIN Books ON Books.Isbn13 = Order_Book.Isbn13
--GROUP BY [Name];



----This view shows the prefered genre by each customer. This is useful for tailoring offers and recommendations that are relevant for the customers.

--CREATE VIEW [CustomersGenrePrefrences] AS
--SELECT [First Name] + ' ' + [Last Name] AS [Name], Genres.[Name] AS [Genre], COUNT(Genres.[Name]) AS [Books of this genre bought]
--FROM Customers
--JOIN Orders ON Customers.Id = Orders.[Customer Id]
--JOIN Stores ON Stores.Id = Orders.[Store Id]
--JOIN Order_Book ON Order_Book.OrderId = Orders.Id
--JOIN Books ON Books.Isbn13 = Order_Book.Isbn13
--JOIN Genres ON Genres.Id = Books.GenreId
--GROUP BY [First Name] + ' ' + [Last Name], Genres.[Name];

