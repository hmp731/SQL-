---Exercise6---
SELECT department_id, last_name, job_id FROM employees WHERE department_id IN
(SELECT department_id FROM departments WHERE department_name = 'Executive')


---Exercise7---
SELECT employee_id, last_name, salary FROM employees 
WHERE salary > (SELECT AVG(salary) FROM employees)
AND department_id IN (SELECT department_id FROM employees WHERE last_name LIKE '%u%')


---Exercise8---
SELECT ROUND(MAX(salary),0) AS Maximum, 
ROUND(MIN(salary),0) AS Minimum, 
ROUND(SUM(salary),0) AS Sum, 
ROUND(AVG(salary),0) AS Average 
FROM employees


---Exercise9---
SELECT last_name AS Name, LEN(last_name) AS Length
FROM employees
WHERE last_name LIKE 'A%'
OR last_name LIKE 'J%'
OR last_name LIKE 'M%'


---Exercise10---
SELECT employee_id, last_name, salary, salary+(salary*15.5/100) AS 'New Salary'
FROM employees


---Exercise11---
SELECT e.last_name, d.department_id, d.department_name FROM departments d
FULL JOIN employees e
ON d.department_id = e.department_id


---Exercise12---
SELECT e.employee_id, e.last_name, e.hire_date, e.manager_id FROM employees e
INNER JOIN employees manager ON e.manager_id = manager.employee_id
INNER JOIN departments d ON e.department_id = d.department_id
INNER JOIN locations l ON d.location_id = l.location_id
WHERE e.hire_date > manager.hire_date AND city = 'Toronto'