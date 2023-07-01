-- Question 01
-- List the employee number, last name, first name, sex, and salary of each employee.

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
INNER JOIN salaries AS s
ON e.emp_no = s.emp_no;

-- Question 02
-- List the first name, last name, and hire date for the employees who were hired in 1986.
-- https://www.rudderstack.com/guides/queries-casting-postgresql/#:~:text=The%20TO_DATE%20function%20in%20PostgreSQL,to_timestamp(text%2C%20text)%20.
-- https://www.postgresqltutorial.com/postgresql-date-functions/postgresql-date_part/

SELECT first_name, last_name, hire_date
FROM employees
WHERE DATE_PART('YEAR', TO_DATE(hire_date, 'MM/DD/YYY')) = 1986;

-- Question 03
-- List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT d.dept_no, n.dept_name, d.emp_no, e.last_name, e.first_name
FROM dept_manager AS d
INNER JOIN departments AS n
ON d.dept_no = n.dept_no
INNER JOIN employees AS e
ON d.emp_no = e.emp_no;

-- Question 04
-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

SELECT n.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
INNER JOIN dept_emp AS n
ON n.emp_no = e.emp_no
INNER JOIN departments AS d
ON n.dept_no = d.dept_no;

-- Question 05
-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- Question 06
-- List each employee in the Sales department, including their employee number, last name, and first name.

SELECT emp_no, last_name, first_name
FROM employees
WHERE emp_no IN (
	SELECT emp_no
	FROM dept_emp
	WHERE dept_no IN (
		SELECT dept_no
		FROM departments
		WHERE dept_name = 'Sales'
	)
);

-- Question 07
-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
INNER JOIN dept_emp AS n
ON n.emp_no = e.emp_no
INNER JOIN departments AS d
ON n.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' OR dept_name = 'Development';

-- Question 08
-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC