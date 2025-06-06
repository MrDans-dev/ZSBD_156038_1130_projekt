USE [ZSBD_Ksiegarnia]
GO
/****** Object:  StoredProcedure [db_create].[KsiazkaOpis]    Script Date: 05.06.2025 21:14:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [db_create].[KsiazkaOpis]
AS
BEGIN
	SET NOCOUNT ON;

    INSERT INTO KsiazkaOpis (kso_ksiid, kso_zajawka, kso_opis)
VALUES
(1, 'Klasyczna powieść pozytywistyczna o miłości i społeczeństwie.', '„Lalka” Bolesława Prusa to opowieść o losach Stanisława Wokulskiego, tragicznej miłości i zderzeniu idealizmu z realiami kapitalizmu XIX-wiecznej Warszawy. Pełna obserwacji społecznych, symboliki i wątków romantycznych.'),
(2, 'Psychologiczna opowieść o zbrodni i odkupieniu.', '„Zbrodnia i kara” Fiodora Dostojewskiego to historia Raskolnikowa, młodego studenta, który popełnia morderstwo i zmaga się z konsekwencjami moralnymi swojego czynu. Głęboka analiza psychiki ludzkiej.'),
(3, 'Mistrzowskie połączenie realizmu i fantastyki.', '„Mistrz i Małgorzata” Michaiła Bułhakowa to kultowa powieść, łącząca losy tajemniczego Wolanda, miłości Mistrza i Małgorzaty oraz alegoryczną wizję Moskwy czasów stalinizmu. Pełna absurdu, grozy i filozofii.'),
(4, 'Humorystyczna wersja klasyki z domieszką grozy.', '„Duma i uprzedzenie i zombi” to parodia klasycznej powieści Jane Austen, gdzie do miłosnych perypetii Elizabeth i Darcy’ego dołączają krwawe starcia z nieumarłymi. Dla fanów groteski i klasyki w jednym.'),
(5, 'Dystopijna wizja przyszłości i kontroli totalitarnej.', '„Rok 1984” George’a Orwella przedstawia społeczeństwo permanentnie inwigilowane przez Wielkiego Brata. Książka o utracie wolności, manipulacji językiem i opresyjnej władzy. Wciąż aktualna przestroga.');

END
