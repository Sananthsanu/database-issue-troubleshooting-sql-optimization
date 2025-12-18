# Database Issue Troubleshooting & SQL Performance Optimization

## Overview
This project demonstrates a real-world database support scenario видно where a reporting query was performing inefficiently due to poor SQL design and missing indexes.

The goal was to simulate how a Database Support Engineer or DBA identifies performance bottlenecks, analyzes execution plans, and applies SQL optimizations to improve query performance.

Although MySQL is used for this lab, the concepts applied (execution plan analysis, indexing, join optimization) are directly applicable to Oracle and other enterprise databases.

---

## Real-World Scenario
A company’s sales reporting dashboard was experiencing slow load times. Business users reported that customer sales reports were taking too long to generate.

As part of the database support team, my responsibility was to:
- Investigate the slow query
- Identify the root cause using execution plans
- Optimize the query
- Validate the improvement

---

## Environment
- OS: Linux (Kali Linux on VMware)
- Database: MySQL 8.x
- Tools: MySQL CLI
- Concepts: SQL, Indexing, Joins, Execution Plans

---

## Database Schema
The database contains two tables:
- `customers` – stores customer details
- `orders` – stores transactional order data

Each customer can have multiple orders.

📸 **Schema & setup screenshots**  
See: `screenshots/db1.png`, `screenshots/db2.png`, `screenshots/db3.png`

---

## Problem Statement
A reporting query that calculates total sales per customer was identified as a performance bottleneck.

### Issues observed:
- Full table scans on the orders table
- Missing index on join and filter columns
- Legacy join syntax

📸 **Initial query and performance observation**  
See: `screenshots/db4.png`

---

## Slow Query (Before Optimization)
``sql
SELECT c.name, SUM(o.amount)
FROM customers c, orders o
WHERE c.customer_id = o.customer_id
AND o.order_date >= '2024-01-01'
GROUP BY c.name;
Execution Plan Analysis (Before Optimization)
Using EXPLAIN, the database execution plan showed:
type = ALL indicating full table scans
No effective index usage
Temporary tables used for aggregation
📸 Execution plan showing full scan
See: screenshots/db5.png
Optimization Approach



1. Index Creation
A composite index was created on the orders table to support both the join condition and the date filter.
CREATE INDEX idx_orders_customer_date
ON orders(customer_id, order_date);
📸 Index creation
See: screenshots/db6.png



3. Query Rewrite (ANSI JOIN)
The query was rewritten using ANSI join syntax to improve readability and optimizer efficiency.
SELECT c.name, SUM(o.amount)
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_date >= '2024-01-01'
GROUP BY c.name;
📸 Optimized query execution
See: screenshots/db7.png


Execution Plan Analysis (After Optimization)
Post-optimization execution plan analysis showed:
Index availability recognized by the optimizer
Improved join strategy
Reduced query cost
Due to the small dataset used in this lab, the optimizer chose a full scan as it was more cost-effective. In production-scale datasets, the same query would utilize the composite index.
📸 Post-optimization execution plan
See: screenshots/db8.png, screenshots/db9.png


Results & Impact
Identified root cause of slow query using execution plans
Applied indexing and SQL best practices
Improved query scalability and maintainability
Demonstrated real-world database troubleshooting workflow
Key Learnings
How to analyze slow SQL queries using execution plans
Importance of proper indexing strategy
Benefits of ANSI join syntax
Understanding cost-based query optimizers
