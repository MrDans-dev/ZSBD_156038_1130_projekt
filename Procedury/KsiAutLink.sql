USE [ZSBD_Ksiegarnia]
GO
/****** Object:  StoredProcedure [db_create].[KsiAutLink]    Script Date: 05.06.2025 21:14:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [db_create].[KsiAutLink]
AS
BEGIN
	SET NOCOUNT ON;
	declare @ksi_id int
	declare @ksi_idtyp int
	declare @aut_max int = (select max(aut_id) from dbo.Autor)
	declare @aut_min int = (select min(aut_id) from dbo.Autor)
	declare @rand int

	DECLARE ksiaut CURSOR FOR SELECT k.ksi_id,k.ksi_idtyp FROM [ZSBD_Ksiegarnia].[dbo].[Ksiazka] k
	left join dbo.KsiazkaAutorLink ks on k.ksi_id = ks.ksi_id
	where  ks.aut_id is null
	
	OPEN ksiaut
	FETCH NEXT FROM ksiaut into @ksi_id,@ksi_idtyp;

	while @@FETCH_STATUS = 0
	begin
		select @rand = FLOOR(RAND() * (@aut_max - @aut_min + 1)) + @aut_min 
		if exists(select top 1 aut_id from dbo.Autor where aut_id = @rand)
		begin
			insert into [dbo].[KsiazkaAutorLink] (ksi_id,aut_id) values (@ksi_id, @rand)
			FETCH NEXT FROM ksiaut into @ksi_id,@ksi_idtyp;
		end
	end

close ksiaut
deallocate ksiaut
END
