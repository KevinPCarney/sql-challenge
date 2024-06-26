-- 1. List the employee number, last name, first name, sex, and salary of each employee.

SELECT
	employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM
	employees
INNER JOIN salaries ON
	employees.emp_no = salaries.emp_no
ORDER BY emp_no ASC;

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT
	employees.first_name, employees.last_name, employees.hire_date
FROM
	employees
Where
	TO_CHAR(hire_date, 'YYYY')  LIKE '%1986';

-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT
	employees.emp_no, employees.last_name, employees.first_name, dept_manager.dept_no, departments.dept_name
FROM
	employees
INNER JOIN dept_manager ON
	employees.emp_no = dept_manager.emp_no
INNER Join departments ON
	dept_manager.dept_no = departments.dept_no	
WHERE
	emp_title = 'm0001'
ORDER BY emp_no ASC;

-- 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

SELECT DISTINCT
	employees.emp_no, employees.last_name, employees.first_name, dept_manager.dept_no, departments.dept_name 
FROM
	employees
INNER JOIN dept_emp ON
	employees.emp_no = dept_emp.emp_no
INNER JOIN dept_manager ON
	dept_manager.dept_no = dept_emp.dept_no
INNER Join departments ON
	dept_manager.dept_no = departments.dept_no
ORDER BY emp_no ASC;

-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT
	employees.first_name, employees.last_name, employees.sex
FROM
	employees
WHERE
	first_name = 'Hercules'
	AND last_name like 'B%'
ORDER BY emp_no ASC;

-- 6. List each employee in the Sales department, including their employee number, last name, and first name.

SELECT
	employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM
	employees
INNER JOIN dept_emp ON
	employees.emp_no = dept_emp.emp_no
INNER Join departments ON
	dept_emp.dept_no = departments.dept_no
WHERE dept_name = 'Sales'
ORDER BY emp_no ASC;

-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT
	employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM
	employees
INNER JOIN dept_emp ON
	employees.emp_no = dept_emp.emp_no
INNER Join departments ON
	dept_emp.dept_no = departments.dept_no
WHERE dept_name = 'Sales'
	OR dept_name = 'Development'
ORDER BY emp_no ASC;

-- 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT
	last_name, COUNT(*) AS COUNT
FROM
	employees
GROUP BY last_name
ORDER BY COUNT DESC;