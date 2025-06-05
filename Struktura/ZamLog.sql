USE [ZSBD_Ksiegarnia]
GO

/****** Object:  Table [dbo].[ZamLog]    Script Date: 05.06.2025 21:06:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ZamLog](
	[zal_id] [int] NULL,
	[zal_idtyp] [int] NULL,
	[zal_lp] [int] NULL,
	[zal_ksiid] [int] NULL,
	[zal_ksiidtyp] [int] NULL,
	[zal_ilosc] [int] NULL,
	[zal_magid] [int] NULL,
	[zal_magidtyp] [int] NULL,
	[zal_komunikat] [varchar](300) NULL,
	[zal_datazdarzenia] [datetime] NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ZamLog] ADD  DEFAULT (getdate()) FOR [zal_datazdarzenia]
GO


