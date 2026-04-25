CREATE   VIEW v_sla_summary AS
SELECT 
    p.name AS priority_name,
    COUNT(t.id) AS total_tickets,
    SUM(CASE WHEN t.closed_at IS NOT NULL THEN 1 ELSE 0 END) AS closed_tickets,
    AVG(CASE 
            WHEN t.closed_at IS NOT NULL 
            THEN DATEDIFF(HOUR, t.created_at, t.closed_at) 
            ELSE NULL 
        END) AS avg_resolution_hours,
    AVG(p.sla_hours) AS sla_hours
FROM ticket t
JOIN priority p ON t.priority_id = p.id
GROUP BY p.name;
