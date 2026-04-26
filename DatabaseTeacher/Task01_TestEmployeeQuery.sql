-- Тестовый запрос: сотрудники с должностями и отделами
SELECT 
    e.full_name,
    e.email,
    p.name AS position_name,
    d.name AS department_name
FROM employee e
LEFT JOIN position p ON e.position_id = p.id
LEFT JOIN department d ON e.department_id = d.id
ORDER BY e.full_name;