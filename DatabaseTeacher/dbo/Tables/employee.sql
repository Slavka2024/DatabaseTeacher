CREATE TABLE [dbo].[employee] (
    [id]            INT           IDENTITY (1, 1) NOT NULL,
    [full_name]     VARCHAR (255) NOT NULL,
    [email]         VARCHAR (100) NULL,
    [position_id]   INT           NULL,
    [department_id] INT           NULL,
    PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_employee_department] FOREIGN KEY ([department_id]) REFERENCES [dbo].[department] ([id]),
    CONSTRAINT [FK_employee_position] FOREIGN KEY ([position_id]) REFERENCES [dbo].[position] ([id])
);


GO
CREATE   TRIGGER trg_employee_audit
ON employee
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    -- INSERT: логируем новые записи
    IF EXISTS (SELECT * FROM INSERTED) AND NOT EXISTS (SELECT * FROM DELETED)
    BEGIN
        INSERT INTO employee_audit (action, full_name, old_name, changed_at)
        SELECT 'INSERT', full_name, NULL, GETDATE()
        FROM INSERTED;
    END

    -- UPDATE: логируем изменения (только если изменилось full_name или email)
    IF EXISTS (SELECT * FROM INSERTED) AND EXISTS (SELECT * FROM DELETED)
    BEGIN
        INSERT INTO employee_audit (action, full_name, old_name, changed_at)
        SELECT 'UPDATE', i.full_name, d.full_name, GETDATE()
        FROM INSERTED i
        INNER JOIN DELETED d ON i.id = d.id
        WHERE i.full_name != d.full_name
           OR i.email != d.email;
    END

    -- DELETE: логируем удалённые записи
    IF EXISTS (SELECT * FROM DELETED) AND NOT EXISTS (SELECT * FROM INSERTED)
    BEGIN
        INSERT INTO employee_audit (action, full_name, old_name, changed_at)
        SELECT 'DELETE', full_name, NULL, GETDATE()
        FROM DELETED;
    END
END;
