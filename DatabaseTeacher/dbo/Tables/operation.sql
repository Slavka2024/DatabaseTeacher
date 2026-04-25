CREATE TABLE [dbo].[operation] (
    [id]                INT            IDENTITY (1, 1) NOT NULL,
    [ticket_id]         INT            NULL,
    [employee_id]       INT            NULL,
    [operation_type_id] INT            NULL,
    [old_value]         VARCHAR (255)  NULL,
    [new_value]         VARCHAR (255)  NULL,
    [created_at]        DATETIME       DEFAULT (getdate()) NULL,
    [operation_details] NVARCHAR (MAX) NULL,
    [ip_address]        VARCHAR (45)   NULL,
    [user_agent]        NVARCHAR (500) NULL,
    [duration]          INT            NULL,
    PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_operation_employee] FOREIGN KEY ([employee_id]) REFERENCES [dbo].[employee] ([id]),
    CONSTRAINT [FK_operation_ticket] FOREIGN KEY ([ticket_id]) REFERENCES [dbo].[ticket] ([id]),
    CONSTRAINT [FK_operation_type] FOREIGN KEY ([operation_type_id]) REFERENCES [dbo].[operation_type] ([id])
);

