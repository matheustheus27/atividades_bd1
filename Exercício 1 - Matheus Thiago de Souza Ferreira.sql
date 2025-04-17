-- DDL

create table DEPARTAMENTO(numero number(5) primary key, nome varchar2(20) not null, cpf_gerente varchar2(11), dt_ini_gerente date);

commit;

create table FUNCIONARIO(cpf varchar2(11) primary key, primeiro_nome varchar2(20) not null, nome_meio varchar(50), ultimo_nome varchar2(30) not null, dt_nascimento date not null, endereco varchar2(100), sexo varchar2(1), salario decimal(10, 2), cpf_supervisor varchar2(11), num_dp number(5) not null references DEPARTAMENTO(numero));

commit;

alter table DEPARTAMENTO add foreign key (cpf_gerente) references FUNCIONARIO(cpf);

commit;

alter table FUNCIONARIO add foreign key (cpf_supervisor) references FUNCIONARIO(cpf);

commit;

create table LOCALIZACOES_DEPARTAMENTO(num_dp number(5) not null references DEPARTAMENTO(numero) on delete cascade, local varchar2(100), primary key(num_dp, local));

commit;

create table PROJETO(numero number(5) primary key, nome varchar2(30) not null, local varchar2(100), num_dp number(5) not null references DEPARTAMENTO(numero));

commit;

create table TRABALHA_EM(cpf_funcionario varchar2(11) not null references FUNCIONARIO(cpf) on delete cascade, num_projeto number(5) not null references PROJETO(numero) on delete cascade, horas decimal(10, 2), primary key(cpf_funcionario, num_projeto));

commit;

create table DEPENDENTE(cpf_funcionario varchar2(11) not null references FUNCIONARIO(cpf) on delete cascade, nome varchar2(100) not null, sexo varchar2(1), dt_nascimento date not null, parentesco varchar(20) not null, primary key(cpf_funcionario, nome));

commit;

alter table DEPARTAMENTO add constraint uk_cpf_gerente unique(cpf_gerente);

commit;


-- DML

insert into DEPARTAMENTO(numero, nome, dt_ini_gerente) values(5, 'Pesquisa', '22/05/1988');
insert into DEPARTAMENTO(numero, nome, dt_ini_gerente) values(4, 'Administração', '01/01/1995');
insert into DEPARTAMENTO(numero, nome, dt_ini_gerente) values(1, 'Matriz', '19/06/1981');

commit;

insert into FUNCIONARIO values('88866555576', 'Jorge', 'E', 'Brito', '10/11/1937', 'Rua do Horto, 35, São Paulo, SP', 'M', 50000, null, 1);
insert into FUNCIONARIO values('33344555587', 'Fernando', 'T', 'Wong', '08/12/1955', 'Rua da Lapa, 34, São Paulo, SP', 'M', 40000, '88866555576', 5);
insert into FUNCIONARIO values('95765432168', 'Jennifer', 'S', 'Souza', '20/06/1941', 'Av. Arthur de Lima, 54, Santo André, SP', 'F', 43000, '88866555576', 4);
insert into FUNCIONARIO values('12345678966', 'João', 'B', 'Silva', '09/01/1955', 'Rua das Flores, 751, São Paulo, SP', 'M', 30000, '33344555587', 5);
insert into FUNCIONARIO values('65688444476', 'Ronaldo', 'K', 'Lima', '15/09/1962', 'Rua Rebouças, 65, Piracicaba, SP', 'M', 38000, '33344555587', 5);
insert into FUNCIONARIO values('45345345376', 'Joice', 'A', 'Leite', '31/07/1972', 'Av. Luvas Obees, 74, São Paulo, SP', 'F', 25000, '33344555587', 5);
insert into FUNCIONARIO values('99988777767', 'Alice', 'J', 'Zelaya', '19/01/1968', 'Rua Souza Lima, 35, Curitiba, PR', 'F', 25000, '95765432168', 4);
insert into FUNCIONARIO values('98798798733', 'André', 'V', 'Pereira', '29/03/1969', 'Rua Timbira, 35, Curitiba, PR', 'M', 25000, '95765432168', 4);

commit;

update DEPARTAMENTO set cpf_gerente='88866555576' where numero=1;
update DEPARTAMENTO set cpf_gerente='33344555587' where numero=5;
update DEPARTAMENTO set cpf_gerente='95765432168' where numero=4;

commit;

insert into LOCALIZACOES_DEPARTAMENTO values(1, 'São Paulo');
insert into LOCALIZACOES_DEPARTAMENTO values(4, 'Mauá');
insert into LOCALIZACOES_DEPARTAMENTO values(5, 'Santo André');
insert into LOCALIZACOES_DEPARTAMENTO values(5, 'Itu');
insert into LOCALIZACOES_DEPARTAMENTO values(5, 'São Paulo');

commit;

insert into PROJETO values(1, 'ProdutoX', 'Santo André', 5);
insert into PROJETO values(2, 'ProdutoY', 'Itu', 5);
insert into PROJETO values(3, 'ProdutoZ', 'São Paulo', 5);
insert into PROJETO values(10, 'Informatização', 'Mauá', 4);
insert into PROJETO values(20, 'Reorganização', 'São Paulo', 1);
insert into PROJETO values(30, 'Novosbeneficios', 'Mauá', 4);

commit;

insert into DEPENDENTE values('33344555587', 'Alicia', 'F', '05/04/1986', 'Filha');
insert into DEPENDENTE values('33344555587', 'Tiago', 'M', '20/10/1983', 'Filho');
insert into DEPENDENTE values('33344555587', 'Janaina', 'F', '03/10/1958', 'Esposa');
insert into DEPENDENTE values('95765432168', 'Antonio', 'M', '28/02/1942', 'Marido');
insert into DEPENDENTE values('12345678966', 'Michael', 'M', '04/01/1988', 'Filho');
insert into DEPENDENTE values('12345678966', 'Alicia', 'F', '30/12/1988', 'Filha');
insert into DEPENDENTE values('12345678966', 'Elizabeth', 'F', '05/05/1957', 'Esposa');

commit;

insert into TRABALHA_EM values('12345678966', 1, 32.5);
insert into TRABALHA_EM values('12345678966', 2, 7.5);
insert into TRABALHA_EM values('65688444476', 3, 40);
insert into TRABALHA_EM values('45345345376', 1, 20);
insert into TRABALHA_EM values('45345345376', 2, 20);
insert into TRABALHA_EM values('33344555587', 2, 10);
insert into TRABALHA_EM values('33344555587', 3, 10);
insert into TRABALHA_EM values('33344555587', 10, 10);
insert into TRABALHA_EM values('33344555587', 20, 10);
insert into TRABALHA_EM values('99988777767', 30, 30);
insert into TRABALHA_EM values('99988777767', 10, 10);
insert into TRABALHA_EM values('98798798733', 10, 35);
insert into TRABALHA_EM values('98798798733', 30, 5);
insert into TRABALHA_EM values('95765432168', 30, 20);
insert into TRABALHA_EM values('95765432168', 20, 15);
insert into TRABALHA_EM values('88866555576', 20, null);

commit;