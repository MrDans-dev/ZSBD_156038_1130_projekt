USE [ZSBD_Ksiegarnia]
GO
/****** Object:  StoredProcedure [db_create].[Seria]    Script Date: 05.06.2025 21:16:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [db_create].[Seria]
	
AS
BEGIN

	SET NOCOUNT ON;

    INSERT INTO Seria(ser_nazwa)
    VALUES
    ('Harry Potter'),
    ('Władca Pierścieni');
END;
