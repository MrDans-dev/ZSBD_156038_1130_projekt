USE [ZSBD_Ksiegarnia]
GO
/****** Object:  StoredProcedure [dbo].[DodajKsiazkiGrupy]    Script Date: 05.06.2025 21:17:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[DodajKsiazkiGrupy] 
 @ksg_id int,
 @ksg_idtyp int,
 @ksg_groid int,
 @ksg_groidtyp int,
 @nazwa varchar(100),
 @dom int,
 @op int -- 0 - dodawanie Ksiazkaa do grupy , 1 - dodawanie grupy do grupy
AS
BEGIN

if @op = 1
begin
	set @ksg_id = (select isnull(max(ksg_id)+1,1) from dbo.KsiazkiGrupy with(nolock) where ksg_idtyp = -45)
	set @ksg_idtyp = -45
end

if @op = 0 and exists (select top 1 ksg_id from dbo.KsiazkiGrupy where ksg_id = @ksg_id and ksg_idtyp = @ksg_idtyp and ksg_groid = @ksg_groid and ksg_groidtyp = @ksg_groidtyp)
begin
	RAISERROR('Ksiazka juz istnieje w tej grupie', 16, 1);
end

if @op= 0 and @ksg_idtyp = 45 and @ksg_groidtyp = 45
begin
	raiserror ('Nie mozna powiązac ksiazki do ksiazki',16,1)
end

if @op = 1 and @ksg_idtyp = -45 and @ksg_groidtyp = 45
begin
	raiserror ('Nie mozna powiązac grupy do ksiazki',16,1)
end

if @op = 0 and @ksg_idtyp = 45 and not exists (select top 1 ksi_tytul from dbo.Ksiazka with(nolock) where ksi_id = @ksg_id and ksi_idtyp = @ksg_idtyp)
begin
	raiserror ('Ksiażka nie istnieje',16,1)
end

if @op = 0 and @ksg_idtyp = 45 and @ksg_groidtyp = -45
begin
	if not exists (select top 1 * from dbo.KsiazkiGrupy with(nolock) where ksg_id = @ksg_groid and ksg_idtyp = @ksg_groidtyp)
	begin
		raiserror ('Grupa nie istnieje',16,1)
	end
	else
	begin
		insert into dbo.KsiazkiGrupy ([ksg_id],[ksg_idtyp],[ksg_groid],[ksg_groidtyp],[ksg_nazwa],[ksg_dom])
		values (@ksg_id,@ksg_idtyp,@ksg_groid,@ksg_groidtyp,(select top 1 ksi_tytul from dbo.Ksiazka with(nolock) where ksi_id = @ksg_id and ksi_idtyp = @ksg_idtyp),@dom)
	end
end

if @op = 1 and @ksg_groidtyp = -45 and @ksg_idtyp = -45
begin
	if not exists (select top 1 * from dbo.KsiazkiGrupy with(nolock) where ksg_id = @ksg_groid and ksg_idtyp = @ksg_groidtyp)
	begin
		raiserror ('Grupa nie istnieje',16,1)
	end
	else
	begin
		insert into dbo.KsiazkiGrupy ([ksg_id],[ksg_idtyp],[ksg_groid],[ksg_groidtyp],[ksg_nazwa],[ksg_dom])
		values (@ksg_id,@ksg_idtyp,@ksg_groid,@ksg_groidtyp,@nazwa,0)
	end
end

if @op = 1 and @ksg_idtyp = -45 and @ksg_groidtyp = 0 and @ksg_groid = 0
begin
	insert into dbo.KsiazkiGrupy ([ksg_id],[ksg_idtyp],[ksg_groid],[ksg_groidtyp],[ksg_nazwa],[ksg_dom])
	values (@ksg_id,@ksg_idtyp,@ksg_groid,@ksg_groidtyp,@nazwa,0)
end

if @op = 0 and @ksg_idtyp = 45 and @ksg_groidtyp = 0 and @ksg_groid = 0
begin
	insert into dbo.KsiazkiGrupy ([ksg_id],[ksg_idtyp],[ksg_groid],[ksg_groidtyp],[ksg_nazwa],[ksg_dom])
	values (@ksg_id,@ksg_idtyp,@ksg_groid,@ksg_groidtyp,(select top 1 ksi_tytul from dbo.Ksiazka with(nolock) where ksi_id = @ksg_id and ksi_idtyp = @ksg_idtyp),@dom)
end
END
