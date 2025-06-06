USE [ZSBD_Ksiegarnia]
GO
/****** Object:  StoredProcedure [db_create].[Recenzje]    Script Date: 05.06.2025 21:16:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [db_create].[Recenzje]
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Recenzje(rec_ksiid, rec_kntid, rec_opis, rec_ocena, rec_doWeryfikacji)
    VALUES
    (12, 11, 'Świetna książka, wciągająca od pierwszej strony.', 5, 0),
    (7, 12, 'Fabuła ciekawa, ale zakończenie przewidywalne.', 3, 1),
    (25, 13, 'Nie mogłem się oderwać, naprawdę polecam!', 5, 0),
    (33, 14, 'Styl pisania trudny do przyswojenia.', 2, 1),
    (45, 15, 'Dobra pozycja na leniwe popołudnie.', 4, 0),
    (6, 16, 'Zdecydowanie przereklamowana.', 2, 0),
    (14, 17, 'Książka pełna zwrotów akcji, bardzo dobra!', 5, 1),
    (58, 18, 'Nie spełniła moich oczekiwań.', 2, 1),
    (19, 19, 'Poruszająca historia, skłania do refleksji.', 4, 0),
    (41, 20, 'Nudna i zbyt rozwleczona fabuła.', 1, 0),
    (88, 21, 'Świetnie napisana, bohaterowie bardzo autentyczni.', 5, 0),
    (3, 22, 'Pomysł ciekawy, ale wykonanie średnie.', 3, 1),
    (30, 23, 'Polecam fanom gatunku, bardzo dobra.', 4, 0),
    (72, 24, 'Ciężko było przebrnąć przez początek.', 2, 0),
    (13, 25, 'Zakończenie całkowicie mnie zaskoczyło!', 5, 1),
    (57, 26, 'Przeciętna książka, niczym się nie wyróżnia.', 3, 0),
    (28, 27, 'Wspaniale opisana atmosfera, aż chce się czytać więcej.', 4, 0),
    (64, 28, 'Kiepska narracja, ale interesujący temat.', 2, 1),
    (22, 29, 'Jedna z najlepszych książek, jakie czytałem.', 5, 0),
    (9, 30, 'Nie polecam, zmarnowany potencjał.', 1, 1);
END;
