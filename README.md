# FoodserviceDB SQL Project

## Project Overview

This project simulates the role of a database consultant for a food service company. The objective is to:

- Create a database named **FoodserviceDB**.
- Import four tables from CSV files: `Restaurant`, `Consumers`, `Ratings`, and `Restaurant_Cuisines`.
- Add necessary primary and foreign key constraints to maintain referential integrity.
- Write SQL queries and stored procedures to analyze restaurant and consumer data.
- Provide a database diagram illustrating table relationships.

---

## Database Schema

The database includes the following tables (with column names matching the original CSV files):

- **Restaurant**
- **Consumers**
- **Ratings**
- **Restaurant_Cuisines**

Primary keys and foreign keys have been added appropriately to link tables.

*A database diagram illustrating these tables and their relationships is included in the `docs/` folder.*

---

## Task Breakdown and Solutions

### Part 1: Database Setup

- Created database `FoodserviceDB`.
- Imported data into the four tables.
- Added primary keys and foreign keys to enforce data integrity.

### Part 2: SQL Queries and Stored Procedure

1. **Query:** List all restaurants with a *Medium* price range, located in an *Open* area, serving *Mexican* food.

2. **Query:** Count restaurants with overall rating = 1 serving *Mexican* food, and compare with those serving *Italian* food.  
   *Explanation:* The query results reveal differences in customer ratings between cuisines, possibly reflecting varying customer satisfaction or cuisine popularity.

3. **Query:** Calculate the average age of consumers who gave a service rating of 0.  
   *Note:* The result is rounded to the nearest whole number.

4. **Query:** List restaurants ranked by the youngest consumer, including food rating, sorted from highest to lowest rating.

5. **Stored Procedure:** Update the `Service_rating` to '2' for restaurants that have parking available marked as 'Yes' or 'Public'.

6. **Custom Queries:** Four additional queries were created using nested queries (`EXISTS`, `IN`), system functions, and grouping (`GROUP BY`, `HAVING`, `ORDER BY`) to provide further insights.  
   *Each query is accompanied by explanations in the SQL comments.*

---

## How to Use This Project

1. Run the SQL script `FoodserviceDB.sql` to create the database, tables, constraints, and load sample data.
2. Execute the queries in order to answer the project questions.
3. Use the stored procedure to update service ratings as required.
4. Review additional custom queries to explore extended analysis.

---

## Notes

- Column names are kept exactly as in the provided CSV files to ensure re-runnability.
- All data and queries are for demonstration purposes; no real customer data is included.
- Scripts are designed for Microsoft SQL Server.

---

## Files Included

- `FoodserviceDB.sql` — Complete SQL script including database creation, table setup, constraints, queries, and stored procedures.
- `docs/database_diagram.png` — Visual diagram of the database schema and relationships.
- `README.md` — Project description and instructions.

---

## Contact

For questions or feedback, please contact: [olihafosa@gmail.com]

---

## License

MIT License — see the LICENSE file for details.
