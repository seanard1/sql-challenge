CREATE TABLE titles (
    title_id VARCHAR(5) PRIMARY KEY,
    title VARCHAR(30)
);

CREATE TABLE employees (
    emp_no INT PRIMARY KEY,
    emp_title_id VARCHAR(10),
    birth_date VARCHAR(35),
    first_name VARCHAR(35),
    last_name VARCHAR(35),
    sex VARCHAR(1),
    hire_date VARCHAR(35),
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

CREATE TABLE departments (
    dept_no VARCHAR(4) PRIMARY KEY,
    dept_name VARCHAR(30)
);

CREATE TABLE salaries (
    emp_no INTEGER,
    salary INTEGER,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);


CREATE TABLE dept_emp (
    emp_no INT,
    dept_no VARCHAR(4),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE dept_manager (
    dept_no VARCHAR(4),
    emp_no INT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
)