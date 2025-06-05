USE [ZSBD_Ksiegarnia]
GO

/****** Object:  Table [dbo].[ListaPlac]    Script Date: 05.06.2025 21:02:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ListaPlac](
	[lp_id] [int] IDENTITY(1,1) NOT NULL,
	[lp_prcid] [int] NULL,
	[lp_kwota] [decimal](16, 2) NOT NULL,
	[lp_data_przelewu] [datetime] NULL,
	[lp_premia] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[lp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ListaPlac]  WITH CHECK ADD FOREIGN KEY([lp_prcid])
REFERENCES [dbo].[Pracownik] ([prc_id])
GO


