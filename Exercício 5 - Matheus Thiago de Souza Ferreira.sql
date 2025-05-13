-- Questão 1

select department_name
from aluno.departments
where department_id not in (select distinct department_id
                            from aluno.employees
                            where department_id is not null);

-- Questão 2

select department_name
from aluno.departments
where department_id in (select department_id
                        from aluno.departments
                        minus
                        select department_id
                        from aluno.employees
                        where department_id is not null);

-- Questão 3

select concat(e.first_name, concat(' ', e.last_name)) full_name, d.department_name
from aluno.employees e
join aluno.departments d on e.department_id = d.department_id;

-- Questão 4

select concat(e.first_name, concat(' ', e.last_name)) full_name, d.department_name
from aluno.employees e
left join aluno.departments d on e.department_id = d.department_id;

-- Questão 5

select e.first_name, j.job_id, j.start_date, j.end_date
from aluno.employees e
join aluno.job_history j on e.employee_id = j.employee_id;

-- Questão 6

select e.first_name, jh.job_id, j.job_title, jh.start_date, jh.end_date
from aluno.employees e
join aluno.job_history jh on e.employee_id = jh.employee_id
join aluno.jobs j on jh.job_id = j.job_id;

-- Questão 7

select distinct job_title
from aluno.jobs
where job_id in (select job_id
                from aluno.employees
                where department_id in (select department_id
                                        from aluno.departments
                                        where location_id in (select location_id
                                                              from aluno.locations
                                                              where city = 'Seattle')));

-- Questão 8

select distinct j.job_title
from aluno.jobs j
join aluno.employees e on j.job_id = e.job_id 
join aluno.departments d on e.department_id = d.department_id
join aluno.locations l on d.location_id = l.location_id
where l.city = 'Seattle';