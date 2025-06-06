USE [ZSBD_Ksiegarnia]
GO
/****** Object:  StoredProcedure [dbo].[GenerujZamNag]    Script Date: 05.06.2025 21:17:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[GenerujZamNag] 
		@ilosc int,@op int = 0,@dataod date, @datado date -- op 0 - rand 1 - typ = 2
AS
BEGIN
SET NOCOUNT ON;
  DECLARE @knt_min int, @knt_max int
  DECLARE @prc_min int, @prc_max int
  DECLARE @mag_min int, @mag_max int
  declare @ksi_min int, @ksi_max int
  DECLARE @knt_rand int, @prc_rand int, @mag_rand int, @ksi_rand int
  DECLARE @zakres_dni INT;
  DECLARE @losowy_dzien INT;
  DECLARE @data_wystawienia DATE;
  DECLARE @data_realizacji DATE;

  select @knt_min = min(knt_id),@knt_max = max(knt_id) from dbo.Klient
  select @prc_min = min(prc_id),@prc_max = max(prc_id) from dbo.Pracownik
  select @mag_min = min(mag_id),@mag_max = max(mag_id) from dbo.Magazyn

  SET @zakres_dni = DATEDIFF(DAY, @dataod, @datado);

while @ilosc > 0
begin
	select @knt_rand = FLOOR(RAND() * (@knt_max - @knt_min + 1)) + @knt_min
	select @prc_rand = FLOOR(RAND() * (@prc_max - @prc_min + 1)) + @prc_min
	select @mag_rand = FLOOR(RAND() * (@mag_max - @mag_min + 1)) + @mag_min

	SET @losowy_dzien = FLOOR(RAND() * (@zakres_dni + 1));
    SET @data_wystawienia = DATEADD(DAY, @losowy_dzien, @dataod);
    SET @data_realizacji = DATEADD(DAY, 3, @data_wystawienia);
	

	if exists(select 1 from dbo.Pracownik with(nolock) where prc_id = @prc_rand) 
	and exists(select 1 from dbo.Klient with(nolock) where knt_id = @knt_rand) 
	and exists(select 1 from dbo.Magazyn with(nolock) where mag_id = @mag_rand)
	begin
		insert into dbo.ZamowieniaNaglowek ([zam_idtyp],[zam_kntid],[zam_knttypid],[zam_kndid],[zam_kndtypid],[zam_knpid] , [zam_knptypid],[zam_prc_utw],[zam_seria],[zam_numer],[zam_data_w],[zam_data_s] )
		select case when @op = 0 then FLOOR(RAND() * (2 - 1 + 1)) + 1 else 1 end, @knt_rand , 11,@knt_rand , 11, (select top 1 knt_knpid from dbo.Klient with(nolock) where knt_id = @knt_rand), 11, @prc_rand,
		concat('Z',(select top 1 mag_kod from dbo.Magazyn with(nolock) where mag_id = @mag_rand)),
		ISNULL((SELECT MAX(zam_numer) + 1 FROM ZamowieniaNaglowek WITH (NOLOCK) 
                        WHERE YEAR(zam_data_s) = YEAR(@data_wystawienia)
                          AND MONTH(zam_data_s) = MONTH(@data_wystawienia)), 1),@data_wystawienia,@data_realizacji;

		set @ilosc = @ilosc - 1
	end
end
END
