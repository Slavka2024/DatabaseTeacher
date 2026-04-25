CREATE   PROCEDURE sp_GetTicketsByPriority
    @PriorityId INT
AS
BEGIN
    SET NOCOUNT ON; -- отключаем лишние сообщения
    
    SELECT id, title, created_at
    FROM ticket
    WHERE priority_id = @PriorityId
    ORDER BY created_at DESC;
END
