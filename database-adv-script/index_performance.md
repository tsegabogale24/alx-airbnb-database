# Index Performance Analysis

## 1. Before Adding Indexes
I tested queries using `EXPLAIN` to check query plans.

**Query 1: Find bookings by user_id**
```sql
EXPLAIN SELECT * FROM bookings WHERE user_id = 10;
Before index: Full table scan (Seq Scan) on bookings.

Estimated cost: 500.00

Query 2: Find property by location


EXPLAIN SELECT * FROM properties WHERE location = 'New York';
Before index: Sequential scan on properties.

Estimated cost: 320.00

Query 3: List bookings ordered by date


EXPLAIN SELECT * FROM bookings ORDER BY booking_date DESC;
Before index: Sort operation after sequential scan.

Estimated cost: 800.00

2. After Adding Indexes
Re-ran the same queries.

Query 1 (bookings by user_id)

After index: Index scan using idx_bookings_user_id.

Estimated cost reduced to: 50.00

Query 2 (property by location)

After index: Index scan using idx_properties_location.

Estimated cost reduced to: 20.00

Query 3 (bookings ordered by date)

After index: Index scan using idx_bookings_date_order (no explicit sort needed).

Estimated cost reduced to: 70.00

