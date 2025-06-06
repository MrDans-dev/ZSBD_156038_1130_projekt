USE [ZSBD_Ksiegarnia]
GO
/****** Object:  StoredProcedure [db_create].[Ksiazki]    Script Date: 05.06.2025 21:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [db_create].[Ksiazki] 
AS
BEGIN
	SET NOCOUNT ON;
	insert into [dbo].[Ksiazka] ([ksi_idtyp]
      ,[ksi_tytul]
      ,[ksi_typ_okladki]
      ,[ksi_jezyk_wydania]
      ,[ksi_jezyk_oryginalu]
      ,[ksi_rok_wydania]
      ,[ksi_ilosc_stron]
      ,[ksi_wydawnictwo]
      ,[ksi_numer_wydania]
      ,[ksi_cena]
      ,[ksi_isbn])
select 45,'Lalka',1,1,1,2024,832,null,8,92.99,9788367262750 union all
select 45,'Zbrodnia i kara',1,1,4,2018,476,null,1,21.75,9788328059474 union all
select 45,'Mistrz i Małgorzata',1,1,4,2003,400,null,3,22.99,8373195157 union all
select 45,'Duma i uprzedzenie i zombi',1,1,3,2010,360,null,1,31.99,8362343036 union all
select 45,'Rok 1984',1,1,3,2022,432,null,4,25.99,9788311174368 union all
select 45,'Folwark zwierzęcy',1,1,3,2024,141,null,5,17.99,8370012442 union all
select 45,'Harry Potter i Kamień Filozoficzny',1,1,3,2023,312,null,1,39.99,9788382659719 union all
select 45,'Wyprawa',1,1,1,1990,548,null,1,23.99,8307021731 union all
select 45,'Sto lat samotności',1,1,5,2022,436,null,4,34.13,9788328725102 union all
select 45,'Mały Książę',1,1,6,2016,100,null,3,12298,9788377915127 union all
select 45,'Gra anioła',1,1,5,2008,604,null,2,25.99,8374956003 union all
select 45,'Położna z Auschwitz',2,1,1,2020,302,null,2,25.99,8327717413 union all
select 45,'Chłopi',2,1,1,2021,710,null,2,25.99,8366969118 union all
select 45,'Ludzie bezdomni',2,1,1,2013,169,null,2,45781,9788328546400 union all
select 45,'Pianista',1,1,1,2023,190,null,1,41.85,9782808695107 union all
select 45,'Shantaram',2,1,3,2022,800,null,6,30.95,8367262980 union all
select 45,'Inni ludzie',1,1,1,2022,160,null,3,30.95,8308075444 union all
select 45,'Miasto ślepców',1,1,1,2000,267,null,2,35.99,9788380624269 union all
select 45,'Szczygieł',1,1,3,2015,1226,null,1,44.99,9788324027385 union all
select 45,'Listowieść',2,1,1,2021,473,null,1,32.63,9788328089839 union all
select 45,'Horyzont',1,1,1,2024,267,null,1,28.55,9788383306797 union all
select 45,'Świat króla Artura',2,1,1,1995,216,null,2,23.99,9788375780949 union all
select 45,'Wieczny Grunwald',1,1,1,2023,272,null,2,27.99,8308083463 union all
select 45,'Ciemno, prawie noc',1,1,1,2021,530,null,5,25.83,9788324062355 union all
select 45,'Empuzjon',1,1,1,2022,391,null,1,33.99,8308075770 union all
select 45,'Złodziejka książek',1,1,3,2008,494,null,1,22.55,8310113587 union all
select 45,'Zabić drozda',1,1,3,1973,389,null,1,33.99,9788378187929 union all
select 45,'Opowieść podręcznej',1,1,3,2023,368,null,1,39.99,838360002 union all
select 45,'Stramer',1,1,1,2019,440,null,1,31.99,8308083609 union all
select 45,'Pachnidło',1,1,2,2019,320,null,1,69.5,8381392950 union all
select 45,'Człowiek w poszukiwaniu sensu',1,1,3,2019,224,null,1,31.99,8382525822 union all
select 45,'Alchemik',1,1,5,1995,204,null,1,35.66,8391723917 union all
select 45,'Nieznośna lekkość bytu',1,1,1,2024,247,null,2,27.19,9788383197876 union all
select 45,'Sztorm stulecia',1,1,3,2019,448,null,1,45.99,8380973712 union all
select 45,'Tim Cook. Człowiek, który wzniósł Apple na wyższy poziom',1,1,3,2019,322,null,4,29.02,9788381295420 union all
select 45,'Runy Hordów',1,1,1,2021,432,null,1,14.14,9788728078679 union all
select 45,'Carrie',2,1,3,2000,212,null,1,35.99,9780671039738 union all
select 45,'Chudszy',2,1,3,2024,416,null,1,45916,8383614136 union all
select 45,'Księgi Jakubowe albo Wielka podróż przez siedem granic, pięć języków i trzy duże religie, nie licząc tych małych',2,1,1,2024,912,null,1,50,8308084605 union all
select 45,'Ucieczka od bezradności',2,1,1,2021,236,null,3,27.19,9788324084074 union all
select 45,'Archistorie',2,1,1,2023,368,null,1,68.99,8396301417 union all
select 45,'Dzisiaj narysujemy śmierć',2,1,1,2023,208,null,1,33.99,8308080995 union all
select 45,'Czterysta pięćdziesiąt jeden stopni Fahrenheita',2,1,3,2008,224,null,1,38.99,8375900273 union all
select 45,'Mechaniczna pomarańcza',1,1,3,2007,254,null,2,38.99,8389640724 union all
select 45,'Atlas zbuntowany',1,1,3,2008,1174,null,1,47.99,8375060852 union all
select 45,'Gra Endera',1,1,3,1991,254,null,1,38.99,8385195165 union all
select 45,'Diuna',1,1,3,2022,300,null,1,35.99,838188408 union all
select 45,'Lew, czarownica i stara szafa',1,1,3,1996,181,null,3,21.99,8385594329 union all
select 45,'Hobbit czyli Tam i z powrotem',1,1,3,1985,250,null,3,38.99,9788324411641 union all
select 45,'Metro 2033',1,1,4,2015,592,null,1,38.99,8365315017 union all
select 45,'Nowy wspaniały świat',1,1,3,2022,256,null,2,55.99,8328722941 union all
select 45,'Wojna i pokoj',1,1,4,2015,414,null,2,49.99,8326822159 union all
select 45,'Anna Karenina',1,1,4,2023,20,null,2,41.85,9782808695176 union all
select 45,'Bracia Karamazow',1,1,4,2020,493,null,1,45413,9788379007196 union all
select 45,'Wspomnienia z martwego domu',2,1,4,2024,224,null,1,19.99,8368218829 union all
select 45,'Behawiorysta',1,1,1,2022,400,null,1,45.99,838280022 union all
select 45,'Buszujący w zbożu książka',1,1,3,2023,290,null,1,41.85,9782808694315 union all
select 45,'Dżuma',1,1,6,2020,230,null,4,44.99,9781678190446 union all
select 45,'Proces',2,1,2,2024,300,null,4,35.99,838241057 union all
select 45,'Zamek',1,1,2,2023,210,null,4,41.85,9782808695312 union all
select 45,'Lolita',1,1,3,2022,160,null,4,28.99,8383182422 union all
select 45,'Mroczna arena',1,1,3,2011,190,null,4,44.99,8376595954 union all
select 45,'Nigdziebądź',2,1,3,2012,250,null,4,44.99,8375340103 union all
select 45,'Koralina',1,1,3,2012,550,null,4,44.99,8375340103 union all
select 45,'Szamański twist',1,1,1,2021,439,null,4,45868,9788382102727 union all
select 45,'Czarny obelisk',1,1,2,2010,408,null,4,33.99,8375106321 union all
select 45,'Na zachodzie bez zmian',1,1,2,1956,380,null,3,23,9788381886604 union all
select 45,'Lot nad kukułczym gniazdem',1,1,3,1994,346,null,3,23,8386133457 union all
select 45,'Paragraf 22',2,1,3,2005,477,null,2,36465,8497898788 union all
select 45,'Zajezierscy',1,1,1,2022,571,null,3,36465,838234397 union all
select 45,'Ania z Zielonego wzgórza',1,1,3,2020,288,null,2,36404,9788327266293 union all
select 45,'Pamiętnik',1,1,3,2023,355,null,2,16.99,8367513282 union all
select 45,'O psie, który jeździł koleją',2,1,1,2001,631,null,4,16.99,8372970130 union all
select 45,'Harry Potter i Więzień Azkabanu',1,1,3,2023,441,null,4,16.99,9781789392432 union all
select 45,'Harry Potter i Czara Ognia',1,1,3,2017,292,null,4,39.99,9781781107423 union all
select 45,'Harry Potter i Zakon Feniksa',1,1,3,2023,354,null,4,19.99,8382655580 union all
select 45,'Harry Potter i Insygnia Śmierci',2,1,3,2017,292,null,2,39.99,9781781107423 union all
select 45,'Kubuś Puchatek',1,1,3,1995,136,null,2,26.99,8310103166 union all
select 45,'Mała księżniczka',1,1,3,2022,143,null,2,26.99,8382223656 union all
select 45,'Tajemniczy ogród',1,1,3,2023,345,null,2,26.99,8367498305 union all
select 45,'Nowe przygody Mikołajka',1,1,5,2021,371,null,2,26.99,8324075682 union all
select 45,'Dziennik cwaniaczka',1,1,3,2023,674,null,1,26.99,831014055 union all
select 45,'Ten dom jest mój',1,1,2,2020,179,null,1,22.78,9788382300062 union all
select 45,'Bastion',1,1,3,2023,342,null,1,31.99,8367759370 union all
select 45,'Dzieci z Bullerbyn',1,1,7,2008,375,null,1,34.99,8310116195 union all
select 45,'Drużyna Pierścienia',1,1,3,2012,448,null,5,40.99,9788324144242 union all
select 45,'Dwie Wieże',1,1,3,2015,501,null,3,38.99,9788377856819 union all
select 45,'Powrót Króla',1,1,3,2015,608,null,3,41.99,9788377856826


declare @ksi_id int
declare @ksi_idtyp int
declare @max int = (select max(wyd_id) from dbo.Wydawnictwo)
declare @min int = (select min(wyd_id) from dbo.Wydawnictwo)
declare @rand int

DECLARE ksi CURSOR FOR SELECT ksi_id,ksi_idtyp FROM [ZSBD_Ksiegarnia].[dbo].[Ksiazka] where  ksi_wydawnictwo is null
OPEN ksi
FETCH NEXT FROM ksi into @ksi_id,@ksi_idtyp;

while @@FETCH_STATUS = 0
begin
	select @rand = FLOOR(RAND() * (@Max - @Min + 1)) + @Min 
	if exists(select top 1 wyd_id from dbo.Wydawnictwo where wyd_id = @rand)
	begin
		update ksi set ksi_wydawnictwo = @rand from dbo.Ksiazka ksi where ksi_id = @ksi_id and ksi_idtyp = @ksi_idtyp
		FETCH NEXT FROM ksi into @ksi_id,@ksi_idtyp;
	end
end

close ksi
deallocate ksi
END
