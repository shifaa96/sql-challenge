CREATE TABLE departments (
  dept_no VARCHAR(10),
  dept_name VARCHAR(30)
);

CREATE TABLE dept_emp (
  	emp_no VARCHAR(10),
	dept_no VARCHAR(10),
	from_date DATE,
	to_date DATE	
);

CREATE TABLE dept_manager (
  	dept_no VARCHAR(10),
	emp_no VARCHAR(10),
	from_date DATE,
	to_date DATE	
);


CREATE TABLE employees (
	emp_no VARCHAR(10),
	birth_date DATE,
	first_name VARCHAR(20), 
	last_name VARCHAR(20),
	gender VARCHAR(2),
	hire_date DATE
);


CREATE TABLE salaries (
	emp_no VARCHAR(10),
	salary VARCHAR(20),
	from_date DATE, 
	to_date DATE
);


CREATE TABLE titles (
	emp_no VARCHAR(10),
	salary VARCHAR(20),
	from_date DATE, 
	to_date DATE
);
--#1
SELECT 
employees.emp_no,
employees.last_name,
employees.first_name,
employees.gender,
salaries.salary
FROM employees
INNER JOIN salaries ON 
employees.emp_id = salaries.emp_no;

--#2 List employees who were hired in 1986

SELECT
emp_no,
first_name,
last_name
from employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

--List the manager: department number, department name, the
--manager's employee number, last name, first name, and start and end employment dates

SELECT 
departments.dept_no,
departments.dept_name,
dept_manager.emp_no,
employees.last_name,
employees.first_name,
employees.hire_date
FROM departments 
LEFT OUTER JOIN ON 
departments.dept_no = dept_manager.dept_no
LEFT OUTER JOIN ON 
dept_manager.emp_no = employees.emp_no;


--#4

SELECT 
dept_emp.dept_no,
employees.emp_no,
employees.last_name,
employees.first_name
FROM dept_employee
INNER JOIN dept_emp.emp_no =employees.emp_no;

--5

SELECT
first_name,
last_name
FROM
employees
WHERE
first_name = 'Hercules'
AND 
last_name LIKE 'B%';

--6

SELECT
employees.emp_no,
employees.last_name,
employees.first_name,
departments.dept_name
FROM employees
JOIN 
employees.emp_no = dept_emp.emp_no
JOIN 
dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name= 'Sales';




--7
SELECT
employees.emp_no,
employees.last_name,
employees.first_name,
departments.dept_name
FROM employees
JOIN ON employees.emp_no = dept_emp.emp_no
JOIN ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name= 'Sales' and
departments.dept_name= 'Development';

--8

SELECT last_name,
COUNT(last_name) AS "frequency_of_name"
FROM employees
GROUP BY last_name
ORDER BY
COUNT(last_name) DESC;

