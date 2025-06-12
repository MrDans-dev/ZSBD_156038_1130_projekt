USE [msdb]
GO

/****** Object:  Job [ZSBD_BackupResotre_DW]    Script Date: 12.06.2025 17:47:08 ******/
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]    Script Date: 12.06.2025 17:47:08 ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'ZSBD_BackupResotre_DW', 
		@enabled=0, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'DANLAB\Daniel', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Backup]    Script Date: 12.06.2025 17:47:08 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Backup', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'BACKUP DATABASE [ZSBD_Ksiegarnia] TO  DISK = N''S:\MSSQL16.MSSQLSERVER\MSSQL\Backup\ZSBD_Ksiegarnia.bak'' WITH NOFORMAT, NOINIT,  NAME = N''ZSBD_Ksiegarnia-Full Database Backup'', SKIP, NOREWIND, NOUNLOAD,  STATS = 10', 
		@database_name=N'master', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Drop database]    Script Date: 12.06.2025 17:47:08 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Drop database', 
		@step_id=2, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'ALTER DATABASE [ZSBD_Ksiegarnia_back] SET  SINGLE_USER WITH ROLLBACK IMMEDIATE
DROP DATABASE [ZSBD_Ksiegarnia_back]', 
		@database_name=N'master', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Resotre]    Script Date: 12.06.2025 17:47:08 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Resotre', 
		@step_id=3, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'RESTORE DATABASE [ZSBD_Ksiegarnia_back] 
FROM DISK = N''S:\MSSQL16.MSSQLSERVER\MSSQL\Backup\ZSBD_Ksiegarnia.bak'' 
WITH 
    FILE = 1,  
    MOVE N''ZSBD_Ksiegarnia'' TO N''S:\MSSQL16.MSSQLSERVER\MSSQL\DATA\ZSBD_Ksiegarnia_back.mdf'',
    MOVE N''ZSBD_Ksiegarnia_log'' TO N''S:\MSSQL16.MSSQLSERVER\MSSQL\DATA\ZSBD_Ksiegarnia_back_log.ldf'',
    MOVE N''ZSBD_MemoryTables'' TO N''S:\MSSQL16.MSSQLSERVER\MSSQL\DATA\ZSBD_Ksiegarnia_back_mem'',
    NOUNLOAD,  
    REPLACE,  
    STATS = 5;', 
		@database_name=N'master', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Delete backup]    Script Date: 12.06.2025 17:47:08 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Delete backup', 
		@step_id=4, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=3, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'EXEC sp_configure ''show advanced options'', 1;
RECONFIGURE;
EXEC sp_configure ''xp_cmdshell'', 1;
RECONFIGURE;

EXEC xp_cmdshell ''DEL "S:\MSSQL16.MSSQLSERVER\MSSQL\Backup\ZSBD_Ksiegarnia.bak"'';

EXEC sp_configure ''xp_cmdshell'', 0;
RECONFIGURE;
EXEC sp_configure ''show advanced options'', 0;
RECONFIGURE;', 
		@database_name=N'master', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [DW_Ksiazki]    Script Date: 12.06.2025 17:47:08 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'DW_Ksiazki', 
		@step_id=5, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=3, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'truncate table [ZSBD_Ksiegarnia_DW].[dw].[Ksiazki]
insert into [ZSBD_Ksiegarnia_DW].[dw].[Ksiazki]
select 
ksi_id
,ksi_idtyp
,ksi_tytul
,case when ksi_typ_okladki = 1 then ''Miękka'' else ''Twarda'' end
,jezyk_w.j_nazwa
,jezyk_o.j_nazwa
,ksi_rok_wydania
,ksi_ilosc_stron
,wyd_nazwa
,wyd_nip
,concat(adr_kod_p,'' '',adr_miasto,'' '',adr_ulica)
,ksi_numer_wydania
,ksi_cena
,ksi_isbn
,(SELECT STRING_AGG(concat(aut_imie,'' '',aut_nazwisko), '' , '')FROM [ZSBD_Ksiegarnia_back].dbo.KsiazkaAutorLink link 
	inner join [ZSBD_Ksiegarnia_back].dbo.Autor a on link.aut_id = a.aut_id
	where link.ksi_id = ksi.ksi_id) AS Autor
,isnull(kso_opis,''<brak>'')
,isnull(kso_zajawka,''<brak>'')
,(SELECT STRING_AGG(concat(tra_imie,'' '',tra_nazwisko), '' , '')FROM [ZSBD_Ksiegarnia_back].dbo.KsiazkaTlumaczLink link 
	inner join [ZSBD_Ksiegarnia_back].dbo.Tlumacz a on link.tra_id = a.tra_id
	where link.ksi_id = ksi.ksi_id) AS Tlumacz
,isnull((select top 1 concat(g2.ksg_nazwa,''/'',g1.ksg_nazwa) from [ZSBD_Ksiegarnia_back].dbo.KsiazkiGrupy ksg
inner join [ZSBD_Ksiegarnia_back].dbo.KsiazkiGrupy g1 on g1.ksg_id = ksg.ksg_groid and g1.ksg_idtyp = ksg.ksg_groidtyp
inner join [ZSBD_Ksiegarnia_back].dbo.KsiazkiGrupy g2 on g2.ksg_id = g1.ksg_groid and g2.ksg_idtyp = g1.ksg_groidtyp
where ksg.ksg_id = ksi.ksi_id and ksg.ksg_idtyp = 45 and ksg.ksg_dom = 1),''<brak>'')
,avg(rec_ocena)
from [ZSBD_Ksiegarnia_back].dbo.Ksiazka ksi
left join [ZSBD_Ksiegarnia_back].dbo.Jezyki jezyk_w on jezyk_w.j_id = ksi_jezyk_wydania
left join [ZSBD_Ksiegarnia_back].dbo.Jezyki jezyk_o on jezyk_o.j_id = ksi_jezyk_oryginalu
left join [ZSBD_Ksiegarnia_back].dbo.Wydawnictwo on ksi_wydawnictwo = wyd_id
left join [ZSBD_Ksiegarnia_back].dbo.Adres wyd_a on wyd_a.adr_obid = wyd_id and wyd_a.adr_obidtyp = wyd_idtyp and adr_typ = 1
left join [ZSBD_Ksiegarnia_back].dbo.KsiazkaOpis on kso_ksiid = ksi_id
left join [ZSBD_Ksiegarnia_back].dbo.Recenzje on rec_ksiid = ksi_id
group by 
ksi_id
,ksi_idtyp
,ksi_tytul
,case when ksi_typ_okladki = 1 then ''Miękka'' else ''Twarda'' end
,jezyk_w.j_nazwa
,jezyk_o.j_nazwa
,ksi_rok_wydania
,ksi_ilosc_stron
,wyd_nazwa
,wyd_nip
,concat(adr_kod_p,'' '',adr_miasto,'' '',adr_ulica)
,ksi_numer_wydania
,ksi_cena
,ksi_isbn
,isnull(kso_opis,''<brak>'')
,isnull(kso_zajawka,''<brak>'')', 
		@database_name=N'ZSBD_Ksiegarnia_back', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [DW_Dokumenty]    Script Date: 12.06.2025 17:47:08 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'DW_Dokumenty', 
		@step_id=6, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=3, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'truncate table [ZSBD_Ksiegarnia_DW].dw.Dokumenty
insert into [ZSBD_Ksiegarnia_DW].dw.Dokumenty
select zam_id
,zam_idtyp
,[ZSBD_Ksiegarnia_back].dbo.NumerDokumentu(zam_id,zam_idtyp)
,cast(zam_data_w as date)
,cast(zam_data_s as date)
,kg.knt_id
,kg.knt_akronim
,kd.knt_id
,kd.knt_akronim
,kp.knt_id
,kp.knt_akronim
,CONCAT(prc_imie,'' '',prc_nazwisko)
,zam_seria
from [ZSBD_Ksiegarnia_back].dbo.ZamowieniaNaglowek
left join [ZSBD_Ksiegarnia_back].dbo.Klient kg on kg.knt_id = zam_kntid
left join [ZSBD_Ksiegarnia_back].dbo.Klient kd on kd.knt_id = zam_kntid
left join [ZSBD_Ksiegarnia_back].dbo.Klient kp on kp.knt_id = zam_kntid
left join [ZSBD_Ksiegarnia_back].dbo.Pracownik on prc_id = zam_prc_utw
where zam_idtyp = 2', 
		@database_name=N'ZSBD_Ksiegarnia_DW', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [DW_DokumentyElem]    Script Date: 12.06.2025 17:47:08 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'DW_DokumentyElem', 
		@step_id=7, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=3, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'truncate table [ZSBD_Ksiegarnia_DW].dw.DokumentyElem
insert into [ZSBD_Ksiegarnia_DW].dw.DokumentyElem
select zae_id
,zae_idtyp
,zae_lp
,zae_ksiid
,ksi_tytul
,zae_ilosc
,zae_cena
,zae_magid
,zae_magidtyp
,mag_nazwa
,zae_cena * zae_ilosc
from [ZSBD_Ksiegarnia_back].[dbo].[ZamowieniaElementy]
left join [ZSBD_Ksiegarnia_back].[dbo].Ksiazka on ksi_id = zae_ksiid
left join [ZSBD_Ksiegarnia_back].[dbo].Magazyn on mag_id = zae_magid', 
		@database_name=N'ZSBD_Ksiegarnia_DW', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [DW_Pracownik]    Script Date: 12.06.2025 17:47:08 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'DW_Pracownik', 
		@step_id=8, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=3, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'truncate table [ZSBD_Ksiegarnia_DW].dw.Pracownik
insert into [ZSBD_Ksiegarnia_DW].dw.Pracownik
select prc_id
,prc_idtyp
,concat(prc_imie,'' '',prc_nazwisko)
,sta_nazwa
,prc_dataZatrudnienia
,case when prc_archiwalny = 1 then ''TAK'' else ''NIE'' end
,isnull(adr_kod_p,''<brak>'')
,isnull(adr_miasto,''<brak>'')
,concat(adr_kod_p,'' '',adr_miasto,'' '',adr_ulica)
,(select top 1 lp_kwota from [ZSBD_Ksiegarnia_back].dbo.ListaPlac where lp_prcid = prc_id order by lp_data_przelewu desc)
,concat(sta_stawka_min,'' - '',sta_stawka_max)
,sta_stawka_min
,sta_stawka_max
from [ZSBD_Ksiegarnia_back].dbo.Pracownik
left join [ZSBD_Ksiegarnia_back].dbo.Stanowisko on sta_id = prc_stanowisko
left join [ZSBD_Ksiegarnia_back].dbo.Adres on adr_obid = prc_id and adr_obidtyp = prc_idtyp and adr_typ = 1', 
		@database_name=N'ZSBD_Ksiegarnia_DW', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [DW_Klient]    Script Date: 12.06.2025 17:47:08 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'DW_Klient', 
		@step_id=9, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=3, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'truncate table [ZSBD_Ksiegarnia_DW].dw.Klient
insert into [ZSBD_Ksiegarnia_DW].dw.Klient
SELECT 
kg.knt_id, 
kg.knt_idtyp,
kg.knt_akronim,
kg.knt_nazwa,
kg.knt_knpid,
kp.knt_akronim,
kg.knt_nip,
ad.adr_kod_p,
ad.adr_miasto,
concat(ad.adr_kod_p,'' '', ad.adr_miasto,'' '', ad.adr_ulica),
adw.adr_kod_p,
adw.adr_miasto,
concat(adw.adr_kod_p,'' '', adw.adr_miasto,'' '', adw.adr_ulica),
isnull((select top 1 concat(g2.kng_nazwa,''/'',g1.kng_nazwa) from [ZSBD_Ksiegarnia_back].dbo.KlientGrupy kng
inner join [ZSBD_Ksiegarnia_back].dbo.KlientGrupy g1 on g1.kng_id = kng.kng_groid and g1.kng_idtyp = kng.kng_groidtyp
inner join [ZSBD_Ksiegarnia_back].dbo.KlientGrupy g2 on g2.kng_id = g1.kng_groid and g2.kng_idtyp = g1.kng_groidtyp
where kng.kng_id = kg.knt_id and kng.kng_idtyp = 11 and kng.kng_dom = 1),''<brak>''),
CASE 
    WHEN kg.knt_nip IS NULL THEN ''Klient prywatny'' ELSE ''Firma''
END
FROM [ZSBD_Ksiegarnia_back].[dbo].[Klient] kg

INNER JOIN ZSBD_Ksiegarnia_back.dbo.Klient kp ON kg.knt_knpid = kp.knt_id
LEFT JOIN ZSBD_Ksiegarnia_back.dbo.Adres ad ON kg.knt_id = ad.adr_obid AND kg.knt_idtyp = ad.adr_obidtyp AND ad.adr_typ = 1
LEFT JOIN ZSBD_Ksiegarnia_back.dbo.Adres adw ON kg.knt_id = adw.adr_obid AND kg.knt_idtyp = adw.adr_obidtyp AND adw.adr_typ = 2', 
		@database_name=N'ZSBD_Ksiegarnia', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Raport_Sprzedaz_Rok_Biezacy]    Script Date: 12.06.2025 17:47:08 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Raport_Sprzedaz_Rok_Biezacy', 
		@step_id=10, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=3, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'create table #dane (
	[ID] int,
	[Miesiac] [int] NULL,
	[Rok] [int] NULL,
	[Kw] [int] NULL,
	[DokumentNumer] [varchar](30) COLLATE Polish_CI_AS NOT NULL,
	[Klient_Akronim] [varchar](30) COLLATE Polish_CI_AS NULL,
	[Klient_Nazwa] [varchar](100) COLLATE Polish_CI_AS NULL,
	[Klient_NIP] [varchar](15) COLLATE Polish_CI_AS NULL,
	[Klient_Miasto_Wys] [varchar](50) COLLATE Polish_CI_AS NULL,
	[Klient_KodP_Wys] [varchar](10) COLLATE Polish_CI_AS NULL,
	[Klient_Adres_Wys] [varchar](200) COLLATE Polish_CI_AS NULL,
	[WartoscNetto] [decimal](16, 2) NULL,
	[WartoscBrutto] [decimal](16, 2) NULL,
	[Ilosc] [int] NULL,
	[Pracownik] [varchar](150) COLLATE Polish_CI_AS NULL,
)
	
insert into #dane
  SELECT
  ROW_NUMBER() OVER (ORDER BY dk.Dokument_numer),
  MONTH(dk.Dokument_dataSprzedazy),
  YEAR(dk.Dokument_dataSprzedazy),
  CASE 
    WHEN   MONTH(dk.Dokument_dataSprzedazy) = 1 THEN 1
    WHEN   MONTH(dk.Dokument_dataSprzedazy) = 2 THEN 1
    WHEN   MONTH(dk.Dokument_dataSprzedazy) = 3 THEN 1
    WHEN   MONTH(dk.Dokument_dataSprzedazy) = 4 THEN 2
    WHEN   MONTH(dk.Dokument_dataSprzedazy) = 5 THEN 2
    WHEN   MONTH(dk.Dokument_dataSprzedazy) = 6 THEN 2
    WHEN   MONTH(dk.Dokument_dataSprzedazy) = 7 THEN 3
    WHEN   MONTH(dk.Dokument_dataSprzedazy) = 8 THEN 3
    WHEN   MONTH(dk.Dokument_dataSprzedazy) = 9 THEN 3
    WHEN   MONTH(dk.Dokument_dataSprzedazy) = 10 THEN 4
    WHEN   MONTH(dk.Dokument_dataSprzedazy) = 11 THEN 4
    WHEN   MONTH(dk.Dokument_dataSprzedazy) = 12 THEN 4
  END,
  dk.Dokument_numer,
  dk.Dokument_klientGlowny_Akronim,
  dk.Dokument_klientDocelowy_Akronim,
  kn.Klient_NIP,
  kn.Klient_Miasto_Wys,
  kn.Klient_KodP_Wys,
  kn.Klient_Adres_Wys,
  sum(dke.Elem_Wartosc),
  sum(dke.Elem_Wartosc * 1.23),
  sum(dke.Elem_ilosc),
  dk.Dokument_pracownik

  FROM [ZSBD_Ksiegarnia_DW].[dw].[Dokumenty] dk

LEFT JOIN [ZSBD_Ksiegarnia_DW].[dw].[Klient] kn ON dk.Dokument_KlientDocelowy_id = kn.Klient_id
LEFT JOIN [ZSBD_Ksiegarnia_DW].[dw].[DokumentyElem] dke ON dk.Dokument_id = dke.Elem_id and dk.Dokument_typ = dke.Elem_typ
LEFT JOIN [ZSBD_Ksiegarnia_DW].[dw].[Ksiazki] ksi ON dke.Elem_ksiid = ksi.Ksiazka_id

group by MONTH(dk.Dokument_dataSprzedazy),
  YEAR(dk.Dokument_dataSprzedazy),
  dk.Dokument_numer,
  dk.Dokument_klientGlowny_Akronim,
  dk.Dokument_klientDocelowy_Akronim,
  kn.Klient_NIP,
  kn.Klient_Miasto_Wys,
  kn.Klient_KodP_Wys,
  kn.Klient_Adres_Wys,
  dk.Dokument_pracownik


DELETE FROM [ZSBD_Ksiegarnia].[dbo].[Sprzedaz_Rok_Biezacy]
INSERT INTO [ZSBD_Ksiegarnia].[dbo].[Sprzedaz_Rok_Biezacy]
select * from #dane

drop table #dane', 
		@database_name=N'master', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Raport_Wynagrodzenia]    Script Date: 12.06.2025 17:47:08 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Raport_Wynagrodzenia', 
		@step_id=11, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'create table #dane (
	[ID] [int] NOT NULL,
	ImieNazwisko varchar(200),
	Stanowisko varchar(50),
	WidelkiPlacowe_Stanowisko varchar(50),
	Data_wyplaty date,
	Kwota decimal(16,2),
	Czy_wyplata_powyzej_avg varchar(3)
)
	
insert into #dane
  SELECT
  ROW_NUMBER() OVER (ORDER BY lp_data_przelewu),
  Prc_imieNazwisko,
  Prc_stanowisko,
  Prc_WidelkiPlacowe_Stanowisko,
  cast(lp_data_przelewu as date),
  lp_kwota,
  case when lp_kwota > (select avg(lp_kwota) from [ZSBD_Ksiegarnia_back].dbo.ListaPlac where lp_prcid = Prc_id) then ''TAK'' else ''NIE'' END
  From [ZSBD_Ksiegarnia_DW].dw.Pracownik
  left join [ZSBD_Ksiegarnia_back].dbo.ListaPlac on Prc_id = lp_prcid


DELETE FROM [ZSBD_Ksiegarnia].[dbo].[Wynagrodzenie]
INSERT INTO [ZSBD_Ksiegarnia].[dbo].[Wynagrodzenie]
select * from #dane

drop table #dane', 
		@database_name=N'ZSBD_Ksiegarnia', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'ZSBD_BackupAndRestore', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=8, 
		@freq_subday_interval=3, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20250413, 
		@active_end_date=99991231, 
		@active_start_time=0, 
		@active_end_time=235959, 
		@schedule_uid=N'41d1a4b7-3af9-4443-a5b4-7ac91a0c3669'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:
GO


