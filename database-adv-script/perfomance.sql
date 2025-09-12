-- Initial Complex Query: retrieves all bookings with user, property, and payment details

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
JOIN payments pay ON b.id = pay.booking_id;

-- Refactored Query: optimized by selecting only necessary columns
-- and ensuring indexed join columns (user_id, property_id, booking_id) are used
EXPLAIN ANALYZE
SELECT b.id AS booking_id,
       b.booking_date,
       u.name AS user_name,
       p.name AS property_name,
       pay.amount
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
LEFT JOIN payments pay ON b.id = pay.booking_id;
