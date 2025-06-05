USE [ZSBD_Ksiegarnia]
GO

/****** Object:  Table [dbo].[Sprzedaz_Rok_Biezacy]    Script Date: 05.06.2025 21:04:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Sprzedaz_Rok_Biezacy]
(
	[ID] [int] NOT NULL,
	[Miesiac] [int] NULL,
	[Rok] [int] NULL,
	[Kw] [int] NULL,
	[DokumentNumer] [varchar](30) COLLATE Polish_CI_AS NOT NULL,
	[Klient_Akronim] [varchar](30) COLLATE Polish_CI_AS NULL,
	[Klient_Nazwa] [varchar](100) COLLATE Polish_CI_AS NULL,
	[Klient_NIP] [varchar](15) COLLATE Polish_CI_AS NULL,
	[Klient_Miasto_Wys] [varchar](50) COLLATE Polish_CI_AS NULL,
	[Klient_KodP_Wys] [varchar](10) COLLATE Polish_CI_AS NULL,
	[Klient_Adres_Wys] [varchar](200) COLLATE Polish_CI_AS NULL,
	[WartoscNetto] [decimal](16, 2) NULL,
	[WartoscBrutto] [decimal](16, 2) NULL,
	[Ilosc] [int] NULL,
	[Pracownik] [varchar](150) COLLATE Polish_CI_AS NULL,

 PRIMARY KEY NONCLUSTERED HASH 
(
	[ID]
)WITH ( BUCKET_COUNT = 4096)
)WITH ( MEMORY_OPTIMIZED = ON , DURABILITY = SCHEMA_ONLY )
GO


