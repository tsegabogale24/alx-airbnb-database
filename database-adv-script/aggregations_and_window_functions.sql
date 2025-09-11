-- 1. Aggregation: total bookings per user
SELECT u.id AS user_id, 
       u.name, 
       COUNT(b.id) AS total_bookings
FROM users u
LEFT JOIN bookings b ON u.id = b.user_id
GROUP BY u.id, u.name
ORDER BY total_bookings DESC;

-- 2. Window Function: rank properties by booking count
SELECT p.id AS property_id, 
       p.name, 
       COUNT(b.id) AS total_bookings,
       RANK() OVER (ORDER BY COUNT(b.id) DESC) AS booking_rank
FROM properties p
LEFT JOIN bookings b ON p.id = b.property_id
GROUP BY p.id, p.name
ORDER BY booking_rank;
