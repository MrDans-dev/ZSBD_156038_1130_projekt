USE [ZSBD_Ksiegarnia]
GO

/****** Object:  Table [dbo].[Autor]    Script Date: 05.06.2025 20:59:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Autor](
	[aut_id] [int] IDENTITY(1,1) NOT NULL,
	[aut_imie] [varchar](50) NULL,
	[aut_nazwisko] [varchar](100) NOT NULL,
	[aut_dataurodzenia] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[aut_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


