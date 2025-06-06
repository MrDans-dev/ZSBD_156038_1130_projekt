USE [ZSBD_Ksiegarnia]
GO
/****** Object:  Trigger [dbo].[KlientGrupyUpdate]    Script Date: 05.06.2025 21:11:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER TRIGGER [dbo].[KlientGrupyUpdate]
   ON  [dbo].[Klient]
   AFTER UPDATE
AS 
BEGIN
	SET NOCOUNT ON;
	UPDATE kng
    SET kng_nazwa = i.knt_akronim
    FROM dbo.KlientGrupy kng
    INNER JOIN inserted i ON kng.kng_id = i.knt_id and kng.kng_idtyp = i.knt_idtyp 
    INNER JOIN deleted d ON kng.kng_id = d.knt_id and kng.kng_idtyp = d.knt_idtyp 
    WHERE kng_nazwa <> i.knt_akronim
END
