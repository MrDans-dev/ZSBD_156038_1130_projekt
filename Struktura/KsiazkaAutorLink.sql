USE [ZSBD_Ksiegarnia]
GO

/****** Object:  Table [dbo].[KsiazkaAutorLink]    Script Date: 05.06.2025 21:00:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[KsiazkaAutorLink](
	[ksi_id] [int] NULL,
	[aut_id] [int] NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[KsiazkaAutorLink]  WITH CHECK ADD FOREIGN KEY([aut_id])
REFERENCES [dbo].[Autor] ([aut_id])
GO

ALTER TABLE [dbo].[KsiazkaAutorLink]  WITH CHECK ADD FOREIGN KEY([ksi_id])
REFERENCES [dbo].[Ksiazka] ([ksi_id])
GO


