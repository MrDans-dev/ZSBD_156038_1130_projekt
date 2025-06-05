USE [ZSBD_Ksiegarnia]
GO

/****** Object:  Table [dbo].[ZamowieniaNaglowek]    Script Date: 05.06.2025 21:06:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ZamowieniaNaglowek](
	[zam_id] [int] IDENTITY(1,1) NOT NULL,
	[zam_idtyp] [int] NULL,
	[zam_kntid] [int] NULL,
	[zam_knttypid] [int] NULL,
	[zam_kndid] [int] NULL,
	[zam_kndtypid] [int] NULL,
	[zam_knpid] [int] NULL,
	[zam_knptypid] [int] NULL,
	[zam_prc_utw] [int] NULL,
	[zam_seria] [varchar](5) NULL,
	[zam_numer] [int] NULL,
	[zam_data_w] [date] NULL,
	[zam_data_s] [date] NULL,
 CONSTRAINT [PK__Zamowien__07FC9EAFC08558BC] PRIMARY KEY CLUSTERED 
(
	[zam_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ZamowieniaNaglowek]  WITH CHECK ADD  CONSTRAINT [FK__Zamowieni__zam_k__5AB9788F] FOREIGN KEY([zam_kntid])
REFERENCES [dbo].[Klient] ([knt_id])
GO

ALTER TABLE [dbo].[ZamowieniaNaglowek] CHECK CONSTRAINT [FK__Zamowieni__zam_k__5AB9788F]
GO

ALTER TABLE [dbo].[ZamowieniaNaglowek]  WITH CHECK ADD  CONSTRAINT [FK__Zamowieni__zam_k__5E8A0973] FOREIGN KEY([zam_kndid])
REFERENCES [dbo].[Klient] ([knt_id])
GO

ALTER TABLE [dbo].[ZamowieniaNaglowek] CHECK CONSTRAINT [FK__Zamowieni__zam_k__5E8A0973]
GO

ALTER TABLE [dbo].[ZamowieniaNaglowek]  WITH CHECK ADD  CONSTRAINT [FK__Zamowieni__zam_k__5F7E2DAC] FOREIGN KEY([zam_knpid])
REFERENCES [dbo].[Klient] ([knt_id])
GO

ALTER TABLE [dbo].[ZamowieniaNaglowek] CHECK CONSTRAINT [FK__Zamowieni__zam_k__5F7E2DAC]
GO


