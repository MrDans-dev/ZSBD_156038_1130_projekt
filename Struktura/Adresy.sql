USE [ZSBD_Ksiegarnia]
GO

/****** Object:  Table [dbo].[Adres]    Script Date: 05.06.2025 20:57:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Adres](
	[adr_id] [int] IDENTITY(1,1) NOT NULL,
	[adr_obid] [int] NULL,
	[adr_obidtyp] [int] NULL,
	[adr_typ] [int] NULL,
	[adr_kod_p] [varchar](10) NULL,
	[adr_miasto] [varchar](50) NULL,
	[adr_ulica] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[adr_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


