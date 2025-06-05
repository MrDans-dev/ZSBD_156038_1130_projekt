USE [ZSBD_Ksiegarnia]
GO

/****** Object:  Table [dbo].[Pracownik]    Script Date: 05.06.2025 21:03:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Pracownik](
	[prc_id] [int] IDENTITY(1,1) NOT NULL,
	[prc_imie] [varchar](50) NULL,
	[prc_nazwisko] [varchar](100) NOT NULL,
	[prc_stanowisko] [int] NOT NULL,
	[prc_dataZatrudnienia] [date] NULL,
	[prc_archiwalny] [tinyint] NULL,
	[prc_idtyp] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[prc_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Pracownik] ADD  DEFAULT ((0)) FOR [prc_archiwalny]
GO

ALTER TABLE [dbo].[Pracownik] ADD  DEFAULT ((60)) FOR [prc_idtyp]
GO

ALTER TABLE [dbo].[Pracownik]  WITH CHECK ADD FOREIGN KEY([prc_stanowisko])
REFERENCES [dbo].[Stanowisko] ([sta_id])
GO


