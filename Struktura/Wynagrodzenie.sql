USE [ZSBD_Ksiegarnia]
GO

/****** Object:  Table [dbo].[Wynagrodzenie]    Script Date: 05.06.2025 21:05:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Wynagrodzenie]
(
	[ID] [int] NOT NULL,
	[ImieNazwisko] [varchar](200) COLLATE Polish_CI_AS NULL,
	[Stanowisko] [varchar](50) COLLATE Polish_CI_AS NULL,
	[WidelkiPlacowe_Stanowisko] [varchar](50) COLLATE Polish_CI_AS NULL,
	[Data_wyplaty] [date] NULL,
	[Kwota] [decimal](16, 2) NULL,
	[Czy_wyplata_powyzej_avg] [varchar](3) COLLATE Polish_CI_AS NULL,

 PRIMARY KEY NONCLUSTERED HASH 
(
	[ID]
)WITH ( BUCKET_COUNT = 1024)
)WITH ( MEMORY_OPTIMIZED = ON , DURABILITY = SCHEMA_ONLY )
GO


