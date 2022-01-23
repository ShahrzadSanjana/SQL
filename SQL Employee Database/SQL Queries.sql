/* 1. List the following details of each employee: employee number, last name, first name, sex, and salary. */

SELECT employees.emp_no, last_name, first_name, sex, salary
FROM employees
JOIN salaries 
ON employees.emp_no=salaries.emp_no;


/* 2. List first name, last name, and hire date for employees who were hired in 1986. */

SELECT emp_no, first_name, last_name, hire_date
FROM [dbo].[employees]
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';


/* 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name. */

SELECT dept_manager.dept_no, departments.dept_name, employees.emp_no, last_name, first_name
FROM employees
JOIN dept_manager
ON employees.emp_no=dept_manager.emp_no
JOIN departments
ON departments.dept_no=dept_manager.dept_no;


/* 4. List the department of each employee with the following information: employee number, last name, first name, and department name. */

SELECT employees.emp_no, last_name, first_name, dept_name
FROM employees
JOIN dept_emp
ON employees.emp_no=dept_emp.emp_no
JOIN departments
ON dept_emp.dept_no=departments.dept_no;


/* 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT employees.emp_no, first_name, last_name 
FROM employees
WHERE first_name = 'Hercules'  AND last_name LIKE 'B%';