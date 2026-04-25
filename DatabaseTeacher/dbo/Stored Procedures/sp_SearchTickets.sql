CREATE   PROCEDURE sp_SearchTickets
    @ColumnName VARCHAR(50),
    @SearchValue VARCHAR(100)
AS
BEGIN
    DECLARE @SQL NVARCHAR(MAX);
    
    SET @SQL = N'SELECT id, title, created_at, closed_at  
                 FROM ticket 
                 WHERE ' + QUOTENAME(@ColumnName) + N' LIKE ''%'' + @Value + ''%''';
    
    EXEC sp_executesql @SQL, N'@Value VARCHAR(100)', @SearchValue;
END
