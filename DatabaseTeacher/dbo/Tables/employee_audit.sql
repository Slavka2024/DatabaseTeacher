CREATE TABLE [dbo].[employee_audit] (
    [id]         INT           IDENTITY (1, 1) NOT NULL,
    [action]     VARCHAR (10)  NULL,
    [full_name]  VARCHAR (255) NULL,
    [old_name]   VARCHAR (255) NULL,
    [changed_at] DATETIME      DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

