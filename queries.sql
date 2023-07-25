--List the employee number, last name, first name, sex, and salary of each employee
select employees.employees.emp_no, employees.employees.last_name, employees.employees.first_name, employees.employees.sex, employees.salaries.salary
from employees.employees
join employees.salaries
on employees.salaries.emp_no = employees.employees.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986
select employees.employees.last_name, employees.employees.first_name, employees.employees.hire_date
from employees.employees
where hire_date like '%/%/1986';

/*List the manager of each department along with their department number, department name, 
employee number, last name, and first name*/
select employees.dept_manager.dept_no, employees.dept_manager.emp_no, employees.employees.last_name, employees.employees.first_name, employees.departments.dept_name
from employees.departments
join employees.dept_manager
on employees.departments.dept_no = employees.dept_manager.dept_no
join employees.employees
on employees.employees.emp_no = employees.dept_manager.emp_no;

/*List the department number for each employee along with that employee’s employee number, 
last name, first name, and department name*/
select  employees.dept_emp.dept_no, employees.dept_emp.emp_no, employees.employees.last_name, employees.employees.first_name, employees.departments.dept_name
from employees.employees
join employees.dept_emp
on employees.dept_emp.emp_no = employees.employees.emp_no
join employees.departments
on employees.dept_emp.dept_no = employees.departments.dept_no;

/*List first name, last name, and sex of each employee whose first name is Hercules and whose last
name begins with the letter B*/
select employees.employees.first_name, employees.employees.last_name, employees.employees.sex
from employees.employees
where first_name = 'Hercules'
and last_name like 'B%';

/*List each employee in the Sales department, including their employee number, last name, 
and first name*/
select employees.departments.dept_name, employees.employees.emp_no, employees.employees.last_name, employees.employees.first_name
from employees.employees
join employees.dept_emp
on employees.employees.emp_no = employees.dept_emp.emp_no
join employees.departments
on employees.dept_emp.dept_no = employees.departments.dept_no
where dept_name = 'Sales';

/*List each employee in the Sales and Development departments, including their employee number, 
last name, first name, and department name */
select employees.employees.emp_no, employees.employees.last_name, employees.employees.first_name, employees.departments.dept_name
from employees.employees
join employees.dept_emp
on employees.employees.emp_no = employees.dept_emp.emp_no
join employees.departments
on employees.dept_emp.dept_no = employees.departments.dept_no
where dept_name = 'Sales'
or dept_name = 'Development';

/*List the frequency counts, in descending order, of all the employee last names 
(that is, how many employees share each last name)*/
select employees.employees.last_name as "last names", count(employees.employees.last_name) as "frequency"
from employees.employees
group by "last names"
order by "last names" desc;
