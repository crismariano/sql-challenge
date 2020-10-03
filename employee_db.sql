-- View Created Tables
SELECT * FROM employees;
SELECT * FROM department_employee;
SELECT * FROM department_manager;
SELECT * FROM departments;
SELECT * FROM salary;
SELECT * FROM title;

-- Import the 6 data csv files into the Created Tables

-- HOMEWORK QUESTIONS ARE NUMBERED BELOW

-- Question 1. List the following details of each employee: employee number, last name, first name, sex and salary
-- Join tables employees and salary for query

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
INNER JOIN salary AS s ON
e.emp_no=s.emp_no;

-- Question 2. List first name, last name, and hire date for employees who were hired in 1986
-- Query on the employees table

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date >='1986-01-01'
AND hire_date <='1986-12-31';

-- Question 3. Build queries to list the manager of each department with the following information:
-- dept_no, dept_name, emp_no, last_name, first_name
-- SEE comment "Answer to Question # 3 Answer List Manager - Dept_No, Dept_Name, Emp_No, Last_Name, First_Name" below for query

CREATE VIEW managers AS
SELECT emp_no, last_name, first_name
FROM employees
WHERE emp_no IN
(	
	SELECT emp_no
	FROM department_manager
);

-- Create View
SELECT *
FROM managers;

-- JOIN managers with department_manager to add dept_no
-- Create View with dept_no
CREATE VIEW mgr_dept_no AS
SELECT m.emp_no, m.last_name, m.first_name, d.dept_no
FROM managers AS m
INNER JOIN department_manager AS d ON
m.emp_no=d.emp_no;

-- View created view mgr_dept_no
SELECT * FROM mgr_dept_no;

-- JOIN mgr_dept_no with departments table to get name
CREATE VIEW manager_dept AS
SELECT mdn.emp_no, mdn.last_name, mdn.first_name, mdn.dept_no, d.dept_name
FROM mgr_dept_no AS mdn
INNER JOIN departments AS d ON
mdn.dept_no=d.dept_no;

-- View Created View manager_dept
SELECT * FROM manager_dept;

-- Answer to Question # 3 Answer List Manager - Dept_No, Dept_Name, Emp_No, Last_Name, First_Name
SELECT dept_no, dept_name, emp_no, last_name, first_name
FROM manager_dept;

-- Question 4. List the department of each employee with the following information:
-- employee number, last name, first name, and department name
-- Tables employees, department_employee(to get dept_no), departments(to get dept_name)
-- See Comment "Answer to Question 4"

CREATE VIEW emp_dept_name AS
SELECT e.emp_no, e.last_name, e.first_name, de.dept_no
FROM employees AS e
INNER JOIN department_employee AS de ON
e.emp_no=de.emp_no;

-- View created view emp_dept_name
SELECT * FROM emp_dept_name;

-- Answer to Question 4:
SELECT edn.emp_no, edn.last_name, edn.first_name, depts.dept_name
FROM emp_dept_name AS edn
INNER JOIN departments AS depts ON
edn.dept_no=depts.dept_no;

-- Question 5. List first name, last name, and sex for employees whose first name is 'Hercules' and last names begin with "B".
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- Question 6. List all employees in the Sales department, including their
-- employee number, last name, first name, and department name
-- Use query from Question 4, create a view and query on department name
-- See Answer to Question below

CREATE VIEW sales_and_devlopment AS
SELECT edn.emp_no, edn.last_name, edn.first_name, depts.dept_name
FROM emp_dept_name AS edn
INNER JOIN departments AS depts ON
edn.dept_no=depts.dept_no;

-- Answer Question 6
SELECT emp_no, last_name, first_name, dept_name
FROM sales_and_devlopment
WHERE dept_name = 'Sales';

-- Question 7. List all employees in the Sales and Development departments, including their:
-- employee number, last name, first name, and department name.
SELECT emp_no, last_name, first_name, dept_name
FROM sales_and_devlopment
WHERE dept_name = 'Sales'
OR dept_name = 'Development';

-- Question 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, count(last_name)
FROM employees
GROUP BY last_name
ORDER BY last_name DESC;

-- Bonus common salary ranges for employees
-- See Jupyter Notebook file - SQL_Bonus_Challenge

CREATE VIEW bonus_salary AS
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
INNER JOIN salary AS s ON
e.emp_no=s.emp_no;

SELECT * FROM bonus_salary;

SELECT salary, count(salary)
FROM bonus_salary
GROUP BY salary
ORDER BY salary ASC;

SELECT salary, count(salary)
FROM bonus_salary
GROUP BY salary
ORDER BY salary DESC;




