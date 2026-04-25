CREATE TABLE [dbo].[time_analytics] (
    [id]              INT             IDENTITY (1, 1) NOT NULL,
    [analytics_date]  DATE            NOT NULL,
    [metric_name]     VARCHAR (100)   NOT NULL,
    [metric_value]    NUMERIC (18, 2) NULL,
    [dimension]       VARCHAR (50)    NULL,
    [dimension_value] INT             NULL,
    PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [UQ_time_analytics] UNIQUE NONCLUSTERED ([analytics_date] ASC, [metric_name] ASC, [dimension] ASC, [dimension_value] ASC)
);

