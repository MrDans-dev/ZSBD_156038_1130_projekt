USE [ZSBD_Ksiegarnia]
GO

/****** Object:  Table [dbo].[RuchMagazynowy]    Script Date: 05.06.2025 21:04:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[RuchMagazynowy](
	[rm_id] [int] IDENTITY(1,1) NOT NULL,
	[rm_zamid] [int] NULL,
	[rm_zamidtyp] [int] NULL,
	[rm_zamlp] [int] NULL,
	[rm_magid] [int] NULL,
	[rm_magidtyp] [int] NULL,
	[rm_ilosc] [int] NULL,
	[rm_czasoperacji] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[rm_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[RuchMagazynowy]  WITH CHECK ADD FOREIGN KEY([rm_magid])
REFERENCES [dbo].[Magazyn] ([mag_id])
GO


