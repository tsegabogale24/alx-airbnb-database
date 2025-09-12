-- Indexes for optimization in Airbnb database

-- Users table
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_id ON users(id);

-- Bookings table
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_date ON bookings(booking_date);

-- Properties table
CREATE INDEX idx_properties_host_id ON properties(host_id);
CREATE INDEX idx_properties_location ON properties(location);

-- Extra index for ORDER BY optimization
CREATE INDEX idx_bookings_date_order ON bookings(booking_date DESC);
