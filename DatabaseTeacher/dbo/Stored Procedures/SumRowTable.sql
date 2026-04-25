create   procedure SumRowTable
@NameTable varchar(30),
@CountRow int output
as
begin
  set nocount on;
  declare @sql nvarchar(Max);
  
  set @Sql=N'select @CountRow=count(*) from ' + quotename(@nametable);
  exec sp_executesql @sql, N'@CountRow int output', @CountRow output;
end
