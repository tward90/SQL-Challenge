DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS titles;

CREATE TABLE titles (
 	title_id VARCHAR (5) PRIMARY KEY NOT NULL,
 	title VARCHAR (20) NOT NULL
);

CREATE TABLE employees (
	emp_no INTEGER PRIMARY KEY NOT NULL,
	emp_title_id VARCHAR (5) NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR (20) NOT NULL,
	last_name VARCHAR (20) NOT NULL,
	sex VARCHAR (1) NOT NULL,
	hire_date DATE NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

CREATE TABLE salaries (
 	emp_no INTEGER PRIMARY KEY NOT NULL,
 	salary INTEGER NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);


CREATE TABLE departments (
 	dept_no VARCHAR (10) PRIMARY KEY NOT NULL,
 	dept_name VARCHAR(50) NOT NULL
);

CREATE TABLE dept_manager (
 	dept_no VARCHAR(10) NOT NULL,
 	emp_no INTEGER NOT NULL,
	PRIMARY KEY (dept_no, emp_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE dept_emp (
 	emp_no INTEGER NOT NULL,
 	dept_no VARCHAR(10) NOT NULL,
	PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

/*
SELECT * from departments
SELECT * from dept_emp limit 20
SELECT * from dept_manager
SELECT * from employees limit 20
SELECT * from salaries limit 20
SELECT * from titles
*/


