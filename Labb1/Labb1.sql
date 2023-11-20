--CREATE DATABASE Labb1_Bokhandel;

USE Labb1_Bokhandel;

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

--CREATE TABLE Author_Book
--	(
--		[AuthorId] INT NOT NULL,
--		[Isbn13] NVARCHAR(13) CHECK((Isbn13 NOT LIKE '%[^0-9]%') AND LEN(Isbn13) = 13) NOT NULL,
--		CONSTRAINT [PK_Author_Book] PRIMARY KEY ([AuthorId], [Isbn13]),
--		CONSTRAINT [FK_AuthorId_Authors2] FOREIGN KEY ([AuthorId]) REFERENCES Authors(Id),
--      CONSTRAINT [FK_BookId_Books] FOREIGN KEY ([Isbn13]) REFERENCES Books(Isbn13)
--	);


