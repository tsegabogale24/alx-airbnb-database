# Normalization to 3NF — AirBnB Database

## Objective
Apply normalization principles so the AirBnB schema is in **Third Normal Form (3NF)**.

This document:
- Reviews the schema.
- Identifies redundancies or violations of normalization principles.
- Explains adjustments to achieve 3NF.

---

## 1. Review of Original Schema
Entities:
- **User**
- **Property**
- **Booking**
- **Payment**
- **Review**
- **Message**

Each entity has a UUID primary key, and relationships are defined with foreign keys.

---

## 2. Normalization Checklist

A relation is in **3NF** if:
1. It is in **1NF** (all attributes atomic, no repeating groups).
2. It is in **2NF** (no partial dependency on part of a composite key).
3. It is in **3NF** (no transitive dependency — all non-key attributes depend only on the key).

Since each table uses a single-column primary key (`UUID`), 2NF is satisfied. The main risks are **derived data** and **transitive dependencies**.

---

## 3. Issues Found

1. **Booking.total_price**  
   - This is a **derived attribute**. It depends on `Property.pricepernight` and the difference between `end_date` and `start_date`.  
   - Storing it introduces update anomalies (e.g., if property price changes).  
   - This violates 3NF because `total_price` is transitively dependent on the primary key.

2. **Enums stored directly** (`role`, `status`, `payment_method`)  
   - These are not a violation of 3NF, but replacing them with lookup tables could improve flexibility.

3. **Message structure**  
   - Valid in 3NF. Optional enhancement: introduce a `Conversation` entity for grouping.

---

## 4. Adjustments for 3NF

- **Remove `Booking.total_price` as a stored attribute.**  
  Instead, introduce a snapshot field:

  - `price_per_night_at_booking` (captures the nightly rate at the time of booking).  
  - `nights` can be derived as `(end_date - start_date)`.

- **Optional improvements**:  
  - Replace enums with lookup tables if extensibility is required.  
  - Add `Conversation` entity for messaging if grouping is useful.

---

## 5. Revised Schema (High-Level)

- **User**(user_id, first_name, last_name, email, password_hash, phone_number, role, created_at)  
- **Property**(property_id, host_id → User, name, description, location, pricepernight, created_at, updated_at)  
- **Booking**(booking_id, property_id → Property, user_id → User, start_date, end_date, price_per_night_at_booking, status, created_at)  
- **Payment**(payment_id, booking_id → Booking, amount, payment_date, payment_method)  
- **Review**(review_id, property_id → Property, user_id → User, rating, comment, created_at)  
- **Message**(message_id, sender_id → User, recipient_id → User, message_body, sent_at)  

---

## 6. Example: Deriving `total_price`

Instead of storing `total_price`, compute it when needed:

```sql
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.price_per_night_at_booking,
    (DATE_PART('day', b.end_date::timestamp - b.start_date::timestamp) * b.price_per_night_at_booking) AS total_price
FROM booking b;
