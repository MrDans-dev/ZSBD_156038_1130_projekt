USE [ZSBD_Ksiegarnia]
GO
/****** Object:  Trigger [dbo].[StanCheckUpdate]    Script Date: 05.06.2025 21:08:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER TRIGGER [dbo].[StanCheckUpdate]
   ON  [dbo].[ZamowieniaElementy]
   AFTER INSERT
AS 
BEGIN
	SET NOCOUNT ON;

	-- zam_idtyp 1 - zz 2 - zs

	DECLARE 
        @zae_id INT,
        @zae_idtyp INT,
        @zae_lp INT,
        @zae_ksiid INT,
        @zae_ksiityp INT,
        @zae_magid INT,
        @zae_magidtyp INT,
        @zae_ilosc DECIMAL(18,2),
        @typ INT;

    -- Cursor
    DECLARE elem CURSOR LOCAL FOR 
        SELECT zae_id, zae_idtyp, zae_lp, zae_ksiid, zae_ksiityp, zae_magid, zae_magidtyp, zae_ilosc 
        FROM inserted;

    OPEN elem;
    FETCH NEXT FROM elem INTO @zae_id, @zae_idtyp, @zae_lp, @zae_ksiid, @zae_ksiityp, @zae_magid, @zae_magidtyp, @zae_ilosc;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        IF @zae_idtyp = 1
        BEGIN
            -- Wstaw nowy stan (lub sumuj z istniejącym)
			if not exists (select 1 from dbo.Stan where stn_ksiid = @zae_ksiid AND stn_ksiidtyp = @zae_ksiityp AND stn_magid = @zae_magid AND stn_magidtyp = @zae_magidtyp ) 
			begin
            INSERT INTO dbo.Stan (stn_ksiid, stn_ksiidtyp, stn_magid, stn_magidtyp, stn_ilosc)
            SELECT 
                @zae_ksiid,
                @zae_ksiityp,
                @zae_magid,
                @zae_magidtyp,
                ISNULL((
                    SELECT SUM(stn_ilosc)
                    FROM dbo.Stan
                    WHERE stn_ksiid = @zae_ksiid AND stn_ksiidtyp = @zae_ksiityp AND stn_magid = @zae_magid AND stn_magidtyp = @zae_magidtyp
                ), 0) + @zae_ilosc;
			end
			else
			begin
				update stn set stn_ilosc = ISNULL((
                    SELECT SUM(stn_ilosc)
                    FROM dbo.Stan
                    WHERE stn_ksiid = @zae_ksiid AND stn_ksiidtyp = @zae_ksiityp AND stn_magid = @zae_magid AND stn_magidtyp = @zae_magidtyp
                ), 0) + @zae_ilosc  from dbo.Stan stn where stn_ksiid = @zae_ksiid AND stn_ksiidtyp = @zae_ksiityp AND stn_magid = @zae_magid AND stn_magidtyp = @zae_magidtyp
			end
        END

        IF @zae_idtyp = 2
        BEGIN
            -- Sprawdzenie stanu magazynowego
            IF EXISTS (
                SELECT 1
                FROM dbo.Stan
                WHERE stn_ksiid = @zae_ksiid 
                  AND stn_ksiidtyp = @zae_ksiityp 
                  AND stn_magid = @zae_magid 
                  AND stn_magidtyp = @zae_magidtyp
                  AND stn_ilosc >= @zae_ilosc
            )
            BEGIN
                -- Odejmij stan
                UPDATE dbo.Stan
                SET stn_ilosc = stn_ilosc - @zae_ilosc
                WHERE stn_ksiid = @zae_ksiid 
                  AND stn_ksiidtyp = @zae_ksiityp 
                  AND stn_magid = @zae_magid 
                  AND stn_magidtyp = @zae_magidtyp;
            END
            ELSE
            BEGIN
                -- Błąd: brak wystarczającego stanu
                RAISERROR('Brak stanu magazynowego.', 16, 1);
                ROLLBACK TRANSACTION;
                CLOSE elem;
                DEALLOCATE elem;
                RETURN;
            END
        END

        -- Zapis ruchu magazynowego
        INSERT INTO dbo.RuchMagazynowy (rm_zamid, rm_zamidtyp, rm_zamlp, rm_magid, rm_magidtyp, rm_ilosc, rm_czasoperacji)
        VALUES (
            @zae_id,
            @zae_idtyp,
            @zae_lp,
            @zae_magid,
            @zae_magidtyp,
            CASE WHEN @typ = 1 THEN @zae_ilosc ELSE -@zae_ilosc END,
            GETDATE()
        );

        FETCH NEXT FROM elem INTO @zae_id, @zae_idtyp, @zae_lp, @zae_ksiid, @zae_ksiityp, @zae_magid, @zae_magidtyp, @zae_ilosc;
    END

    CLOSE elem;
    DEALLOCATE elem;

END
