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
--"F�rnamn" nvarchar(max) not null,
--Efternamn nvarchar(max) not null,
--"�lder" int,
--Hemort nvarchar(max) not null);

--INSERT INTO KlassenTbl
--VALUES 
--(1, 'Joseph', 'Rashid-Maalouf', 30, 'G�teborg'),
--(2, 'Tyr', 'Hvidfeldt', 37, 'G�teborg'),
--(3, 'Gabriel', 'Raimondo', 31, 'Sk�vde'),
--(4,'Mikael', 'Bj�rn�nger', 35, 'G�teborg'),
--(5, 'Jesper', 'Whedin', 29, 'Kungsbacka');

--SELECT *
--FROM KlassenTbl;