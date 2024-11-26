-- Salary by employee
SELECT 
    e.emp_no,
    e.last_name,
    e.first_name,
    e.sex,
    s.salary
FROM employees e
LEFT JOIN salaries s
    ON e.emp_no = s.emp_no
ORDER BY e.emp_no;

-- Employees hired in 1986
SELECT 
    first_name, 
    last_name, 
    hire_date
FROM employees
WHERE hire_date >= '1986-01-01' AND hire_date <= '1986-12-31';

-- Manager of each department
SELECT 
    dm.dept_no,
    d.dept_name,
    dm.emp_no,
    e.last_name,
    e.first_name
FROM dept_manager dm
INNER JOIN departments d
    ON dm.dept_no = d.dept_no
INNER JOIN employees e
    ON dm.emp_no = e.emp_no;

-- Department of each employee
SELECT 
    e.emp_no,
    e.last_name,
    e.first_name,
    d.dept_name
FROM employees e
INNER JOIN dept_emp de
    ON e.emp_no = de.emp_no
INNER JOIN departments d
    ON de.dept_no = d.dept_no
ORDER BY e.emp_no;

-- Employees whose first name is "Hercules" and last name begins with "B"
SELECT 
    first_name, 
    last_name, 
    birth_date, 
    sex
FROM employees
WHERE first_name = 'Hercules'
  AND last_name LIKE 'B%';

-- Employees in the Sales department
SELECT 
    e.emp_no,
    e.last_name,
    e.first_name,
    d.dept_name
FROM employees e
INNER JOIN dept_emp de
    ON e.emp_no = de.emp_no
INNER JOIN departments d
    ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
ORDER BY e.emp_no;

-- Employees in Sales and Development departments
SELECT 
    e.emp_no,
    e.last_name,
    e.first_name,
    d.dept_name
FROM employees e
INNER JOIN dept_emp de
    ON e.emp_no = de.emp_no
INNER JOIN departments d
    ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development')
ORDER BY e.emp_no;

-- The frequency of employee last names
SELECT 
    last_name, 
    COUNT(*) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;
