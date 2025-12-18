-- Slow query used in the reporting system
-- This query performs aggregation using legacy join syntax
-- and does not utilize indexing efficiently

SELECT c.name, SUM(o.amount)
FROM customers c, orders o
WHERE c.customer_id = o.customer_id
AND o.order_date >= '2024-01-01'
GROUP BY c.name;
