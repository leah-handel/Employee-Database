-- 1

SELECT e.employee_number, e.last_name, e.first_name, e.sex, s.salary
FROM
	employees AS e
	JOIN salaries AS s ON e.employee_number = s.employee_number;
	
-- 2

SELECT last_name, first_name, hire_date
FROM employees
WHERE hire_date >= '1986-01-01' AND hire_date < '1987-01-01';

-- ty to https://stackoverflow.com/questions/9891025/sql-select-from-column-where-year-2010/9891058

--3 

SELECT d.department_number, d.department_name, e.employee_number, e.last_name, e.first_name
FROM
	department_manager AS dm
	LEFT JOIN departments AS d ON d.department_number = dm.department_number
	LEFT JOIN employees AS e ON dm.employee_number = e.employee_number;
	
-- verifying: each department has more than one manager. This results in 24 rows, the same number of rows 
-- in department_manager, because it has one row per management relationship, not one row per department.

--4

SELECT de.employee_number, e.last_name, e.first_name, d.department_name
FROM
	department_employee AS de
	LEFT JOIN departments AS d ON d.department_number = de.department_number
	LEFT JOIN employees AS e ON de.employee_number = e.employee_number;
	
-- similar to above: some employees work in multiple departments, this table has one row per employment relationship

--5

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';
	
--6

SELECT de.employee_number, e.last_name, e.first_name, d.department_name
FROM
	department_employee AS de
	LEFT JOIN departments AS d ON d.department_number = de.department_number
	LEFT JOIN employees AS e ON de.employee_number = e.employee_number
WHERE d.department_name = 'Sales';

--7

SELECT de.employee_number, e.last_name, e.first_name, d.department_name
FROM
	department_employee AS de
	LEFT JOIN departments AS d ON d.department_number = de.department_number
	LEFT JOIN employees AS e ON de.employee_number = e.employee_number
WHERE d.department_name = 'Sales' OR d.department_name = 'Development';

--8

SELECT last_name, COUNT(last_name) AS "employee count"
FROM employees
GROUP BY last_name
ORDER BY "employee count" DESC;
