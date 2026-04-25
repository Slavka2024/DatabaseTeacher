CREATE   VIEW v_employee_stats AS
SELECT 
    e.id,
    e.full_name,
    COUNT(t.id) AS total_tickets,
    SUM(CASE WHEN t.status_id = 5 THEN 1 ELSE 0 END) AS closed_tickets,
    AVG(DATEDIFF(HOUR, t.created_at, t.closed_at)) AS avg_resolution_hours
FROM employee e
LEFT JOIN ticket t ON t.assignee_id = e.id
GROUP BY e.id, e.full_name;
