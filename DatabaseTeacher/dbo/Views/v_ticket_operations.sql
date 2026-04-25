CREATE   VIEW v_ticket_operations AS
WITH ops AS (
    SELECT 
        ticket_id,
        COUNT(*) AS op_count,
        MIN(created_at) AS first_op_at,
        MAX(created_at) AS last_op_at
    FROM operation
    GROUP BY ticket_id
)
SELECT 
    t.id,
    t.title,
    ops.op_count,
    ops.first_op_at,
    ops.last_op_at
FROM ticket t
LEFT JOIN ops ON t.id = ops.ticket_id;
