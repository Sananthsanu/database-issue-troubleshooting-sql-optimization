-- Optimized version of the reporting query
-- Uses ANSI join syntax and benefits from indexing

SELECT c.name, SUM(o.amount)
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_date >= '2024-01-01'
GROUP BY c.name;
