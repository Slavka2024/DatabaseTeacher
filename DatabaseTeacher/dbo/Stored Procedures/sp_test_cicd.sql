CREATE PROCEDURE dbo.sp_test_cicd
AS
BEGIN
    SET NOCOUNT ON;
    SELECT 'Deploy OK! CI/CD works.' AS Message;
END