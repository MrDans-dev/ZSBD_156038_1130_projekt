USE [ZSBD_Ksiegarnia]
GO
/****** Object:  StoredProcedure [db_create].[ListaPlac]    Script Date: 05.06.2025 21:15:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [db_create].[ListaPlac]
AS
BEGIN
	SET NOCOUNT ON;

		INSERT INTO ListaPlac (lp_prcid, lp_kwota, lp_data_przelewu, lp_premia)
		SELECT 
			p.prc_id,
			CAST(ROUND((s.sta_stawka_min + (RAND(CHECKSUM(NEWID())) * (s.sta_stawka_max - s.sta_stawka_min))) * 160, 2) AS DECIMAL(16,2)) AS lp_kwota,
			CAST(GETDATE() AS DATETIME) AS lp_data_przelewu,
			CAST(RAND(CHECKSUM(NEWID())) * 2 AS INT) AS lp_premia
		FROM Pracownik p
		JOIN Stanowisko s ON p.prc_stanowisko = s.sta_id
		WHERE p.prc_id BETWEEN 1 AND 20;

END
