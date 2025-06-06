USE [ZSBD_Ksiegarnia]
GO
/****** Object:  StoredProcedure [db_create].[Stanowisko]    Script Date: 05.06.2025 21:16:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [db_create].[Stanowisko]
AS
BEGIN
	INSERT INTO dbo.Stanowisko (sta_nazwa, sta_stawka_min, sta_stawka_max) VALUES
	('Pracownik magazynu', 22.00, 28.00),
	('Obsługa klienta (online)', 25.00, 35.00),
	('Specjalista ds. zamówień', 30.00, 42.00),
	('Administrator strony internetowej', 45.00, 60.00),
	('Grafik komputerowy', 40.00, 55.00),
	('Kierownik magazynu', 38.00, 50.00),
	('Specjalista ds. marketingu', 35.00, 48.00),
	('Programista (e-commerce)', 60.00, 90.00),
	('Analityk danych', 45.00, 70.00),
	('Koordynator ds. wysyłek', 32.00, 45.00);
END
