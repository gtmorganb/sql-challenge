--Data Analysis-- 
--1 emp_no, last_name, first_name, sex, salary-- 
select employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
from employees 
inner join salaries on employees.emp_no = salaries.emp_no;

--2 first_name, last_name, hire_date for employees hired in 1986--
select employees.first_name, employees.last_name, employees.hire_date 
from employees
where hire_date >= '1985-12-31' and hire_date <= '1987-01-01'; 

--3 list the manager of each department with department number, department name, the manager's employee number, last name, first name
select dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
from dept_manager
inner join departments on dept_manager.dept_no = departments.dept_no
inner join employees on employees.emp_no = dept_manager.emp_no; 

--4 list the department of each employee with employee number, last name, first name, and department name 
select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees
inner join dept_emp on employees.emp_no = dept_emp.emp_no
inner join departments on dept_emp.dept_no = departments.dept_no;

--5 list first name, last name, sex for employees whose first name is Hercules and last name begins with B
select employees.first_name, employees.last_name, employees.sex
from employees 
where first_name = 'Hercules' and last_name like 'B%';

--6 list all employees in the sales department with employee number, last name, first name, and department name 
select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees 
inner join dept_emp on dept_emp.emp_no = employees.emp_no 
inner join departments on departments.dept_no = dept_emp.dept_no
where departments.dept_name = 'Sales';

--7 list all employees in sales and devleopment departments with employee number, last name, first name, and department name 
select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees 
inner join dept_emp on dept_emp.emp_no = employees.emp_no 
inner join departments on departments.dept_no = dept_emp.dept_no
where departments.dept_name = 'Sales' or departments.dept_name = 'Development';

--8 in descending order, list frequency count of employee last names
select employees.last_name, count(employees.last_name) as "Last_Name_Count"
from employees
group by last_name
order by "Last_Name_Count" desc;