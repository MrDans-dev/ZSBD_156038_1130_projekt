USE [ZSBD_Ksiegarnia]
GO

/****** Object:  Table [dbo].[KsiazkaTlumaczLink]    Script Date: 05.06.2025 21:01:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[KsiazkaTlumaczLink](
	[ksi_id] [int] NULL,
	[tra_id] [int] NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[KsiazkaTlumaczLink]  WITH CHECK ADD FOREIGN KEY([ksi_id])
REFERENCES [dbo].[Ksiazka] ([ksi_id])
GO

ALTER TABLE [dbo].[KsiazkaTlumaczLink]  WITH CHECK ADD FOREIGN KEY([tra_id])
REFERENCES [dbo].[Tlumacz] ([tra_id])
GO


