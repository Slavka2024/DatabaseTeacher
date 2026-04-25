CREATE TABLE [dbo].[ticket_dependencies] (
    [id]               INT          IDENTITY (1, 1) NOT NULL,
    [parent_ticket_id] INT          NULL,
    [child_ticket_id]  INT          NULL,
    [relation_type]    VARCHAR (50) NULL,
    [created_at]       DATETIME     DEFAULT (getdate()) NULL,
    [created_by]       INT          NULL,
    PRIMARY KEY CLUSTERED ([id] ASC),
    CHECK ([relation_type]='порождает' OR [relation_type]='дубликат' OR [relation_type]='связана' OR [relation_type]='блокирует'),
    CONSTRAINT [CHK_ticket_dependencies_parent_child] CHECK ([parent_ticket_id]<>[child_ticket_id]),
    CONSTRAINT [FK_dependencies_child] FOREIGN KEY ([child_ticket_id]) REFERENCES [dbo].[ticket] ([id]),
    CONSTRAINT [FK_dependencies_created_by] FOREIGN KEY ([created_by]) REFERENCES [dbo].[employee] ([id]),
    CONSTRAINT [FK_dependencies_parent] FOREIGN KEY ([parent_ticket_id]) REFERENCES [dbo].[ticket] ([id]),
    CONSTRAINT [UQ_ticket_dependencies] UNIQUE NONCLUSTERED ([parent_ticket_id] ASC, [child_ticket_id] ASC, [relation_type] ASC)
);

