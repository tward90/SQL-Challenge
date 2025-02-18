-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
	JOIN salaries s
		ON (e.emp_no = s.emp_no);

-- 2. List first name, last name, and hire date for employees who were hired in 1986.

SELECT first_name, last_name, hire_date 
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM employees e
   JOIN dept_manager dm
   		ON dm.emp_no = e.emp_no
   JOIN departments d
   		ON d.dept_no = dm.dept_no

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
   JOIN dept_emp
   		ON dept_emp.emp_no = e.emp_no
   JOIN departments d
   		ON d.dept_no = dept_emp.dept_no

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT first_name, last_name, sex
FROM employees e
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
   JOIN dept_emp
   		ON dept_emp.emp_no = e.emp_no
   JOIN departments d
   		ON d.dept_no = dept_emp.dept_no
WHERE d.dept_name = 'Sales'

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
   JOIN dept_emp
   		ON dept_emp.emp_no = e.emp_no
   JOIN departments d
   		ON d.dept_no = dept_emp.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development'

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name,
COUNT(last_name) AS "Total Occurrences"
FROM employees
GROUP BY last_name
ORDER BY "Total Occurrences" DESC;