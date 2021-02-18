-- 1

SELECT e.employee_number, e.last_name, e.first_name, e.sex, s.salary
FROM
	employees as e
	JOIN salaries as s ON e.employee_number = s.employee_number;
	
-- 2

SELECT last_name, first_name, hire_date
FROM
	employees
WHERE hire_date >= '1986-01-01' AND hire_date < '1987-01-01';

--3 

SELECT d.department_number, d.department_name, e.employee_number, e.last_name, e.first_name
FROM
	department_manager as dm
	LEFT JOIN departments as d on d.department_number = dm.department_number
	LEFT JOIN employees as e on dm.employee_number = e.employee_number;
	
--verifying: each department has more than one manager. This results in 24 rows, the same number of rows 
-- in department_manager, because it has one row per manager, not one row per department.

