--CREATE DATABASE DjurDB;

--USE DjurDB;

--CREATE TABLE DjurTbl(
--Id int Primary Key,
--Namn nvarchar(max) not null);

--INSERT INTO DjurTbl
--VALUES (1, 'Hamster'),
--		(2, 'Hund'),
--		(3, 'Katt'),
--		(4, 'Kanin');

--SELECT *
--FROM DjurTbl;

--SELECT *
--FROM DjurTbl
--WHERE Namn LIKE '%a%';

--USE master;
--DROP DATABASE DjurDB;

--CREATE DATABASE KlassenDB;


--USE KlassenDB;

--CREATE TABLE KlassenTbl(
--id int PRIMARY KEY, 
--"Förnamn" nvarchar(max) not null,
--Efternamn nvarchar(max) not null,
--"Ålder" int,
--Hemort nvarchar(max) not null);

--INSERT INTO KlassenTbl
--VALUES 
--(1, 'Joseph', 'Rashid-Maalouf', 30, 'Göteborg'),
--(2, 'Tyr', 'Hvidfeldt', 37, 'Göteborg'),
--(3, 'Gabriel', 'Raimondo', 31, 'Skövde'),
--(4,'Mikael', 'Björnänger', 35, 'Göteborg'),
--(5, 'Jesper', 'Whedin', 29, 'Kungsbacka');

--SELECT *
--FROM KlassenTbl;