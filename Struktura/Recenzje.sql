USE [ZSBD_Ksiegarnia]
GO

/****** Object:  Table [dbo].[Recenzje]    Script Date: 05.06.2025 21:04:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Recenzje](
	[rec_id] [int] IDENTITY(1,1) NOT NULL,
	[rec_ksiid] [int] NOT NULL,
	[rec_kntid] [int] NOT NULL,
	[rec_opis] [varchar](300) NULL,
	[rec_ocena] [int] NULL,
	[rec_doWeryfikacji] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[rec_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Recenzje]  WITH CHECK ADD FOREIGN KEY([rec_kntid])
REFERENCES [dbo].[Klient] ([knt_id])
GO

ALTER TABLE [dbo].[Recenzje]  WITH CHECK ADD  CONSTRAINT [FK__Recenzje__rec_ks__45BE5BA9] FOREIGN KEY([rec_ksiid])
REFERENCES [dbo].[Ksiazka] ([ksi_id])
GO

ALTER TABLE [dbo].[Recenzje] CHECK CONSTRAINT [FK__Recenzje__rec_ks__45BE5BA9]
GO


