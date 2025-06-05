USE [ZSBD_Ksiegarnia_DW]
GO

/****** Object:  Table [dw].[Pracownik]    Script Date: 05.06.2025 21:20:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[Pracownik](
	[Prc_id] [int] NULL,
	[Prc_idtyp] [int] NULL,
	[Prc_imieNazwisko] [varchar](200) NULL,
	[Prc_stanowisko] [varchar](50) NULL,
	[Prc_dataZatrudnienia] [date] NULL,
	[Prc_archiwalny] [varchar](3) NULL,
	[Prc_KodPocztowy] [varchar](10) NULL,
	[Prc_Miasto] [varchar](50) NULL,
	[Prc_Adres] [varchar](200) NULL,
	[Prc_OstatniaWyplata] [decimal](16, 2) NULL,
	[Prc_WidelkiPlacowe_Stanowisko] [varchar](50) NULL,
	[Prc_Stanowisko_stawka_min] [decimal](16, 2) NULL,
	[Prc_Stanowisko_stawka_max] [decimal](16, 2) NULL
) ON [PRIMARY]
GO


