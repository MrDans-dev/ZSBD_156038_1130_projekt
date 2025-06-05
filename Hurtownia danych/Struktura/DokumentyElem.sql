USE [ZSBD_Ksiegarnia_DW]
GO

/****** Object:  Table [dw].[DokumentyElem]    Script Date: 05.06.2025 21:20:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[DokumentyElem](
	[Elem_id] [int] NULL,
	[Elem_typ] [int] NULL,
	[Elem_lp] [int] NULL,
	[Elem_ksiid] [int] NULL,
	[Elem_KsiazkaTytul] [varchar](500) NULL,
	[Elem_ilosc] [int] NULL,
	[Elem_Cena] [decimal](16, 2) NULL,
	[Elem_magid] [int] NULL,
	[Elem_magidtyp] [int] NULL,
	[Elem_Magazyn] [varchar](30) NULL,
	[Elem_Wartosc] [decimal](16, 2) NULL
) ON [PRIMARY]
GO


