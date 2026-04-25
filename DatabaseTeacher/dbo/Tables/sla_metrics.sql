CREATE TABLE [dbo].[sla_metrics] (
    [id]                  INT          IDENTITY (1, 1) NOT NULL,
    [ticket_id]           INT          NULL,
    [first_response_time] INT          NULL,
    [resolution_time]     INT          NULL,
    [breach_at]           DATETIME     NULL,
    [priority_sla_hours]  INT          NULL,
    [sla_status]          VARCHAR (20) NULL,
    [calculated_at]       DATETIME     DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([id] ASC),
    CHECK ([sla_status]='в работе' OR [sla_status]='нарушен' OR [sla_status]='выполнен'),
    CONSTRAINT [FK_sla_ticket] FOREIGN KEY ([ticket_id]) REFERENCES [dbo].[ticket] ([id]) ON DELETE CASCADE,
    UNIQUE NONCLUSTERED ([ticket_id] ASC)
);

