**Background**

I am regularly looking for projects to improve and demonstrate my progress as a data analyst, and I found this one through someone else’s GitHub repository. I thought it would be a good idea if I attempted the following tasks to reinforce some old skills as well as learn a few important ones relating to Data Engineering!
I used Microsoft SQL Server Management Studio for the entire project; from creating the database and tables, to importing data and writing queries and, as such, the following commentary applies to this program in particular. 



**Data Analysis**

Once there is a complete database, answer the following questions:


1) List the following details of each employee: employee number, last name, first name, gender, and salary.
```sql 
SELECT employees.emp_no, last_name, first_name, sex, salary
FROM employees
JOIN salaries 
ON employees.emp_no=salaries.emp_no; 
```

2) List employees who were hired in 1986.

```sql
SELECT emp_no, first_name, last_name, hire_date
FROM [dbo].[employees]
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';
```

3) List the manager of each department with the following information: department number, department name, the manager's employee number, last name, and first name.
```sql 
SELECT dept_manager.dept_no, departments.dept_name, employees.emp_no, last_name, first_name
FROM employees
JOIN dept_manager
ON employees.emp_no=dept_manager.emp_no
JOIN departments
ON departments.dept_no=dept_manager.dept_no;
```

4) List the department of each employee with the following information: employee number, last name, first name, and department name.
```sql
SELECT employees.emp_no, last_name, first_name, dept_name
FROM employees
JOIN dept_emp
ON employees.emp_no=dept_emp.emp_no
JOIN departments
ON dept_emp.dept_no=departments.dept_no;
```

5) List all employees whose first name is "Hercules" and last names begin with "B."
```sql
SELECT employees.emp_no, first_name, last_name 
FROM employees
WHERE first_name = 'Hercules'  AND last_name LIKE 'B%';
```

6) List all employees in the Sales department, including their employee number, last name, first name, and department name.
```sql
SELECT employees.emp_no, last_name, first_name, dept_name
FROM employees
JOIN dept_emp
ON employees.emp_no=dept_emp.emp_no
JOIN departments
ON dept_emp.dept_no=departments.dept_no
WHERE dept_name = 'Sales';
```

7) List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
```sql
SELECT employees.emp_no, last_name, first_name, dept_name
FROM employees
JOIN dept_emp
ON employees.emp_no=dept_emp.emp_no
JOIN departments
ON dept_emp.dept_no=departments.dept_no
WHERE dept_name = 'Sales' OR dept_name ='Development';
```

8) In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
```sql
SELECT last_name, COUNT(last_name) AS "Frequency" 
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;
```

