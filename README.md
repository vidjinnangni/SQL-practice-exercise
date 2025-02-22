# SQL Exercise – MySQL Database Queries

## Overview

This repository contains a structured SQL exercise designed to practice database queries using MySQL. The goal is to enhance SQL skills by solving various database-related challenges. The exercise is based on a predefined database schema, and users are encouraged to write their own SQL queries before checking the provided solutions.

## Files Included

- **`db_schema.sql`** – Contains the SQL script to create and populate the database schema.
- **`questions.md`** – Lists the SQL exercises to be solved.
- **`solutions.sql`** – Provides solutions to the exercises.

## How to Use

### Set up the database:
1. Run `db_schema.sql` in your MySQL database to create and populate the necessary tables.
2. Ensure your MySQL server is running.

### Attempt the exercises:
Open `questions.md` and try to solve each question by writing SQL queries.

### Check solutions:
Compare your answers with the `solutions.sql` file to see different possible approaches.

## Data Population

The `db_schema.sql` file not only creates the necessary tables but also inserts sample data into them. For instance:

- **Departments Table**: Contains department names and locations.
- **Employees Table**: Stores employee details such as name, email, salary, hire date, and department affiliation.

### Example data insertion:
```sql
INSERT INTO Departments (department_name, location_id) VALUES 
('Marketing', 180),
('Purchasing', 1700),
('Human Resources', 2400),
('Shipping', 1500);

INSERT INTO Employees (first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
VALUES 
('Steven', 'King', 'sking@example.com', '515.123.4567', '1987-06-17', 'AD_PRES', 24000.00, NULL, NULL, 1),
('Neena', 'Kochhar', 'nkochhar@example.com', '515.123.4568', '1989-11-21', 'AD_VP', 17000.00, NULL, 1, 1);
```

This ensures that you can immediately start querying data.

## Prerequisites
- MySQL installed and configured.
- A basic understanding of SQL queries and database management.
- A database tool such as MySQL Workbench, DBeaver, or the MySQL command-line interface.

## Contributing

If you have suggestions, improvements, or additional exercises, feel free to open a pull request.

## License

This project is open-source under the MIT License. Feel free to use and modify it as needed.

---
Happy coding! 🚀