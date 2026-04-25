CREATE   PROCEDURE sp_UpdateTicketTitle
    @TicketId INT,
    @NewTitle VARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        BEGIN TRANSACTION;
        
        UPDATE ticket SET title = @NewTitle WHERE id = @TicketId;
        
        IF @@ROWCOUNT = 0
            THROW 50001, 'Ticket not found', 1;
        
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        
        SELECT 
            ERROR_NUMBER() AS ErrorNumber,
            ERROR_MESSAGE() AS ErrorMessage,
            ERROR_SEVERITY() AS Severity;
    END CATCH
END
