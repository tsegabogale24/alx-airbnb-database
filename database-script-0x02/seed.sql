-- Seed data for AirBnB Database
-- File: seed.sql

-- USERS
INSERT INTO "user" (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
    ('11111111-1111-1111-1111-111111111111', 'Alice', 'Johnson', 'alice@example.com', 'hash1', '1234567890', 'guest'),
    ('22222222-2222-2222-2222-222222222222', 'Bob', 'Smith', 'bob@example.com', 'hash2', '2345678901', 'host'),
    ('33333333-3333-3333-3333-333333333333', 'Carol', 'Williams', 'carol@example.com', 'hash3', '3456789012', 'host'),
    ('44444444-4444-4444-4444-444444444444', 'David', 'Brown', 'david@example.com', 'hash4', '4567890123', 'guest');

-- PROPERTIES
INSERT INTO property (property_id, host_id, name, description, location, pricepernight)
VALUES
    ('aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaa1', '22222222-2222-2222-2222-222222222222', 'Sunny Apartment', '2-bedroom apartment with balcony', 'New York', 120.00),
    ('aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaa2', '33333333-3333-3333-3333-333333333333', 'Cozy Cottage', 'Rustic cottage near the lake', 'Denver', 85.00);

-- BOOKINGS
INSERT INTO booking (booking_id, property_id, user_id, start_date, end_date, price_per_night_at_booking, status)
VALUES
    ('bbbbbbb1-bbbb-bbbb-bbbb-bbbbbbbbbbb1', 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaa1', '11111111-1111-1111-1111-111111111111', '2025-09-10', '2025-09-15', 120.00, 'confirmed'),
    ('bbbbbbb2-bbbb-bbbb-bbbb-bbbbbbbbbbb2', 'aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaa2', '44444444-4444-4444-4444-444444444444', '2025-10-01', '2025-10-05', 85.00, 'pending');

-- PAYMENTS
INSERT INTO payment (payment_id, booking_id, amount, payment_method)
VALUES
    ('ppppppp1-pppp-pppp-pppp-ppppppppppp1', 'bbbbbbb1-bbbb-bbbb-bbbb-bbbbbbbbbbb1', 600.00, 'credit_card');

-- REVIEWS
INSERT INTO review (review_id, property_id, user_id, rating, comment)
VALUES
    ('rrrrrrr1-rrrr-rrrr-rrrr-rrrrrrrrrrr1', 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaa1', '11111111-1111-1111-1111-111111111111', 5, 'Fantastic place, great host!');

-- MESSAGES
INSERT INTO message (message_id, sender_id, recipient_id, message_body)
VALUES
    ('mmmmmmm1-mmmm-mmmm-mmmm-mmmmmmmmmmm1', '11111111-1111-1111-1111-111111111111', '22222222-2222-2222-2222-222222222222', 'Hi Bob, is the apartment available for next month?'),
    ('mmmmmmm2-mmmm-mmmm-mmmm-mmmmmmmmmmm2', '22222222-2222-2222-2222-222222222222', '11111111-1111-1111-1111-111111111111', 'Yes, it is available!');
