USE [ZSBD_Ksiegarnia]
GO
/****** Object:  StoredProcedure [db_create].[Tlumacz]    Script Date: 05.06.2025 21:16:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [db_create].[Tlumacz]
AS
BEGIN
	INSERT INTO [dbo].[Tlumacz] (tra_imie, tra_nazwisko) VALUES
	('Anna', 'Kowalczyk'),
	('Tomasz', 'Zieliński'),
	('Magdalena', 'Nowicka'),
	('Krzysztof', 'Lewandowski'),
	('Elżbieta', 'Wiśniewska'),
	('Piotr', 'Wójcik'),
	('Karolina', 'Szymańska'),
	('Michał', 'Kamiński'),
	('Joanna', 'Dąbrowska'),
	('Andrzej', 'Baran');
END
