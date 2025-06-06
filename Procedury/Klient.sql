USE [ZSBD_Ksiegarnia]
GO
/****** Object:  StoredProcedure [db_create].[Klient]    Script Date: 05.06.2025 21:14:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [db_create].[Klient]
	@start int , @break int
AS
BEGIN
DECLARE @maxid int
set @maxid = (select isnull(MAX(knt_id),1) from [dbo].[Klient])

WHILE @start <= @break
BEGIN
	INSERT INTO [dbo].[Klient] ([knt_idtyp],[knt_knpid],[knt_nazwa],[knt_akronim],[knt_nip])
	SELECT 11,0,CONCAT('Pełna nazwa Klienta ',@maxid+@start),concat('Klient ',@maxid+@start),case when CAST(RAND() * 100 AS int) % 2 = 0 then null else LEFT(CAST(CAST(RAND() * 10000000000 AS BIGINT) AS VARCHAR(10)), 10) end

	set @start = @start + 1
END

UPDATE [ZSBD_Ksiegarnia].[DBO].[Klient] SET knt_knpid = knt_id WHERE knt_knpid = 0;

END