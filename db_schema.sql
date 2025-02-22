-- Build a DATABASE.

CREATE DATABASE IF NOT EXISTS company_db;

USE company_db;

-- Create Departments table
CREATE TABLE Departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(50) NOT NULL,
    location_id INT
);

-- Create Employees table
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(20),
    hire_date DATE NOT NULL,
    job_id VARCHAR(20) NOT NULL,
    salary DECIMAL(10, 2) CHECK (salary > 0),
    commission_pct DECIMAL(5, 2) DEFAULT NULL,
    manager_id INT DEFAULT NULL,
    department_id INT DEFAULT NULL,
    CONSTRAINT fk_dept FOREIGN KEY (department_id) REFERENCES Departments(department_id) ON DELETE SET NULL,
    CONSTRAINT fk_manager FOREIGN KEY (manager_id) REFERENCES Employees(employee_id) ON DELETE SET NULL
);


-- Insert data into Departments table
INSERT INTO Departments (department_name, location_id) VALUES 
('Marketing', 180),
('Purchasing', 1700),
('Human Resources', 2400),
('Shipping', 1500),
('IT', 1400),
('Public Relations', 2700),
('Sales', 2500),
('Executive', 1700),
('Finance', 1700),
('Accounting', 1700),
('Treasury', 1700),
('Corporate Tax', 1700),
('Control And Credit', 1700),
('Shareholder Services', 1700),
('Benefits', 1700),
('Payroll', 1700);


-- Insert data into Employees table
INSERT INTO Employees (first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
VALUES 
('Steven', 'King', 'sking@example.com', '515.123.4567', '1987-06-17', 'AD_PRES', 24000.00, NULL, NULL, 1),
('Neena', 'Kochhar', 'nkochhar@example.com', '515.123.4568', '1989-11-21', 'AD_VP', 17000.00, NULL, 1, 1),
('Lex', 'De Haan', 'ldehaan@example.com', '515.123.4569', '1993-09-12', 'AD_VP', 17000.00, NULL, 1, 2),
('Alexander', 'Hunold', 'ahunold@example.com', '590.423.4567', '1990-09-30', 'IT_PROG', 9000.00, NULL, 3, 5),
('Bruce', 'Ernst', 'bernst@example.com', '590.423.4568', '1991-05-21', 'IT_PROG', 6000.00, NULL, 4, 5),
('David', 'Austin', 'daustin@example.com', '590.423.4569', '1997-06-25', 'IT_PROG', 4800.00, NULL, 4, 5),
('Valli', 'Pataballa', 'vpatabal@example.com', '590.423.4560', '1998-02-05', 'IT_PROG', 4800.00, NULL, 4, 3),
('Diana', 'Lorentz', 'dlorentz@example.com', '590.423.5567', '1999-02-09', 'IT_PROG', 4200.00, NULL, 4, 3),
('Nancy', 'Greenberg', 'ngreenbe@example.com', '515.124.4569', '1994-08-17', 'FI_MGR', 12000.00, NULL, 2, 9),
('Daniel', 'Faviet', 'dfaviet@example.com', '515.124.4169', '1994-08-12', 'FI_ACCOUNT', 9000.00, NULL, 9, 16),
('John', 'Chen', 'jchen@example.com', '515.124.4269', '1997-04-09', 'FI_ACCOUNT', 8200.00, NULL, 9, 16),
('Den', 'Raphaely', 'drapheal@example.com', '515.127.4561', '1994-11-08', 'PU_MAN', 11000.00, NULL, 1, 2),
('Alexander', 'Khoo', 'akhoo@example.com', '515.127.4562', '1995-05-12', 'PU_CLERK', 3100.00, NULL, 12, 7),
('Sigal', 'Tobias', 'stobias@example.com', '515.127.4564', '1997-09-10', 'PU_CLERK', 2800.00, NULL, 12, 2),
('Guy', 'Himuro', 'ghimuro@example.com', '515.127.4565', '1998-01-02', 'PU_CLERK', 2600.00, NULL, 12, 5),
('Matthew', 'Weiss', 'mweiss@example.com', '650.123.1234', '1996-07-18', 'ST_MAN', 8000.00, NULL, 1, 4),
('Adam', 'Fripp', 'afripp@example.com', '650.123.2234', '1997-08-09', 'ST_MAN', 8200.00, NULL, 1, 4),
('Shanta', 'Vollman', 'svollman@example.com', '650.123.4234', '1997-10-12', 'ST_MAN', 6500.00, NULL, 1, 4),
('Kevin', 'Mourgos', 'kmourgos@example.com', '650.123.5234', '1999-11-12', 'ST_MAN', 5800.00, NULL, 1, 7),
('Julia', 'Nayer', 'jnayer@example.com', '650.124.1214', '1997-07-02', 'ST_CLERK', 3200.00, NULL, 17, 4),
('James', 'Landry', 'jlandry@example.com', '650.124.1334', '1999-01-02', 'ST_CLERK', 2400.00, NULL, 17, 8),
('Steven', 'Markle', 'smarkle@example.com', '650.124.1434', '2000-03-04', 'ST_CLERK', 2200.00, NULL, 17, 4),
('Laura', 'Bissot', 'lbissot@example.com', '650.124.5234', '1997-09-10', 'ST_CLERK', 3300.00, NULL, 18, 4);