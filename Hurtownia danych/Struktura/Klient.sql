USE [ZSBD_Ksiegarnia_DW]
GO

/****** Object:  Table [dw].[Klient]    Script Date: 05.06.2025 21:20:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[Klient](
	[Klient_id] [int] NULL,
	[Klient_idtyp] [int] NULL,
	[Klient_Akronim] [varchar](30) NULL,
	[Klient_Nazwa] [varchar](100) NULL,
	[Klient_Platnik_id] [int] NULL,
	[Klient_Platnik_Akronim] [varchar](30) NULL,
	[Klient_NIP] [varchar](15) NULL,
	[Klient_KodP] [varchar](10) NULL,
	[Klient_Miasto] [varchar](50) NULL,
	[Klient_Adres] [varchar](200) NULL,
	[Klient_KodP_Wys] [varchar](10) NULL,
	[Klient_Miasto_Wys] [varchar](50) NULL,
	[Klient_Adres_Wys] [varchar](200) NULL,
	[Klient_GrupaDom] [varchar](500) NULL,
	[Knt_Rodzaj] [varchar](30) NULL
) ON [PRIMARY]
GO


