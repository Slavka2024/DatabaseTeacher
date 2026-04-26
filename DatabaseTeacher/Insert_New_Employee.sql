-- Добавление нового сотрудника
-- Автор: Slavka2024
-- Дата: 26.04.2026

INSERT INTO employee (full_name, email, position_id, department_id)
VALUES (
    'Петров Петр Петрович',
    'petrov.test@company.ru',
    1,  -- Оператор 1-й линии
    1   -- ИТ-поддержка
);
GO

-- Проверка, что сотрудник добавился
SELECT 
    e.id,
    e.full_name,
    e.email,
    p.name AS position,
    d.name AS department
FROM employee e
LEFT JOIN position p ON e.position_id = p.id
LEFT JOIN department d ON e.department_id = d.id
WHERE e.full_name = 'Петров Петр Петрович';
GO