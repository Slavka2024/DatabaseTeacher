CREATE   VIEW v_ticket_full AS
SELECT 
    t.id,
    t.title,
    t.description,
    t.created_at,
    t.closed_at,
    p.name AS priority_name,
    p.sla_hours,
    s.name AS status_name,
    c.name AS category_name,
    assignee.full_name AS assignee_name,
    creator.full_name AS creator_name,
    DATEDIFF(HOUR, t.created_at, t.closed_at) AS resolution_hours,
    CASE 
        WHEN DATEDIFF(HOUR, t.created_at, t.closed_at) <= p.sla_hours THEN 'выполнен'
        WHEN t.closed_at IS NULL THEN 'в работе'
        ELSE 'нарушен'
    END AS sla_status
FROM ticket t
JOIN priority p ON t.priority_id = p.id
JOIN [status] s ON t.status_id = s.id
JOIN category c ON t.category_id = c.id
LEFT JOIN employee assignee ON t.assignee_id = assignee.id
LEFT JOIN employee creator ON t.creator_id = creator.id;
