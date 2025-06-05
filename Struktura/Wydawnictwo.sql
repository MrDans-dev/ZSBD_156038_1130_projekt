USE [ZSBD_Ksiegarnia]
GO

/****** Object:  Table [dbo].[Wydawnictwo]    Script Date: 05.06.2025 21:05:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Wydawnictwo](
	[wyd_id] [int] IDENTITY(1,1) NOT NULL,
	[wyd_idtyp] [int] NULL,
	[wyd_nazwa] [varchar](100) NULL,
	[wyd_nip] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[wyd_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


