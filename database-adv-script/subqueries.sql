-- subqueries.sql

-- 1. Non-Correlated Subquery: properties with avg rating > 4.0
SELECT p.id, p.name, p.location
FROM properties p
WHERE p.id IN (
    SELECT r.property_id
    FROM reviews r
    GROUP BY r.property_id
    HAVING AVG(r.rating) > 4.0
);

-- 2. Correlated Subquery: users with more than 3 bookings
SELECT u.id, u.name, u.email
FROM users u
WHERE (
    SELECT COUNT(*)
    FROM bookings b
    WHERE b.user_id = u.id
) > 3;
