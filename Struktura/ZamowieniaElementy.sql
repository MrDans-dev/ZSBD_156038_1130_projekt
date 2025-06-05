USE [ZSBD_Ksiegarnia]
GO

/****** Object:  Table [dbo].[ZamowieniaElementy]    Script Date: 05.06.2025 21:06:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ZamowieniaElementy](
	[zae_id] [int] NOT NULL,
	[zae_idtyp] [int] NULL,
	[zae_lp] [int] NULL,
	[zae_ksiid] [int] NULL,
	[zae_ksiityp] [int] NULL,
	[zae_ilosc] [int] NULL,
	[zae_cena] [decimal](16, 2) NULL,
	[zae_magidtyp] [int] NULL,
	[zae_magid] [int] NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ZamowieniaElementy]  WITH CHECK ADD  CONSTRAINT [FK__Zamowieni__zae_k__56E8E7AB] FOREIGN KEY([zae_ksiid])
REFERENCES [dbo].[Ksiazka] ([ksi_id])
GO

ALTER TABLE [dbo].[ZamowieniaElementy] CHECK CONSTRAINT [FK__Zamowieni__zae_k__56E8E7AB]
GO

ALTER TABLE [dbo].[ZamowieniaElementy]  WITH CHECK ADD  CONSTRAINT [FK__Zamowieni__zae_m__58D1301D] FOREIGN KEY([zae_magid])
REFERENCES [dbo].[Magazyn] ([mag_id])
GO

ALTER TABLE [dbo].[ZamowieniaElementy] CHECK CONSTRAINT [FK__Zamowieni__zae_m__58D1301D]
GO


