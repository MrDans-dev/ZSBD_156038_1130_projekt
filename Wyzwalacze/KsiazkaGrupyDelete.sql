USE [ZSBD_Ksiegarnia]
GO
/****** Object:  Trigger [dbo].[KsiazkaGrupyDelete]    Script Date: 05.06.2025 21:10:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER TRIGGER [dbo].[KsiazkaGrupyDelete]
   ON  [dbo].[Ksiazka]
   AFTER DELETE
AS 
BEGIN
	SET NOCOUNT ON;
	DELETE kng FROM dbo.KsiazkiGrupy kng
    INNER JOIN deleted d ON kng.ksg_id = d.ksi_id and kng.ksg_idtyp = d.ksi_idtyp 
END
