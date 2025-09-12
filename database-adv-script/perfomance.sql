-- Initial Complex Query: all bookings with user, property, and payment details
EXPLAIN ANALYZE
SELECT b.id AS booking_id,
       b.booking_date,
       u.id AS user_id,
       u.name AS user_name,
       u.email,
       p.id AS property_id,
       p.name AS property_name,
       p.location,
       pay.id AS payment_id,
       pay.amount,
       pay.status
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON b.id = pay.booking_id
WHERE b.booking_date >= '2024-01-01'
  AND pay.status = 'completed';

-- Refactored Optimized Query: fewer columns, LEFT JOIN, and same filters
EXPLAIN ANALYZE
SELECT b.id AS booking_id,
       b.booking_date,
       u.name AS user_name,
       p.name AS property_name,
       pay.amount
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
LEFT JOIN payments pay ON b.id = pay.booking_id
WHERE b.booking_date >= '2024-01-01'
  AND (pay.status = 'completed' OR pay.status IS NULL);
