USE [ZSBD_Ksiegarnia]
GO

/****** Object:  View [dbo].[II_Kwartal_BR]    Script Date: 05.06.2025 21:13:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[II_Kwartal_BR] as
SELECT [Miesiac]
      ,[Rok]
      ,[Kw]
      ,[DokumentNumer]
      ,[Klient_Akronim]
      ,[Klient_Nazwa]
      ,[Klient_NIP]
      ,[Klient_Miasto_Wys]
      ,[Klient_KodP_Wys]
      ,[Klient_Adres_Wys]
      ,[WartoscNetto]
      ,[WartoscBrutto]
      ,[Ilosc]
      ,[Pracownik]
  FROM [ZSBD_Ksiegarnia].[dbo].[Sprzedaz_Rok_Biezacy]
  where kw = 2

GO


