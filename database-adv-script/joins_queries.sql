-- joins_queries.sql

-- 1. INNER JOIN
SELECT b.id AS booking_id, b.property_id, b.date, 
       u.id AS user_id, u.name, u.email
FROM bookings b
INNER JOIN users u ON b.user_id = u.id;

-- 2. LEFT JOIN
SELECT p.id AS property_id, p.name, p.location,
       r.id AS review_id, r.rating, r.comment
FROM properties p
LEFT JOIN reviews r ON p.id = r.property_id;

-- 3. FULL OUTER JOIN
SELECT u.id AS user_id, u.name, u.email,
       b.id AS booking_id, b.property_id, b.date
FROM users u
FULL OUTER JOIN bookings b ON u.id = b.user_id;
