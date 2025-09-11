# SQL Joins Queries

## Objective
Practice writing complex SQL queries with different types of joins.

## Queries
1. **INNER JOIN** – Retrieve all bookings and their respective users.  
2. **LEFT JOIN** – Retrieve all properties and their reviews, including properties with no reviews.  
3. **FULL OUTER JOIN** – Retrieve all users and all bookings, even if they are not linked.

## Notes
- Some databases (e.g., MySQL) do not support `FULL OUTER JOIN`. In such cases, use `LEFT JOIN` + `RIGHT JOIN` with `UNION`.
- Tested on PostgreSQL.
