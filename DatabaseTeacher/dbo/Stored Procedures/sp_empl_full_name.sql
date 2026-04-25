create   procedure sp_empl_full_name
@empl_id int
as
begin
	set nocount on;
	select full_name from employee
	where id = @empl_id;
end
