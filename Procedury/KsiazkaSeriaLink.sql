USE [ZSBD_Ksiegarnia]
GO
/****** Object:  StoredProcedure [db_create].[KsiazkaSeriaLink]    Script Date: 05.06.2025 21:15:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [db_create].[KsiazkaSeriaLink]
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO KsiazkaSeriaLink (ksi_id, ser_id)
VALUES (7, 1), (74, 1), (75, 1), (76, 1), (77, 1), (86, 2), (87, 2), (88, 2);
END
