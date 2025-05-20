-- Questão 1

select e.first_name, e.last_name, d.department_name
from aluno.employees e
left join aluno.departments d on e.department_id = d.department_id;

-- Questão 2

select e.first_name, e.last_name, d.department_name
from aluno.departments d
right join aluno.employees e on d.department_id = e.department_id;

-- Questão 3

select d.department_name, e.first_name
from aluno.departments d
left join aluno.employees e on d.department_id = e.department_id;

-- Questão 4

select e.first_name, e.last_name, d.department_name
from aluno.employees e
full join aluno.departments d on e.department_id = d.department_id;

-- Questão 5

select e.first_name, e.last_name
from aluno.employees e
where 1 >= (select count(jh.employee_id)
            from aluno.job_history jh
            where e.employee_id = jh.employee_id
            group by jh.employee_id);

-- Questão 6

select distinct e.first_name, e.last_name
from aluno.employees e
where exists (select 1
              from aluno.job_history jh
              where e.employee_id = jh.employee_id);

-- Questão 7

select e.first_name, e.last_name, jh.job_id, jh.start_date, jh.end_date
from aluno.employees e
left join aluno.job_history jh on e.employee_id = jh.employee_id;

-- Questão 8

select e.first_name, e.last_name, jh.job_id, jh.start_date, jh.end_date, j.job_title
from aluno.employees e
left join aluno.job_history jh on e.employee_id = jh.employee_id
left join aluno.jobs j on jh.job_id = j.job_id;