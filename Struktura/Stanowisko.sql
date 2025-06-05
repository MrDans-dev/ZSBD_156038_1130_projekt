USE [ZSBD_Ksiegarnia]
GO

/****** Object:  Table [dbo].[Stanowisko]    Script Date: 05.06.2025 21:05:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Stanowisko](
	[sta_id] [int] IDENTITY(1,1) NOT NULL,
	[sta_nazwa] [varchar](50) NOT NULL,
	[sta_stawka_min] [decimal](16, 2) NULL,
	[sta_stawka_max] [decimal](16, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[sta_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


