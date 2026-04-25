CREATE TABLE [dbo].[department] (
    [id]                   INT           IDENTITY (1, 1) NOT NULL,
    [name]                 VARCHAR (150) NOT NULL,
    [parent_department_id] INT           NULL,
    [level]                INT           DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_department_parent] FOREIGN KEY ([parent_department_id]) REFERENCES [dbo].[department] ([id])
);

