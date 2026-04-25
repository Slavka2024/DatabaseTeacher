CREATE   VIEW v_active_tickets AS
SELECT 
    t.id, 
    t.title, 
    s.name AS status_name, 
    p.name AS priority_name, 
    t.assignee_id,
    e.full_name AS assignee_name
FROM ticket t
JOIN [status] s ON t.status_id = s.id
JOIN priority p ON t.priority_id = p.id
LEFT JOIN employee e ON t.assignee_id = e.id
WHERE s.name IN ('Новая', 'В работе', 'Назначена', 'Ожидание ответа');
