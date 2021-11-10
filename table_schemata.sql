--Data Engineering--
--departments table
create table departments(
	dept_no VARCHAR(30) not null, 
	dept_name VARCHAR(30) not null, 
	PRIMARY KEY (dept_no)
);

--titles table 
create table titles(
	title_id VARCHAR (30) not null, 
	title VARCHAR(50) not null, 
	PRIMARY KEY (title_id)
);

--employees table
create table employees(
	emp_no INTEGER not null, 
	emp_title VARCHAR(50) not null, 
	birth_date DATE not null, 
	first_name VARCHAR (50) not null, 
	last_name VARCHAR (50) not null, 
	sex VARCHAR (5) not null, 
	hire_date DATE not null, 
	PRIMARY KEY(emp_no),
	FOREIGN KEY(emp_title) REFERENCES titles(title_id)
);
alter table employees alter column birth_date type date using birth_date::date; 
alter table employees alter column hire_date type date using hire_date::date; 

--dept_emp table 
create table dept_emp(
	emp_no INTEGER not null, 
	dept_no VARCHAR(30) not null, 
	primary key (emp_no, dept_no),
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no), 
	FOREIGN KEY(dept_no) REFERENCES departments(dept_no)
);

--dept_manager table 
create table dept_manager(
	dept_no VARCHAR (30) not null, 
	emp_no INTEGER not null,
	primary key (dept_no, emp_no),
	FOREIGN KEY(dept_no) REFERENCES departments(dept_no), 
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no)
);

--salaries table 
create table salaries(
	emp_no INTEGER not null, 
	salary INTEGER not null, 
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

--putting csv data into tables 
copy departments
from 'C:\Users\gtmor\Bootcamp\sql-challenge\EmployeeSQL\data\departments.csv'
delimiter ',' csv header; 

copy titles
from 'C:\Users\gtmor\Bootcamp\sql-challenge\EmployeeSQL\data\titles.csv'
delimiter ',' csv header; 

copy employees
from 'C:\Users\gtmor\Bootcamp\sql-challenge\EmployeeSQL\data\employees.csv'
delimiter ',' csv header; 

copy dept_emp
from 'C:\Users\gtmor\Bootcamp\sql-challenge\EmployeeSQL\data\dept_emp.csv'
delimiter ',' csv header; 

copy salaries
from 'C:\Users\gtmor\Bootcamp\sql-challenge\EmployeeSQL\data\salaries.csv'
delimiter ',' csv header; 

copy dept_manager
from 'C:\Users\gtmor\Bootcamp\sql-challenge\EmployeeSQL\data\dept_manager.csv'
delimiter ',' csv header; 