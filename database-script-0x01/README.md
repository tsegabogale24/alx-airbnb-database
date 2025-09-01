# AirBnB Database Schema

This directory contains the **SQL schema definition** for the AirBnB database project.

## Files
- **schema.sql** → Defines the database schema using `CREATE TABLE` statements with constraints and indexes.

## Entities
1. **User**
   - Stores guest, host, and admin accounts.
   - Constraints: unique email, role check.

2. **Property**
   - Represents listings created by hosts.
   - Linked to a host (`User`).

3. **Booking**
   - Represents a reservation made by a guest.
   - Stores `price_per_night_at_booking` (snapshot).
   - Status constrained to `pending`, `confirmed`, `canceled`.

4. **Payment**
   - Linked to a booking.
   - Records amount, payment method, and timestamp.

5. **Review**
   - Linked to property and guest.
   - Rating range 1–5.

6. **Message**
   - Direct messages between users (sender and recipient).

## Indexing
Indexes are created on:
- `User.email`
- Foreign keys for quick joins (`property.host_id`, `booking.property_id`, etc.)

## Notes
- Database normalized to **3NF**.
- No redundant or derived fields stored (`total_price` is derived in queries).
- Enums are implemented using `CHECK` constraints for portability.
