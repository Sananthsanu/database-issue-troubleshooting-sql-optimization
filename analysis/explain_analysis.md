## Execution Plan Analysis

The EXPLAIN command was used to analyze how the database executes the reporting query.

### Before Optimization
- Full table scans were observed on the orders table.
- No effective index usage.
- Temporary tables used for aggregation.

### After Optimization
- Index availability confirmed by the optimizer.
- Improved join strategy.
- Better scalability for larger datasets.

Although the optimizer chose a full scan in this lab due to small data volume, the indexing strategy ensures efficient execution in production environments.
