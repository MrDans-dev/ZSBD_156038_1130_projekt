USE [ZSBD_Ksiegarnia_DW]
GO

/****** Object:  Table [dw].[Ksiazki]    Script Date: 05.06.2025 21:20:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[Ksiazki](
	[Ksiazka_id] [int] NULL,
	[Ksiazka_idtyp] [int] NULL,
	[Ksiazka_tytul] [varchar](500) NULL,
	[Ksiazka_typ_okladki] [varchar](50) NULL,
	[Ksiazka_jezyk_wydania] [varchar](100) NULL,
	[Ksiazka_jezyk_orginalu] [varchar](100) NULL,
	[Ksiazka_rok_wydania] [int] NULL,
	[Ksiazka_ilosc_stron] [int] NULL,
	[Ksiazka_wydawnictwoNazwa] [varchar](100) NULL,
	[Ksiazka_wydawnictwoNIP] [varchar](15) NULL,
	[Ksiazka_wydawnictwoAdres] [varchar](200) NULL,
	[Ksiazka_numer_wydania] [int] NULL,
	[Ksiazka_cena] [decimal](16, 2) NULL,
	[Ksiazka_isbn] [varchar](13) NULL,
	[Ksiazka_autor] [varchar](500) NULL,
	[Ksiazka_opis] [varchar](500) NULL,
	[Ksiazka_zajawka] [varchar](100) NULL,
	[Ksiazka_tlumacz] [varchar](500) NULL,
	[Ksiazka_grupaDom] [varchar](500) NULL,
	[Ksiazka_avgOcena] [decimal](4, 2) NULL
) ON [PRIMARY]
GO


