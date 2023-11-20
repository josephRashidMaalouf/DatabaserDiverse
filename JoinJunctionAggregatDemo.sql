--CREATE DATABASE KeysDemoDb;

Use KeysDemoDb;

--CREATE TABLE Countries
--	(
--		Id int PRIMARY KEY NOT NULL,
--		Name nvarchar(100),
--		Population int,
--	);


--CREATE TABLE Cities
--	(
--		Id int PRIMARY KEY NOT NULL,
--		ConutryId INT FOREIGN KEY REFERENCES Countries(Id),
--		Name NVARCHAR(100),
--		Population INT
--	);

--INSERT INTO countries 
--	VALUES(1, 'Sweden', 10000000),
--		  (2, 'Denmark', 4000000),
--		  (3, 'Finland', 5000000),
--		  (5, 'Iceland', 400000);

--INSERT INTO countries VALUES (4,'Norway',5000000);

--INSERT INTO cities
--	VALUES
--		(1,1,'Gothenburg',600000),
--		(2,1,'Stockholm',1700000),
--		(3,2,'Kopenhagen',1400000),
--		(4,2,'Odense',200000),
--		(5,3,'Helsinki',1300000),
--		(6,3,'Espoo',300000),
--		(7,4,'Oslo',1000000),
--		(8,4,'Bergen',300000),
--		(9,5,'Reykavik',130000);

-- SKAPA EN VIEW:

--SELECT countries.name, cities.name
--FROM countries
--JOIN cities 
--ON countries.id = cities.conutryid;

-- ---------------------JUNCTIONS-------------

--CREATE TABLE AuthorTbl
--	(
--		Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
--		[First Name] NVARCHAR(20),
--		[Last Name] NVARCHAR(20),
--		[Birthday] DATETIME2
--	);
		

--CREATE TABLE PublisherTbl
--	(
--		Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
--		[Name] NVARCHAR(20),
--		[Head Office City] NVARCHAR(20),
--	);

--INSERT INTO AuthorTbl
--VALUES
--	('Zhiwar','Rashid','1988-10-10'),
--	('Astrid','Lindgren','1930-05-23'),
--	('Teju','Cole','1973-10-11'),
--	('George','Martin','1943-01-23');

--INSERT INTO PublisherTbl
--VALUES
--	('Nordsteds','Stockholm'),
--	('Duckey Books','Chicago');

--CREATE TABLE Publisher_AuthorJTbl
--	(
--		AuthorId INT NOT NULL,
--		PublisherId INT NOT NULL,
--		CONSTRAINT PK_Pub_AUT PRIMARY KEY (AuthorId, PublisherId),
--		CONSTRAINT FK_PublisherId_PublisherTbl FOREIGN KEY (PublisherId) REFERENCES PublisherTbl(Id),
--		CONSTRAINT FK_AuthorId_AuthorTbl FOREIGN KEY (AuthorId) REFERENCES AuthorTbl(Id)
--	);
	--(Constrainten går att lägga direkt efter kolumndeklarationen om man vill)

--INSERT INTO Publisher_AuthorJTbl (AuthorId, PublisherId) Values (1,1);
--INSERT INTO Publisher_AuthorJTbl (AuthorId, PublisherId) Values (2,1);
--INSERT INTO Publisher_AuthorJTbl (AuthorId, PublisherId) Values (2,2);
--INSERT INTO Publisher_AuthorJTbl (AuthorId, PublisherId) Values (3,1);
--INSERT INTO Publisher_AuthorJTbl (AuthorId, PublisherId) Values (4,1);
--INSERT INTO Publisher_AuthorJTbl (AuthorId, PublisherId) Values (4,2);

--SELECT *
--FROM PublisherTbl
--CROSS JOIN AuthorTbl; -> Vette tusen vilken nytta jag kommer ha av denna....

--SELECT [Name], [First Name]
--FROM PublisherTbl AS P
--JOIN Publisher_AuthorJTbl AS J ON P.Id = J.PublisherId
--JOIN AuthorTbl AS S ON S.Id = J.AuthorId;

---Aggregering----

--SELECT [Name], COUNT([First Name]) AS Authors
--FROM PublisherTbl AS P
--JOIN Publisher_AuthorJTbl AS J ON P.Id = J.PublisherId
--JOIN AuthorTbl AS A ON A.Id = J.AuthorId
--GROUP BY [Name];

--SELECT STRING_AGG([Name], '!') FROM PublisherTbl;