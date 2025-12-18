# Database Issue Troubleshooting & SQL Performance Optimization

## 📌 Overview
This project demonstrates a **real-world database support scenario** where a reporting SQL query was performing inefficiently due to missing indexes and non-optimized SQL joins.

The goal of this project is to simulate how a **Database Support Engineer / DBA** investigates slow queries, analyzes execution plans, applies SQL optimizations, and validates improvements.

Although **MySQL** is used for this lab, the same concepts directly apply to **Oracle Database**, which follows similar optimization principles.

---

## 🏢 Real-World Scenario
A company’s **sales reporting dashboard** was experiencing slow performance.  
Business users reported delays when generating customer sales reports.

As part of the database support team, my responsibilities were to:
- Identify the slow SQL query
- Analyze execution plans
- Optimize the query using indexing and SQL best practices
- Validate performance improvement

---

## 🛠️ Environment
- **Operating System:** Linux (Kali Linux – VMware)
- **Database:** MySQL 8.x
- **Tools:** MySQL CLI
- **Concepts:** SQL, Indexing, Joins, Execution Plans

---

## 🗄️ Database Setup
The database consists of two tables:
- `customers` – stores customer details
- `orders` – stores transactional order data

Each customer can have multiple orders.

### 📸 Database Setup Screenshots
![MySQL Service Running](screenshots/db1.png)
![Database and Tables Created](screenshots/db2.png)
![Data Inserted](screenshots/db3.png)

---

## ❗ Problem Statement
A reporting query that calculates total sales per customer was identified as a **performance bottleneck**.

### Issues Identified:
- Full table scans on the `orders` table
- Missing index on join and filter columns
- Legacy (non-ANSI) join syntax

### 📸 Slow Query Execution
![Slow Query Output](screenshots/db4.png)

---

## 🐢 Slow Query (Before Optimization)
sql
SELECT c.name, SUM(o.amount)
FROM customers c, orders o
WHERE c.customer_id = o.customer_id
AND o.order_date >= '2024-01-01'
GROUP BY c.name;
