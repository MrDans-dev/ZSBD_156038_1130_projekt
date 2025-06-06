USE [ZSBD_Ksiegarnia]
GO
/****** Object:  StoredProcedure [db_create].[Adresy]    Script Date: 05.06.2025 21:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [db_create].[Adresy]
AS
BEGIN
	WITH adresy as (
	select NEWID() id,wyd_id obi_id,wyd_idtyp obi_idtyp,1 typ,'11-010' kod,concat('Miasto ',wyd_id) miasto,concat('Ulica ',wyd_id) ulica  from dbo.Wydawnictwo union all
	select NEWID() id,wyd_id,wyd_idtyp,2,'11-010',concat('Miasto ',wyd_id),concat('Ulica ',wyd_id)  from dbo.Wydawnictwo

	union all

	select NEWID() id,knt_id,knt_idtyp,1,'11-010',concat('Miasto ',knt_id),concat('Ulica ',knt_id)  from dbo.Klient union all
	select NEWID() id,knt_id,knt_idtyp,2,'11-010',concat('Miasto ',knt_id),concat('Ulica ',knt_id)  from dbo.Klient

	)

	insert into [dbo].[Adres] ([adr_obid],[adr_obidtyp],[adr_typ],[adr_kod_p],[adr_miasto],[adr_ulica])
	select obi_id,obi_idtyp,typ,kod,miasto,ulica from adresy where not exists(select top 1 [adr_obid] from dbo.Adres where adr_obid = obi_id and adr_obidtyp = obi_idtyp)
	order by id
END
