USE [ZSBD_Ksiegarnia]
GO

/****** Object:  Table [dbo].[Magazyn]    Script Date: 05.06.2025 21:02:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Magazyn](
	[mag_id] [int] IDENTITY(1,1) NOT NULL,
	[mag_idtyp] [int] NULL,
	[mag_nazwa] [varchar](30) NULL,
	[mag_kod] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[mag_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


