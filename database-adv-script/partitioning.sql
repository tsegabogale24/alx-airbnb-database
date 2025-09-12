-- Step 1: Create a new partitioned bookings table
CREATE TABLE bookings_partitioned (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    status VARCHAR(50)
) PARTITION BY RANGE (start_date);

-- Step 2: Create partitions by year
CREATE TABLE bookings_2023 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE bookings_2024 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE bookings_2025 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- Step 3: Insert data (example only, in real case migrate from old bookings table)
-- INSERT INTO bookings_partitioned (user_id, property_id, start_date, end_date, status)
-- SELECT user_id, property_id, start_date, end_date, status FROM bookings;

-- Step 4: Test performance using EXPLAIN ANALYZE
EXPLAIN ANALYZE
SELECT * FROM bookings_partitioned
WHERE start_date BETWEEN '2024-01-01' AND '2024-06-30';
