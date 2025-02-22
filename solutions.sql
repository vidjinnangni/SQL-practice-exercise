-- 1. Select employees first name, last name, job_id, and salary whose first name starts with alphabet S
SELECT first_name, last_name, job_id, salary
FROM Employees
WHERE first_name LIKE 'S%';

-- 2. Select the employee with the highest salary
SELECT employee_id, first_name, last_name, job_id, salary
FROM employees
WHERE salary = (SELECT MAX(salary) FROM Employees);

-- 3. Select employee with the second highest salary
SELECT employee_id, first_name, last_name, job_id, salary
FROM Employees
WHERE salary = (
    SELECT DISTINCT salary
    FROM Employees
    ORDER BY salary DESC
    LIMIT 1 OFFSET 1
);

-- 4. Select the employee with the lowest salary
SELECT employee_id, first_name, last_name, job_id, salary
FROM Employees
WHERE salary = (SELECT MIN(salary) FROM Employees);

-- 5. Select employee with the second lowest salary
SELECT employee_id, first_name, last_name, job_id, salary
FROM Employees
WHERE salary = (
    SELECT DISTINCT salary
    FROM Employees
    ORDER BY salary ASC
    LIMIT 1 OFFSET 1
);

-- Select employee with the second lowest salary (Better performance on large tables)
SELECT employee_id, first_name, last_name, job_id, salary
FROM Employees
WHERE salary = (
    SELECT MIN(salary)
    FROM Employees
    WHERE salary > (SELECT MIN(salary) FROM Employees)
);

-- 6. Select employees and their corresponding managers and their salaries
SELECT
	CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
	e.salary AS employee_salary,
	e.job_id,
	CONCAT(m.first_name, ' ', m.last_name) AS manager,
	m.salary AS manager_salary
FROM Employees e
JOIN Employees m
ON e.manager_id = m.employee_id;

-- Show also employees without manager
SELECT
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    e.salary AS employee_salary,
    e.job_id,
    COALESCE(CONCAT(m.first_name, ' ', m.last_name), 'No Manager') AS manager,
    COALESCE(m.salary, 0) AS manager_salary
FROM Employees e
LEFT JOIN Employees m
ON e.manager_id = m.employee_id;

-- 7. Write a query to show the count of employees under each manager in descending order
SELECT
    m.employee_id AS manager_id,
    CONCAT(m.first_name, ' ', m.last_name) AS manager_name,
    COUNT(e.employee_id) AS number_of_employees
FROM Employees e
JOIN Employees m
ON e.manager_id = m.employee_id
GROUP BY m.employee_id, m.first_name, m.last_name
ORDER BY number_of_employees DESC;


-- 8. Write a query to find the count of employees in each department
SELECT
	d.department_id,
	d.department_name,
	COUNT(e.employee_id) AS number_of_employees
FROM Departments d
LEFT JOIN Employees e
ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name
ORDER BY number_of_employees DESC;

-- Select only departments with at least one employee (use INNER JOIN instead of LEFT JOIN)
SELECT 
    d.department_id,
    d.department_name,
    COUNT(e.employee_id) AS number_of_employees
FROM Departments d
INNER JOIN Employees e
ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name
ORDER BY number_of_employees DESC;


-- 9. Write a query to get the count of employees hired year wise
SELECT 
    YEAR(hire_date) AS hire_year,
    COUNT(employee_id) AS number_of_employees
FROM Employees
GROUP BY hire_year
ORDER BY hire_year ASC;

-- To view hires since 2000 (for example) only, use WHERE
SELECT 
    YEAR(hire_date) AS hire_year,
    COUNT(employee_id) AS number_of_employees
FROM employees
WHERE YEAR(hire_date) >= 2000
GROUP BY hire_year
ORDER BY hire_year ASC;


-- 10. Write a query to find the salary range of employees
SELECT 
    MIN(salary) AS min_salary,
    MAX(salary) AS max_salary,
    MAX(salary) - MIN(salary) AS salary_range
FROM employees;

-- Find salary range by Department
SELECT 
    d.department_name,
    MIN(e.salary) AS min_salary,
    MAX(e.salary) AS max_salary,
    MAX(e.salary) - MIN(e.salary) AS salary_range
FROM employees e
JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department_name
ORDER BY salary_range DESC;


-- 11. Write a query to divide people into three groups based on their salaries - NTILE(3) method, MySQL 8+
SELECT 
    employee_id,
    CONCAT(first_name, ' ', last_name) AS employee_name,
    salary,
    NTILE(3) OVER (ORDER BY salary ASC) AS salary_group
FROM Employees;


-- 12. Write a query to display employees who earn more than the average salary in that company
SELECT
	employee_id,
	CONCAT(first_name, ' ', last_name) AS employee_name,
	salary
FROM Employees
WHERE salary > (SELECT AVG(salary) FROM employees)
ORDER BY salary DESC;


-- 13. Write a query to display the managers and the reporting employees who work in different departments
SELECT 
    e.employee_id AS employee_id,
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    e.department_id AS employee_department,
    m.employee_id AS manager_id,
    CONCAT(m.first_name, ' ', m.last_name) AS manager_name,
    m.department_id AS manager_department
FROM Employees e
JOIN Employees m
ON e.manager_id = m.employee_id
WHERE e.department_id <> m.department_id
ORDER BY m.department_id, e.department_id;