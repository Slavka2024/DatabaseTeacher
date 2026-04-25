CREATE TABLE [dbo].[employee_ratings] (
    [id]                INT            IDENTITY (1, 1) NOT NULL,
    [employee_id]       INT            NULL,
    [rating_date]       DATE           NOT NULL,
    [rating_score]      DECIMAL (3, 2) NULL,
    [tickets_resolved]  INT            DEFAULT ((0)) NULL,
    [avg_response_time] INT            NULL,
    [feedback_score]    INT            NULL,
    [created_at]        DATETIME       DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([id] ASC),
    CHECK ([feedback_score]>=(1) AND [feedback_score]<=(10)),
    CHECK ([rating_score]>=(1.0) AND [rating_score]<=(5.0)),
    CONSTRAINT [FK_ratings_employee] FOREIGN KEY ([employee_id]) REFERENCES [dbo].[employee] ([id]) ON DELETE CASCADE,
    CONSTRAINT [UQ_ratings_employee_date] UNIQUE NONCLUSTERED ([employee_id] ASC, [rating_date] ASC)
);

