USE [ZSBD_Ksiegarnia_DW]
GO

/****** Object:  Table [dw].[Dokumenty]    Script Date: 05.06.2025 21:19:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[Dokumenty](
	[Dokument_id] [int] NULL,
	[Dokument_typ] [int] NULL,
	[Dokument_numer] [varchar](100) NULL,
	[Dokument_dataWystawienia] [datetime] NULL,
	[Dokument_dataSprzedazy] [datetime] NULL,
	[Dokument_KlientGlowny_id] [int] NULL,
	[Dokument_klientGlowny_Akronim] [varchar](30) NULL,
	[Dokument_KlientDocelowy_id] [int] NULL,
	[Dokument_klientDocelowy_Akronim] [varchar](30) NULL,
	[Dokument_KlientPlatnik_id] [int] NULL,
	[Dokument_klientPlatnik_Akronim] [varchar](30) NULL,
	[Dokument_pracownik] [varchar](200) NULL,
	[Dokument_seria] [varchar](5) NULL
) ON [PRIMARY]
GO


