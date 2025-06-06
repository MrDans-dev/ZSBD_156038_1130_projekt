USE [ZSBD_Ksiegarnia]
GO
/****** Object:  StoredProcedure [dbo].[DodajKlientGrupy]    Script Date: 05.06.2025 21:17:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[DodajKlientGrupy] 
 @kng_id int,
 @kng_idtyp int,
 @kng_groid int,
 @kng_groidtyp int,
 @nazwa varchar(100),
 @dom int,
 @op int -- 0 - dodawanie klienta do grupy , 1 - dodawanie grupy do grupy
AS
BEGIN

if @op = 1
begin
	set @kng_id = (select isnull(max(kng_id)+1,1) from dbo.KlientGrupy with(nolock) where kng_idtyp = -11)
	set @kng_idtyp = -11
end

if @op = 0 and exists (select top 1 kng_id from dbo.KlientGrupy where kng_id = @kng_id and kng_idtyp = @kng_idtyp and kng_groid = @kng_groid and kng_groidtyp = @kng_groidtyp)
begin
	raiserror ('Klient juz istnieje w tej grupie',16,1)
end

if @op= 0 and @kng_idtyp = 11 and @kng_groidtyp = 11
begin
	raiserror ('Nie mozna powiązac klienta do klienta',16,1)
end

if @op = 1 and @kng_idtyp = -11 and @kng_groidtyp = 11
begin
	raiserror ('Nie mozna powiązac grupy do klienta',16,1)
end

if @op = 0 and @kng_idtyp = 11 and not exists (select top 1 knt_akronim from dbo.Klient with(nolock) where knt_id = @kng_id and knt_idtyp = @kng_idtyp)
begin
	raiserror ('Klient nie istnieje',16,1)
end

if @op = 0 and @kng_idtyp = 11 and @kng_groidtyp = -11
begin
	if not exists (select top 1 * from dbo.KlientGrupy with(nolock) where kng_id = @kng_groid and kng_idtyp = @kng_groidtyp)
	begin
		raiserror ('Grupa nie istnieje',16,1)
	end
	else
	begin
		insert into dbo.KlientGrupy ([kng_id],[kng_idtyp],[kng_groid],[kng_groidtyp],[kng_nazwa],[kng_dom])
		values (@kng_id,@kng_idtyp,@kng_groid,@kng_groidtyp,(select top 1 knt_akronim from dbo.Klient with(nolock) where knt_id = @kng_id and knt_idtyp = @kng_idtyp),@dom)
	end
end

if @op = 1 and @kng_groidtyp = -11 and @kng_idtyp = -11
begin
	if not exists (select top 1 * from dbo.KlientGrupy with(nolock) where kng_id = @kng_groid and kng_idtyp = @kng_groidtyp)
	begin
		raiserror ('Grupa nie istnieje',16,1)
	end
	else
	begin
		insert into dbo.KlientGrupy ([kng_id],[kng_idtyp],[kng_groid],[kng_groidtyp],[kng_nazwa],[kng_dom])
		values (@kng_id,@kng_idtyp,@kng_groid,@kng_groidtyp,@nazwa,0)
	end
end

if @op = 1 and @kng_idtyp = -11 and @kng_groidtyp = 0 and @kng_groid = 0
begin
	insert into dbo.KlientGrupy ([kng_id],[kng_idtyp],[kng_groid],[kng_groidtyp],[kng_nazwa],[kng_dom])
	values (@kng_id,@kng_idtyp,@kng_groid,@kng_groidtyp,@nazwa,0)
end

if @op = 0 and @kng_idtyp = 11 and @kng_groidtyp = 0 and @kng_groid = 0
begin
	insert into dbo.KlientGrupy ([kng_id],[kng_idtyp],[kng_groid],[kng_groidtyp],[kng_nazwa],[kng_dom])
	values (@kng_id,@kng_idtyp,@kng_groid,@kng_groidtyp,(select top 1 knt_akronim from dbo.Klient with(nolock) where knt_id = @kng_id and knt_idtyp = @kng_idtyp),@dom)
end
END
