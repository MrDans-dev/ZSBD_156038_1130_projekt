USE [ZSBD_Ksiegarnia]
GO
/****** Object:  Trigger [dbo].[KlientGrupyDelete]    Script Date: 05.06.2025 21:11:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER TRIGGER [dbo].[KlientGrupyDelete]
   ON  [dbo].[Klient]
   AFTER DELETE
AS 
BEGIN
	SET NOCOUNT ON;
	DELETE kng FROM dbo.[KlientGrupy] kng
    INNER JOIN deleted d ON kng.kng_id = d.knt_id and kng.kng_idtyp = d.knt_idtyp 
END
