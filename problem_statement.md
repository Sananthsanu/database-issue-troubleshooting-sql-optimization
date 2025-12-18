# 📄 problem_statement.md

```md
## Problem Statement

The sales reporting query responsible for calculating total revenue per customer was performing inefficiently.

The query caused full table scans on the orders table due to missing indexes and non-optimized join syntax. In a production environment, this would lead to slow report generation, increased CPU usage, and poor user experience.

The objective was to analyze the query execution plan, identify the root cause, and apply appropriate SQL optimizations.
