# PostgreSQL Overview

## 1. What is PostgreSQL?
PostgreSQL is:
- **Open-source** and free to use.
- A **relational database management system (RDBMS)**.
- Designed to **store, retrieve, and manage data efficiently**.
- Handles **complex queries** and **large datasets** smoothly.

---

## 2. What is the purpose of a database schema in PostgreSQL?
A **schema** acts as a plan or blueprint of the database structure, including:
- **Tables**: Store the data.
- **Fields/Columns**: Define specific data points (e.g., name, age).
- **Data Types**: Specify the kind of data (e.g., text, number).
- **Relationships**: Link data between tables for better organization.

**Example**:  
A "Customers" table has fields like customer_id, name, and email.

---

## 3. Primary Key vs. Foreign Key

### Primary Key:
- **Uniquely identifies** a record in a table.
- **No duplicate values** are allowed.

**Example**:  
`customer_id` in a "Customers" table is a primary key.

### Foreign Key:
- **Links** one table’s field to the primary key in another table.
- **Maintains relationships** between tables.

**Example**:  
An `order_id` in an "Orders" table refers to a `customer_id` from the "Customers" table.

---

## 4. Difference Between VARCHAR and CHAR

- **VARCHAR**: Stores **variable-length** text.  
  **Example**: A name that can be between 1 to 50 characters.
  
- **CHAR**: Stores **fixed-length** text by adding spaces to meet the length.  
  **Example**: A 5-character code, like "A1", becomes "A1   ".

---

## 5. What is the purpose of the WHERE clause?

- **Filters records** in a query based on a condition.
- **Only matching rows** are included in the result.

**Example**:  
`SELECT * FROM Customers WHERE country = 'USA';`

---

## 6. What are LIMIT and OFFSET used for?

- **LIMIT**: Sets a **maximum number** of rows to return.
- **OFFSET**: Skips a specified **number of rows** before showing results. Useful for **pagination**.

**Example**:  
`SELECT * FROM Orders LIMIT 10 OFFSET 20;`  
(Returns 10 rows starting from the 21st record.)

---

## 7. How to modify data using UPDATE statements?

- The `UPDATE` statement **changes existing records** in a table.
- Use a **WHERE clause** to specify which rows to update.

**Example**:  
`UPDATE Customers SET email = 'new@example.com' WHERE customer_id = 1;`

---

## 8. What is the JOIN operation and how does it work?

- **JOIN** combines rows from two or more tables based on related columns.
- **Types of JOINs**:
  - **INNER JOIN**: Returns matching rows from both tables.
  - **LEFT JOIN**: Returns all rows from the left table and matching rows from the right.
  - **RIGHT JOIN**: Returns all rows from the right table and matching rows from the left.

**Example**:  
`SELECT Orders.order_id, Customers.name FROM Orders INNER JOIN Customers ON Orders.customer_id = Customers.customer_id;`

---

## 9. What is the GROUP BY clause and its role?

- **Groups records** by specific column values.
- Often used with **aggregate functions** to summarize data.

**Example**:  
`SELECT country, COUNT(*) FROM Customers GROUP BY country;`  
(Counts the number of customers per country.)

---

## 10. How to calculate aggregate functions like COUNT, SUM, and AVG?

- **COUNT**: Counts the total number of records.  
  Example: `SELECT COUNT(*) FROM Orders;`

- **SUM**: Adds all values in a column.  
  Example: `SELECT SUM(price) FROM Orders;`

- **AVG**: Calculates the average value.  
  Example: `SELECT AVG(price) FROM Orders;`
