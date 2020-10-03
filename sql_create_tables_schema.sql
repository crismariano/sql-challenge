--CREATE TABLES for SQL Homework Challenge
-- Create a sql file of you table schemata

CREATE TABLE EMPLOYEES (
  emp_no INT,
  emp_title_id VARCHAR(6),
  birth_date DATE,
  first_name VARCHAR(20),
  last_name VARCHAR(30),
  sex VARCHAR(1),
  hire_date DATE,
  PRIMARY KEY ("emp_no")
);

CREATE TABLE DEPARTMENTS (
  dept_no VARCHAR(4),
  dept_name VARCHAR(20),
  PRIMARY KEY ("dept_no")
);

CREATE TABLE SALARY (
  emp_no INT,
  salary INT,
  PRIMARY KEY ("emp_no")
);

CREATE TABLE TITLE (
  title_id VARCHAR(5),
  title VARCHAR(20),
  PRIMARY KEY ("title_id")
);

CREATE TABLE DEPARTMENT_MANAGER (
  dept_no VARCHAR(4),
  emp_no INT,
  PRIMARY KEY ("dept_no", "emp_no")
);

CREATE TABLE DEPARTMENT_EMPLOYEE (
  emp_no INT,
  dept_no VARCHAR(4),
  PRIMARY KEY ("emp_no", "dept_no")
);

-- View Created Tables
SELECT * FROM employees;
SELECT * FROM department_employee;
SELECT * FROM department_manager;
SELECT * FROM departments;
SELECT * FROM salary;
SELECT * FROM title;
