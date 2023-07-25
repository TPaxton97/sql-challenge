-- create tables
create table employees.departments(
	dept_no varchar( 4 ) PRIMARY KEY UNIQUE NOT NULL, 
	dept_name varchar( 50 ) UNIQUE
);
	
create table employees.dept_emp(
	emp_no int UNIQUE NOT NULL,
	dept_no varchar( 4 ),
	PRIMARY KEY(emp_no, dept_no),
	CONSTRAINT fk_emp_no
      FOREIGN KEY(emp_no) 
	  	REFERENCES employees.employees(emp_no),
	CONSTRAINT fk_dept_no
      FOREIGN KEY(dept_no) 
	  	REFERENCES employees.departments(dept_no)
);
	
create table employees.dept_manager(
	dept_no varchar( 4 ),
	emp_no int,
	PRIMARY KEY(dept_no, emp_no),
	CONSTRAINT fk_dept_no
      FOREIGN KEY(dept_no) 
	  	REFERENCES employees.departments(dept_no),
	CONSTRAINT fk_emp_no
      FOREIGN KEY(emp_no) 
	  	REFERENCES employees.employees(emp_no)
);
	
create table employees.employees(
	emp_no int PRIMARY KEY UNIQUE NOT NULL,
	emp_title varchar( 5 ) NOT NULL,
	birth_date varchar( 10 ) NOT NULL,
	first_name varchar( 50 ) NOT NULL,
	last_name varchar( 50 ) NOT NULL,
	sex varchar( 1 ),
	hire_date varchar( 10 ),
	CONSTRAINT fk_emp_title
      FOREIGN KEY(emp_title) 
	  	REFERENCES employees.titles(title_id)
);
	
create table employees.salaries(
	emp_no int UNIQUE NOT NULL,
	salary int,
	PRIMARY KEY(emp_no, salary),
	CONSTRAINT fk_emp_no
      FOREIGN KEY(emp_no) 
	  	REFERENCES employees.employees(emp_no)
);
	
create table employees.titles(
	title_id varchar( 5 ) PRIMARY KEY UNIQUE,
	title varchar( 50 )
);