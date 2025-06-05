USE [ZSBD_Ksiegarnia]
GO

/****** Object:  Table [dbo].[KsiazkiGrupy]    Script Date: 05.06.2025 21:01:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[KsiazkiGrupy](
	[ksg_id] [int] NOT NULL,
	[ksg_idtyp] [int] NULL,
	[ksg_groid] [int] NULL,
	[ksg_groidtyp] [int] NULL,
	[ksg_nazwa] [varchar](50) NULL,
	[ksg_dom] [bit] NULL
) ON [PRIMARY]
GO


