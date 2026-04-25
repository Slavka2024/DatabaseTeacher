CREATE TABLE [dbo].[priority] (
    [id]        INT          IDENTITY (1, 1) NOT NULL,
    [name]      VARCHAR (50) NOT NULL,
    [sla_hours] INT          DEFAULT ((24)) NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

