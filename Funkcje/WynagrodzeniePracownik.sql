USE [ZSBD_Ksiegarnia]
GO
/****** Object:  UserDefinedFunction [dbo].[WynagrodzeniePracownik]    Script Date: 05.06.2025 21:18:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER FUNCTION [dbo].[WynagrodzeniePracownik] 
(	
	@prc_ImieNazwisko varchar(200),@ms_od int, @ms_do int , @rok_od int, @rok_do int
)
RETURNS TABLE 
AS
RETURN 
(
	select [ImieNazwisko]
      ,[Stanowisko]
      ,[WidelkiPlacowe_Stanowisko]
      ,[Data_wyplaty]
      ,[Kwota]
      ,[Czy_wyplata_powyzej_avg] 
	from [dbo].[Wynagrodzenie] 
	where [ImieNazwisko] = @prc_ImieNazwisko
	and MONTH([Data_wyplaty]) between @ms_od and @ms_do
	and year([Data_wyplaty]) between @rok_od and @rok_do
)
