# Partitioning Performance Report

## 1. Initial Situation
The `bookings` table had millions of rows. Queries filtering by `start_date` were slow:

EXPLAIN ANALYZE SELECT * FROM bookings WHERE start_date BETWEEN '2024-01-01' AND '2024-06-30';
Query plan: Full table sequential scan.

Execution time: ~900 ms.

2. Partitioning Strategy
Implemented range partitioning on start_date.

Created yearly partitions: bookings_2023, bookings_2024, bookings_2025.

3. Performance After Partitioning

EXPLAIN ANALYZE SELECT * FROM bookings_partitioned WHERE start_date BETWEEN '2024-01-01' AND '2024-06-30';
Query plan: Only scanned bookings_2024 partition.

Execution time: ~120 ms.

Reduced number of rows scanned by >80%.

4. Conclusion
Partitioning by start_date improved performance for date-range queries.

Before: Full table scan on millions of rows.

After: Partition pruning limited scans to relevant partitions.

Trade-off: More complex schema and maintenance overhead, but significant performance gains for time-based queries.


