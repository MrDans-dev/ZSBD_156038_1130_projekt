USE [ZSBD_Ksiegarnia]
GO

/****** Object:  Table [dbo].[Stan]    Script Date: 05.06.2025 21:04:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Stan](
	[stn_ksiid] [int] NOT NULL,
	[stn_ksiidtyp] [int] NULL,
	[stn_magid] [int] NULL,
	[stn_magidtyp] [int] NULL,
	[stn_ilosc] [int] NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Stan]  WITH CHECK ADD  CONSTRAINT [FK__Stan__stn_ksiid__489AC854] FOREIGN KEY([stn_ksiid])
REFERENCES [dbo].[Ksiazka] ([ksi_id])
GO

ALTER TABLE [dbo].[Stan] CHECK CONSTRAINT [FK__Stan__stn_ksiid__489AC854]
GO

ALTER TABLE [dbo].[Stan]  WITH CHECK ADD  CONSTRAINT [FK__Stan__stn_magid__4A8310C6] FOREIGN KEY([stn_magid])
REFERENCES [dbo].[Magazyn] ([mag_id])
GO

ALTER TABLE [dbo].[Stan] CHECK CONSTRAINT [FK__Stan__stn_magid__4A8310C6]
GO


