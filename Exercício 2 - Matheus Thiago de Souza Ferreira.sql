-- Questão 1

select first_name, last_name, to_char(hire_date, 'DD-Month-YYYY') dt_hire
from aluno.employees
where substr(upper(last_name), 1,1) = 'R';

-- Questão 2

select concat(concat(e.first_name, ' '), e.last_name) employee_name, upper(d.department_name)
from aluno.employees e join aluno.departments d on e.department_id = d.department_id
where lower(d.department_name) = 'executive';

-- Questão 3

select concat(concat(first_name, ' '), last_name) employee_name, to_char(hire_date, 'DD-Month-YYYY') dt_hire
from aluno.employees
where to_char(hire_date, 'YYYY') = 1999;

-- Questão 4

select concat(concat(first_name, ' '), last_name) employee_name, round(salary / 30, 2) daily_salary, round(salary * 12, 2) annual_salary
from aluno.employees
where commission_pct is not null;

-- Questão 5

select concat(concat(first_name, ' '), last_name) employee_name, round(salary, 2) monthly_salary, round(salary + salary * nvl(commission_pct, 0), 2) total_salary
from aluno.employees;

-- Questão 6

select concat(concat(substr(upper(e.first_name), 1,1), ' '), substr(upper(e.last_name), 1,1)) employee_initials, d.department_name
from aluno.employees e join aluno.departments d on e.employee_id = d.manager_id;

-- Questão 7

select concat(concat(first_name, ' '), last_name) employee_name, round(to_char(sysdate, 'YYYY') - to_char(hire_date, 'YYYY')) years_worked, round(months_between(sysdate, hire_date)) months_worked
from aluno.employees;

-- Questão 8

select round(avg(e.salary), 2) average, max(e.salary) maximun, min(e.salary) minimun, d.department_name
from aluno.employees e join aluno.departments d on e.department_id = d.department_id
group by e.department_id, d.department_name;

-- Questão 9

select count(e.employee_id) amount_employees, d.department_name
from aluno.employees e join aluno.departments d on e.department_id = d.department_id
where lower(e.job_id) like '%clerk'
group by e.department_id, d.department_name;