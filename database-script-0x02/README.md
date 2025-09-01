# AirBnB Database Seed Data

This directory contains **SQL scripts to populate the AirBnB database** with sample data.

## Files
- **seed.sql** → Inserts sample records into all tables (`User`, `Property`, `Booking`, `Payment`, `Review`, `Message`).

## Sample Data Highlights
- **Users**: 4 sample users (2 hosts, 2 guests).
- **Properties**: Each host has at least one property.
- **Bookings**: Guests book properties, with realistic dates and status values.
- **Payments**: Linked to confirmed bookings.
- **Reviews**: Guests leave reviews for properties they booked.
- **Messages**: Demonstrates guest-host communication.

## Usage
1. Ensure the schema (`schema.sql` from `database-script-0x01/`) is already created.
2. Run:
   ```bash
   psql -U <username> -d <database> -f seed.sql
