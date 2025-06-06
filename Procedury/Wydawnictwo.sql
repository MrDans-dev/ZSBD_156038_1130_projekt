USE [ZSBD_Ksiegarnia]
GO
/****** Object:  StoredProcedure [db_create].[Wydawnictwo]    Script Date: 05.06.2025 21:16:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [db_create].[Wydawnictwo]
AS
BEGIN
	INSERT INTO [dbo].[Wydawnictwo] (wyd_idtyp, wyd_nazwa, wyd_nip) VALUES
	(35, 'Wydawnictwo Literackie', '9451234567'),
	(35, 'Znak', '6762123456'),
	(35, 'Czarne', '7382945612'),
	(35, 'Prószyński i S-ka', '5210012345'),
	(35, 'Albatros', '5229876543'),
	(35, 'Rebis', '7812349876'),
	(35, 'Fabryka Słów', '7123456789'),
	(35, 'Insignis', '6765432198'),
	(35, 'Novae Res', '9573421987'),
	(35, 'SQN', '6798765432');
END
