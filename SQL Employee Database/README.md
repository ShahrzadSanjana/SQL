


#Data Analysis

Once there is a complete database, ansewer the following questions:

1) List the following details of each employee: employee number, last name, first name, gender, and salary.

SELECT employees.emp_no, last_name, first_name, sex, salary
FROM employees
JOIN salaries 
ON employees.emp_no=salaries.emp_no;
