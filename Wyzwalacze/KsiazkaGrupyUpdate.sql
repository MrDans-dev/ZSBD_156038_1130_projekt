USE [ZSBD_Ksiegarnia]
GO
/****** Object:  Trigger [dbo].[KsiazkaGrupyUpdate]    Script Date: 05.06.2025 21:11:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER TRIGGER [dbo].[KsiazkaGrupyUpdate]
   ON  [dbo].[Ksiazka]
   AFTER UPDATE
AS 
BEGIN
	SET NOCOUNT ON;
	UPDATE kng
    SET ksg_nazwa = i.ksi_tytul
    FROM dbo.KsiazkiGrupy kng
    INNER JOIN inserted i ON kng.ksg_id = i.ksi_id and kng.ksg_idtyp = i.ksi_idtyp 
    INNER JOIN deleted d ON kng.ksg_id = d.ksi_id and kng.ksg_idtyp = d.ksi_idtyp 
    WHERE ksg_nazwa <> i.ksi_tytul
END
