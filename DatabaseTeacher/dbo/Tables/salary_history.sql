CREATE TABLE [dbo].[salary_history] (
    [id]             INT             IDENTITY (1, 1) NOT NULL,
    [employee_id]    INT             NULL,
    [salary]         DECIMAL (10, 2) NOT NULL,
    [effective_date] DATE            NOT NULL,
    [changed_at]     DATETIME        DEFAULT (getdate()) NULL,
    [changed_by]     INT             NULL,
    [comment]        TEXT            NULL,
    PRIMARY KEY CLUSTERED ([id] ASC),
    CHECK ([salary]>(0)),
    CONSTRAINT [FK_salary_history_changed_by] FOREIGN KEY ([changed_by]) REFERENCES [dbo].[employee] ([id]),
    CONSTRAINT [FK_salary_history_employee] FOREIGN KEY ([employee_id]) REFERENCES [dbo].[employee] ([id]) ON DELETE CASCADE,
    CONSTRAINT [UQ_salary_history_employee_date] UNIQUE NONCLUSTERED ([employee_id] ASC, [effective_date] ASC)
);

