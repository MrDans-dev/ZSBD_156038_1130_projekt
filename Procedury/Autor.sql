USE [ZSBD_Ksiegarnia]
GO
/****** Object:  StoredProcedure [db_create].[Autor]    Script Date: 05.06.2025 21:14:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [db_create].[Autor]
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO [dbo].[Autor] (aut_imie, aut_nazwisko, aut_dataurodzenia) VALUES
	('Joanne', 'Rowling', '1965-07-31'),
	('Stephen', 'King', '1947-09-21'),
	('Olga', 'Tokarczuk', '1962-01-29'),
	('George', 'Orwell', '1903-06-25'),
	('Isaac', 'Asimov', '1920-01-02'),
	('Haruki', 'Murakami', '1949-01-12'),
	('Andrzej', 'Sapkowski', '1948-06-21'),
	('Agatha', 'Christie', '1890-09-15'),
	('J.R.R.', 'Tolkien', '1892-01-03'),
	('Margaret', 'Atwood', '1939-11-18');
END
