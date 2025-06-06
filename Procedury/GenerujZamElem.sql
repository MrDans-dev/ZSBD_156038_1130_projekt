USE [ZSBD_Ksiegarnia]
GO
/****** Object:  StoredProcedure [dbo].[GenerujZamElem]    Script Date: 05.06.2025 21:17:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[GenerujZamElem]
	@elem_min int, @elem_max int
AS
BEGIN
SET NOCOUNT ON;

declare @ksi_min int, @ksi_max int
declare @elem_ilosc int
declare @zam_id int , @zam_idtyp int , @mag_id int
declare @ksi_rand int

select @ksi_min = min(ksi_id),@ksi_max = max(ksi_id) from dbo.Ksiazka


while (SELECT count(zam_id) FROM dbo.ZamowieniaNaglowek 
where not exists (select top 1 * from dbo.ZamowieniaElementy where zae_id = zam_id and zae_idtyp = zam_idtyp)) > 0
begin
DECLARE zamnag CURSOR FOR
SELECT zam_id,zam_idtyp,(select top 1 mag_id from dbo.Magazyn where concat('Z',mag_kod) = zam_seria) mag_id FROM dbo.ZamowieniaNaglowek 
where not exists (select top 1 * from dbo.ZamowieniaElementy where zae_id = zam_id and zae_idtyp = zam_idtyp)

open zamnag

FETCH NEXT FROM zamnag INTO @zam_id, @zam_idtyp,@mag_id

WHILE @@FETCH_STATUS = 0
BEGIN

select @elem_ilosc = FLOOR(RAND() * (@elem_max - @elem_min + 1)) + @elem_min

create table #elem (zae_id int, zae_idtyp int, zae_lp int, zae_ksiid int, zae_ksiidtyp int, zae_ilosc int, zae_cena decimal(16,2), zae_magidtyp int, zae_magid int)
declare @zae_lp int = isnull((select count(zae_lp) from #elem),0)+1

while @zae_lp <= @elem_ilosc
begin
	select @ksi_rand = FLOOR(RAND() * (@ksi_max - @ksi_min + 1)) + @ksi_min
	if exists(select 1 from dbo.Ksiazka with(nolock) where ksi_id = @ksi_rand) 
	and not exists (select top 1 zae_ksiid from #elem where zae_ksiid = @ksi_rand)
	begin

	insert into #elem
	select @zam_id,@zam_idtyp,@zae_lp,@ksi_rand, 45, case when @zam_idtyp = 1 then cast(FLOOR(rand()* (100 - 50 + 50))as int) else cast(FLOOR(rand()* (10 - 2 + 1))as int) end ,(select top 1 ksi_cena from dbo.Ksiazka with(nolock) where ksi_id = @ksi_rand) + cast(FLOOR(RAND() * 6)as int) , 21 ,@mag_id
	set @zae_lp = @zae_lp + 1
	end

end
	BEGIN TRY
		insert into [dbo].[ZamowieniaElementy] 
		select zae_id, zae_idtyp, zae_lp, zae_ksiid, zae_ksiidtyp, zae_ilosc, zae_cena, zae_magidtyp, zae_magid from #elem
	END TRY
	BEGIN CATCH
		--select zae_id, zae_idtyp, zae_lp, zae_ksiid, zae_ksiidtyp, zae_ilosc, zae_cena, zae_magidtyp, zae_magid from #elem
		insert into dbo.zamlog select top 1 zae_id,zae_idtyp,zae_lp,zae_ksiid,zae_ksiidtyp
				, (isnull((select stn_ilosc from dbo.Stan where stn_ksiid = zae_ksiid and  stn_ksiidtyp = zae_ksiidtyp and stn_magid = zae_magid and stn_magidtyp =  zae_magidtyp),0) - zae_ilosc) * -1
				,zae_magid,zae_magidtyp, ERROR_MESSAGE(),GETDATE() from #elem ORDER BY 3 desc;
	END CATCH
drop table #elem

FETCH NEXT FROM zamnag INTO @zam_id, @zam_idtyp,@mag_id
END

close zamnag
deallocate zamnag
end
END


