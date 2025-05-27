-- Questão 1

select c.name, sum(o.total)
from aluno.customer c
left join aluno.ord o on c.custid = o.custid
group by c.name;

-- Questão 2

select p.descrip, sum(i.qty)
from aluno.product p
left join aluno.item i on p.prodid = i.prodid
group by p.descrip;

-- Questão 3

select e.ename, sum(o.total)
from aluno.emp e
left join customer c on e.empno = c.repid
left join ord o on c.custid = o.custid
group by e.ename;

-- Questão 4

select c.city, sum(o.total), round(avg(o.total), 2)
from aluno.customer c
left join aluno.ord o on c.custid = o.custid
group by c.city;

-- Questão 5

select c.city, sum(o.total), round(avg(o.total), 2)
from aluno.customer c
left join aluno.ord o on c.custid = o.custid
where c.city in ('SANTA CLARA', 'PALO ALTO')
group by c.city;

select c.city, sum(o.total), round(avg(o.total), 2)
from aluno.customer c
left join aluno.ord o on c.custid = o.custid
group by c.city
having c.city in ('SANTA CLARA', 'PALO ALTO');

-- Questão 6

select max(qtd_total)
from (select prodid, sum(qty) qtd_total
      from aluno.item
      group by prodid);

-- Questão 7

select p.descrip, sum(i.qty)
from aluno.product p
join aluno.item i on p.prodid = i.prodid
group by p.descrip
having sum(i.qty) = (select max(qtd_total)
                     from (select prodid, sum(qty) qtd_total
                           from aluno.item
                           group by prodid));

-- Questão 8

select m.ename, sum(o.total)
from aluno.emp m
join aluno.emp e on m.empno = e.mgr
join customer c on e.empno = c.repid
join ord o on c.custid = o.custid
group by m.ename;