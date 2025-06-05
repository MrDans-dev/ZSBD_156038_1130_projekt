USE [ZSBD_Ksiegarnia]
GO

/****** Object:  Table [dbo].[KsiazkaOpis]    Script Date: 05.06.2025 21:01:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[KsiazkaOpis](
	[kso_ksiid] [int] NULL,
	[kso_ksiidtyp] [int] NULL,
	[kso_zajawka] [varchar](100) NULL,
	[kso_opis] [varchar](500) NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[KsiazkaOpis]  WITH CHECK ADD  CONSTRAINT [FK__KsiazkaOp__kso_k__3F115E1A] FOREIGN KEY([kso_ksiid])
REFERENCES [dbo].[Ksiazka] ([ksi_id])
GO

ALTER TABLE [dbo].[KsiazkaOpis] CHECK CONSTRAINT [FK__KsiazkaOp__kso_k__3F115E1A]
GO


