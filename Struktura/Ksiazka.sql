USE [ZSBD_Ksiegarnia]
GO

/****** Object:  Table [dbo].[Ksiazka]    Script Date: 05.06.2025 21:00:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Ksiazka](
	[ksi_id] [int] IDENTITY(1,1) NOT NULL,
	[ksi_idtyp] [int] NULL,
	[ksi_tytul] [varchar](500) NOT NULL,
	[ksi_typ_okladki] [int] NULL,
	[ksi_jezyk_wydania] [int] NULL,
	[ksi_jezyk_oryginalu] [int] NULL,
	[ksi_rok_wydania] [int] NULL,
	[ksi_ilosc_stron] [int] NULL,
	[ksi_wydawnictwo] [int] NULL,
	[ksi_numer_wydania] [int] NULL,
	[ksi_cena] [decimal](16, 2) NULL,
	[ksi_isbn] [varchar](13) NOT NULL,
 CONSTRAINT [PK__Ksiazka__489126C455F60C7E] PRIMARY KEY CLUSTERED 
(
	[ksi_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Ksiazka]  WITH CHECK ADD  CONSTRAINT [FK__Ksiazka__ksi_jez__7EF6D905] FOREIGN KEY([ksi_jezyk_wydania])
REFERENCES [dbo].[Jezyki] ([j_id])
GO

ALTER TABLE [dbo].[Ksiazka] CHECK CONSTRAINT [FK__Ksiazka__ksi_jez__7EF6D905]
GO

ALTER TABLE [dbo].[Ksiazka]  WITH CHECK ADD  CONSTRAINT [FK__Ksiazka__ksi_jez__7FEAFD3E] FOREIGN KEY([ksi_jezyk_oryginalu])
REFERENCES [dbo].[Jezyki] ([j_id])
GO

ALTER TABLE [dbo].[Ksiazka] CHECK CONSTRAINT [FK__Ksiazka__ksi_jez__7FEAFD3E]
GO

ALTER TABLE [dbo].[Ksiazka]  WITH CHECK ADD  CONSTRAINT [FK__Ksiazka__ksi_wyd__44CA3770] FOREIGN KEY([ksi_wydawnictwo])
REFERENCES [dbo].[Wydawnictwo] ([wyd_id])
GO

ALTER TABLE [dbo].[Ksiazka] CHECK CONSTRAINT [FK__Ksiazka__ksi_wyd__44CA3770]
GO


