-- queries
-- List the employee number, last name, first name, sex, and salary of each employee 
select 
	e.emp_no,
	e.last_name,
	e.first_name,
	e.sex,
	s.salary
From
	employees e 
	join salaries s on e.emp_no = s.emp_no
Order by 
	e.last_name ASC,
	s.salary DESC;


-- List the first name, last name, and hire date for the employees who were hired in 1986
SELECT 
    first_name,
    last_name,
    hire_date
FROM 
    employees
WHERE 
    EXTRACT(YEAR FROM hire_date) = 1986;

-- List the manager of each department along with their department number, department name, employee number, last name, and first name
SELECT 
    dm.dept_no,
    d.dept_name,
    dm.emp_no,
    e.last_name,
    e.first_name
FROM 
    dept_manager dm
JOIN departments d ON dm.dept_no = d.dept_no
JOIN employees e ON dm.emp_no = e.emp_no;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name 
SELECT 
    de.dept_no,
    e.emp_no,
    e.last_name,
    e.first_name,
    d.dept_name
FROM 
    dept_emp de
JOIN employees e ON de.emp_no = e.emp_no
JOIN departments d ON de.dept_no = d.dept_no;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B 
SELECT
    e.first_name,
    e.last_name,
    e.sex
FROM
    employees e
WHERE
    e.first_name = 'Hercules'
    AND e.last_name LIKE 'B%'
ORDER BY
    e.last_name ASC,
    e.first_name ASC;

-- List each employee in the Sales department, including their employee number, last name, and first name
SELECT 
    de.emp_no,
    e.last_name,
    e.first_name
FROM 
    dept_emp de
JOIN 
    employees e ON de.emp_no = e.emp_no
JOIN 
    departments d ON de.dept_no = d.dept_no
WHERE 
    d.dept_name = 'Sales';

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT 
    de.emp_no,
    e.last_name,
    e.first_name,
    d.dept_name
FROM 
    dept_emp de
JOIN employees e ON de.emp_no = e.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE 
    d.dept_name IN ('Sales', 'Development');

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
SELECT 
    last_name,
    COUNT(*) AS frequency_count
FROM 
    employees
GROUP BY 
    last_name
ORDER BY 
    frequency_count DESC;
