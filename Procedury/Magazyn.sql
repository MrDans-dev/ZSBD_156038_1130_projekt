USE [ZSBD_Ksiegarnia]
GO
/****** Object:  StoredProcedure [db_create].[Magazyn]    Script Date: 05.06.2025 21:15:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [db_create].[Magazyn]
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO [dbo].[Magazyn] (mag_idtyp, mag_nazwa, mag_kod) VALUES
	(21, 'Magazyn Centralny A', 1001),
	(21, 'Magazyn Centralny B', 1002),
	(21, 'Magazyn Rezerwowy', 1003),
	(21, 'Magazyn Online', 1004),
	(21, 'Magazyn Książek', 1005),
	(21, 'Magazyn Promocji', 1006),
	(21, 'Magazyn Zwrotów', 1007),
	(21, 'Magazyn Nowości', 1008),
	(21, 'Magazyn Sezonowy', 1009),
	(21, 'Magazyn Techniczny', 1010);
END
