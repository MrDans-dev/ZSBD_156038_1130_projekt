USE [ZSBD_Ksiegarnia]
GO

/****** Object:  Table [dbo].[KsiazkaSeriaLink]    Script Date: 05.06.2025 21:01:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[KsiazkaSeriaLink](
	[ksi_id] [int] NULL,
	[ser_id] [int] NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[KsiazkaSeriaLink]  WITH CHECK ADD  CONSTRAINT [FK__KsiazkaSe__ksi_i__43D61337] FOREIGN KEY([ksi_id])
REFERENCES [dbo].[Ksiazka] ([ksi_id])
GO

ALTER TABLE [dbo].[KsiazkaSeriaLink] CHECK CONSTRAINT [FK__KsiazkaSe__ksi_i__43D61337]
GO

ALTER TABLE [dbo].[KsiazkaSeriaLink]  WITH CHECK ADD FOREIGN KEY([ser_id])
REFERENCES [dbo].[Seria] ([ser_id])
GO


