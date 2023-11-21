--CREATE DATABASE Labb1_Bokhandel;

USE Labb1_Bokhandel;

--###Create tables###---

--CREATE TABLE Authors
--	(
--		Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
--		[First Name] NVARCHAR(20),
--		[Last Name] NVARCHAR(20),
--		[Birthday] DATETIME2
--	);
		

--CREATE TABLE Publishers
--	(
--		Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
--		[Name] NVARCHAR(20),
--		[Head Office City] NVARCHAR(20),
--	);


--CREATE TABLE Publisher_Author
--	(
--		AuthorId INT NOT NULL,
--		PublisherId INT NOT NULL,
--		CONSTRAINT PK_Pub_AUT PRIMARY KEY (AuthorId, PublisherId),
--		CONSTRAINT FK_PublisherId_Publishers FOREIGN KEY (PublisherId) REFERENCES Publishers(Id),
--		CONSTRAINT FK_AuthorId_Authors FOREIGN KEY (AuthorId) REFERENCES Authors(Id)
--	);


--CREATE TABLE Books
--(
--	[Isbn13] NVARCHAR(13) PRIMARY KEY CHECK((Isbn13 NOT LIKE '%[^0-9]%') AND LEN(Isbn13) = 13) NOT NULL,
--	[Title] NVARCHAR(20),
--	[Language] NVARCHAR(20),
--	[Price] INT,
--	[Publishing_Date] DATETIME2
--);

--ALTER TABLE Books
--ALTER COLUMN [Title] NVARCHAR(50) NOT NULL;
--ALTER TABLE Books
--ALTER COLUMN [Price] FLOAT NOT NULL;
--ALTER TABLE Books
--ALTER COLUMN Publishing_Date DATE;

--ALTER TABLE Books
--ADD GenreId INT;
--ALTER TABLE Books
--ADD FOREIGN KEY (GenreId) REFERENCES Genres([Id]);




--CREATE TABLE Author_Book
--	(
--		[AuthorId] INT NOT NULL,
--		[Isbn13] NVARCHAR(13) CHECK((Isbn13 NOT LIKE '%[^0-9]%') AND LEN(Isbn13) = 13) NOT NULL,
--		CONSTRAINT [PK_Author_Book] PRIMARY KEY ([AuthorId], [Isbn13]),
--		CONSTRAINT [FK_AuthorId_Authors2] FOREIGN KEY ([AuthorId]) REFERENCES Authors(Id),
--      CONSTRAINT [FK_BookId_Books] FOREIGN KEY ([Isbn13]) REFERENCES Books(Isbn13)
--	);

CREATE TABLE Genres
(
	[Id] INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[Book_Isbn] NVARCHAR(13) FOREIGN KEY REFERENCES Books([Isbn13]),
	[Name] NVARCHAR(20),
	CONSTRAINT [Book_Isbn] CHECK((Book_Isbn NOT LIKE '%[^0-9]%') AND LEN(Book_Isbn) = 13)

);

--FK__Genres__Book_Isb__2F2FFC0C

--CREATE TABLE Customers
--(	
--	[Id] INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
--	[First Name] NVARCHAR(20) NOT NULL,
--	[Last Name] NVARCHAR(20) NOT NULL,
--	[Street] NVARCHAR(20) NOT NULL,
--	[City] NVARCHAR(20) NOT NULL,
--	[Postal No] INT NOT NULL,
--	[Email] NVARCHAR(50) NOT NULL
--)

--CREATE TABLE Stores
--(	
--	[Id] INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
--	[Name] NVARCHAR(20) NOT NULL,
--	[Street] NVARCHAR(20) NOT NULL,
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

--###Populate the tables###---

--INSERT INTO Publishers
--VALUES
--	('Studentlitteratur', 'Lund'),
--	('AstridLindgrenTextAB', 'Stockholm'),
--	('Raben & Sjögren', 'Stockholm'),
--	('Nordstedts', 'Stockholm'),
--	('HarperCollinsUK', 'Manchester'),
--	('Harper Perennial', 'New York');
--INSERT INTO Publishers VALUES ('Albert Bonniers', 'Stockholm');

--INSERT INTO Authors
--VALUES
--	('Zhiwar', 'Rashid', '1998-09-16'),
--	('Astrid', 'Lindgren', '1907-11-14'),
--	('Jonas Hassen', 'Khemiri', '1978-12-27'),
--	('George R.R', 'Martin', '1948-12-27'),
--	('Yuval Noah', 'Harari', '1976-02-24'),
--	('Bo', 'Sandberg', '1952-06-29'),
--	('Sven', 'Faugert', '1945-10-12');


--INSERT INTO Publisher_Author (AuthorId, PublisherId) 
--VALUES
--	(1,15),
--	(2,13),
--	(2,14),
--	(3,18),
--	(3,15),
--	(4,16),
--	(5,17),
--	(6,12),
--	(7,12);

INSERT INTO GENRES
VALUES
(

--INSERT INTO Books
--VALUES
--('9789144135991', 'Perspektiv på utvärdering', 'Svenska', 348.0, '2020-05-13'),
--('9789113125725', 'Under mullbärsträdet', 'Svenska', 249.0, '2023-09-27'),
--('9789129697285', 'Här kommer Pippi Långstrump', 'Svenska', 99.0, '2015-04-20'),
--('9789129688313', 'Bröderna Lejonhjärta',  'Svenska', 149.0, '2013-09-26'),
--('9789129717211', 'Mio min Mio', 'Svenska', 229.0, '2020-09-18'),
--('9789174295788', 'Ett öga rött', 'Svenska', 89.0, '2017-01-11'),
--('9789100800765', 'Systrarna', 'Svenska', 269.0, '2023-09-04'),
--('9780062316110', 'Sapiens: A brief history of humankind', 'Engelska', '174.0', '2018-05-01'),
--('9780006479888', 'A Game of Thrones', 'Engelska', 98.0, '1997-04-01');

