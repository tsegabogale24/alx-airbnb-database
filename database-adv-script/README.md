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
# SQL Subqueries

## Objective
Practice writing both correlated and non-correlated subqueries.

## Queries
1. **Non-Correlated Subquery**  
   - Find all properties where the average rating is greater than 4.0.  

2. **Correlated Subquery**  
   - Find all users who have made more than 3 bookings.  

## Notes
- Subqueries are nested queries used inside another query.  
- **Non-Correlated** → independent (runs first, result passed to outer query).  
- **Correlated** → depends on outer query row (executes per row).  
