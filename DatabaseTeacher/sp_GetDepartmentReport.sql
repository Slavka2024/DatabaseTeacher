CREATE OR ALTER PROCEDURE sp_GetDepartmentReport
AS
BEGIN
    SELECT
        d.name AS DepartmentName,
        COUNT(e.id) AS EmployeeCount
    FROM department d
    LEFT JOIN employee e ON d.id = e.department_id
    GROUP BY d.name
    ORDER BY EmployeeCount DESC;
END
GO