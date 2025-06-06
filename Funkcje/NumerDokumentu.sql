USE [ZSBD_Ksiegarnia]
GO
/****** Object:  UserDefinedFunction [dbo].[NumerDokumentu]    Script Date: 05.06.2025 21:18:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
ALTER FUNCTION [dbo].[NumerDokumentu]
(
	@id int , @typ int
)
RETURNS varchar(100)
AS
BEGIN
	DECLARE @result varchar(100)

	select @result = concat(case when zam_idtyp = 1 then 'ZZ' else 'ZS' end , ' - ', zam_seria,'/',zam_numer,'/',month(zam_data_w),'/',year(zam_data_w)) 
						from dbo.ZamowieniaNaglowek where zam_id = @id and zam_idtyp = @typ

	RETURN @result

END
