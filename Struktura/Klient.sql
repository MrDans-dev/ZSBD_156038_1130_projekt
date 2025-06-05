USE [ZSBD_Ksiegarnia]
GO

/****** Object:  Table [dbo].[Klient]    Script Date: 05.06.2025 20:59:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Klient](
	[knt_id] [int] IDENTITY(1,1) NOT NULL,
	[knt_idtyp] [int] NULL,
	[knt_knpid] [int] NULL,
	[knt_nazwa] [varchar](100) NULL,
	[knt_akronim] [varchar](30) NULL,
	[knt_nip] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[knt_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


