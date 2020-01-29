-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.

select emp.emp_no AS "Employee Number", emp.last_name AS "Last Name", emp.first_name as "First Name", emp.gender as "Gender", sal.salary as "Salary"
FROM employees as emp
JOIN salaries as sal 
ON (emp.emp_no = sal.emp_no)
Order BY emp.emp_no;

-- 2.List employees who were hired in 1986.

Select first_name, last_name
from employees
where hire_date Between '1986-01-01' and '1986-12-31'
;


-- 3. List the manager of each department with the following information:
-- department number, department name, the manager’s employee number, last name, 
-- first name, and start and end employment dates.

Select dm.dept_no, dm.emp_no, d.dept_name,
e.last_name, e.first_name, dm.from_date, dm.to_date
FROM Dept_manager as dm
INNER JOIN departments AS d
on (dm.dept_no = d.dept_no)
INNER JOIN employees as e
on (dm.emp_no = e.emp_no);

-- 4. List the department of each employee with the following information:
-- employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
INNER JOIN dept_emp as de
on (e.emp_no = de.emp_no)
INNER JOIN departments as d
ON (de.dept_no = d.dept_no)
ORDER BY e.emp_no;

-- 5. List all employees whose first name is “Hercules” and last names begin with “B.”

Select * 
from employees
where first_name = 'Hercules'
AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

Select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
INNER JOIN dept_emp as de
on (e.emp_no = de.emp_no)
INNER JOIN departments as d
on (de.dept_no = d.dept_no)
WHERE d.dept_name = 'Sales' 
Order by e.emp_no;

-- 7. List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.

Select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
INNER JOIN dept_emp as de
on (e.emp_no = de.emp_no)
Inner JOIN departments as d
on (de.dept_no = d.dept_no)
Where d.dept_name IN ('Sales', 'Development')
Order by e.emp_no; 


-- 8.In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

Select last_name, count(last_name)
from employees
Group by last_name
Order by count(last_name) DESC;
