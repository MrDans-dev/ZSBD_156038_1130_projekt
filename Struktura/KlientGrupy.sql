USE [ZSBD_Ksiegarnia]
GO

/****** Object:  Table [dbo].[KlientGrupy]    Script Date: 05.06.2025 21:00:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[KlientGrupy](
	[kng_id] [int] NOT NULL,
	[kng_idtyp] [int] NULL,
	[kng_groid] [int] NULL,
	[kng_groidtyp] [int] NULL,
	[kng_nazwa] [varchar](50) NULL,
	[kng_dom] [bit] NULL
) ON [PRIMARY]
GO


