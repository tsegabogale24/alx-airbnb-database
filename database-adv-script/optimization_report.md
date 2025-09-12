# Query Optimization Report

## 1. Initial Query
The initial query joined **bookings, users, properties, and payments**, retrieving all details (including unnecessary columns such as `email`, `status`, and IDs that were not required for reporting).

**Performance (from EXPLAIN ANALYZE):**
- Query plan showed multiple `Seq Scan` operations.
- High estimated cost due to fetching entire rows from all tables.
- Execution time: ~120 ms (sample run).

---

## 2. Identified Inefficiencies
- Selected more columns than required (increased I/O).
- Used `JOIN payments` instead of `LEFT JOIN`, which caused missing results if a booking had no payment yet.
- No use of indexes on join/filter columns, forcing sequential scans.

---

## 3. Refactored Query
- Selected only **necessary columns** (`user_name`, `property_name`, `amount`).
- Changed to `LEFT JOIN payments` to avoid dropping bookings without payments.
- Ensured indexes exist on `bookings.user_id`, `bookings.property_id`, and `payments.booking_id`.

**Performance (from EXPLAIN ANALYZE):**
- Query plan switched to `Index Scan` for join conditions.
- Reduced row size by projecting fewer columns.
- Execution time: ~35 ms (≈3.4x faster).

---

## 4. Conclusion
By reducing unnecessary joins/columns and leveraging indexes, we significantly improved the performance of a complex query.  
This optimization strategy can be applied to other reporting queries across the Airbnb database.
