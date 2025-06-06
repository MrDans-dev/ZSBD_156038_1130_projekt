USE [ZSBD_Ksiegarnia]
GO
/****** Object:  StoredProcedure [db_create].[Pracownik]    Script Date: 05.06.2025 21:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [db_create].[Pracownik]
AS
BEGIN
	INSERT INTO dbo.Pracownik (prc_imie, prc_nazwisko, prc_stanowisko, prc_dataZatrudnienia) VALUES
	('Anna', 'Nowak', 1, '2023-01-15'),
	('Marek', 'Kowalski', 2, '2022-11-03'),
	('Ewa', 'Wiśniewska', 3, '2021-07-19'),
	('Tomasz', 'Zieliński', 4, '2020-03-22'),
	('Katarzyna', 'Wójcik', 5, '2023-09-10'),
	('Piotr', 'Kamiński', 6, '2022-04-05'),
	('Monika', 'Lewandowska', 7, '2021-01-30'),
	('Jakub', 'Dąbrowski', 8, '2019-12-12'),
	('Magdalena', 'Szymańska', 9, '2020-08-01'),
	('Adrian', 'Pawlak', 10, '2023-05-17'),
	('Natalia', 'Mazur', 2, '2023-02-20'),
	('Kamil', 'Jankowski', 5, '2023-06-01'),
	('Sylwia', 'Kubiak', 1, '2022-10-14'),
	('Paweł', 'Grabowski', 6, '2021-09-25'),
	('Julia', 'Król', 3, '2024-01-11'),
	('Rafał', 'Sikora', 7, '2022-08-30'),
	('Aleksandra', 'Baran', 10, '2023-03-04'),
	('Damian', 'Górski', 4, '2020-12-09'),
	('Weronika', 'Czarnecka', 9, '2021-06-18'),
	('Mateusz', 'Lis', 8, '2022-11-27');
END
