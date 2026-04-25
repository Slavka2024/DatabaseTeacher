CREATE TABLE [dbo].[ticket] (
    [id]          INT           IDENTITY (1, 1) NOT NULL,
    [title]       VARCHAR (255) NOT NULL,
    [description] TEXT          NULL,
    [created_at]  DATETIME      DEFAULT (getdate()) NULL,
    [closed_at]   DATETIME      NULL,
    [priority_id] INT           NULL,
    [status_id]   INT           NULL,
    [category_id] INT           NULL,
    [assignee_id] INT           NULL,
    [creator_id]  INT           NULL,
    PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_ticket_assignee] FOREIGN KEY ([assignee_id]) REFERENCES [dbo].[employee] ([id]),
    CONSTRAINT [FK_ticket_category] FOREIGN KEY ([category_id]) REFERENCES [dbo].[category] ([id]),
    CONSTRAINT [FK_ticket_creator] FOREIGN KEY ([creator_id]) REFERENCES [dbo].[employee] ([id]),
    CONSTRAINT [FK_ticket_priority] FOREIGN KEY ([priority_id]) REFERENCES [dbo].[priority] ([id]),
    CONSTRAINT [FK_ticket_status] FOREIGN KEY ([status_id]) REFERENCES [dbo].[status] ([id])
);


GO
CREATE NONCLUSTERED INDEX [idx_ticket_priority]
    ON [dbo].[ticket]([priority_id] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_ticket_created_at]
    ON [dbo].[ticket]([created_at] ASC);

