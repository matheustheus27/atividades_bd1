-- Questão 1

create table TIME(id number(5), nome varchar2(20));
commit;

create table JOGO(data date, placar_casa number(2), placar_visitante number(2));
commit;

create table JOGADOR(cpf varchar2(11), nome varchar2(30));
commit;

-- Questão 2

insert into TIME values(1, 'Cruzeiro');
insert into TIME values(2, 'America');
insert into TIME values(3, 'Atletico');

insert into JOGO values('04/12/2011', 6, 1);
insert into JOGO values('06/06/1993', 4, 0);
insert into JOGO values('15/08/2025', 1, 2);

insert into JOGADOR values('11111111111', 'Gabriel Barbosa');
insert into JOGADOR values('22222222222', 'Martin Benitez');
insert into JOGADOR values('33333333333', 'Hulk');

-- Questão 3

alter table TIME
add constraint pk_TIME primary key(id);

alter table JOGADOR
add constraint pk_JOGADOR primary key(cpf);

-- Questão 4

alter table JOGO
add (id_casa number(5), id_visitante number(5));

alter table JOGO
add constraint fk_time_casa foreign key(id_casa) references TIME(id) on delete cascade;

alter table JOGO
add constraint fk_time_visitante foreign key(id_visitante) references TIME(id) on delete cascade;

alter table JOGADOR
add id_time number(5);

alter table JOGADOR
add constraint fk_time foreign key(id_time) references TIME(id);

-- Questão 5

update JOGO set id_casa = 1, id_visitante = 3
where data = '04/12/2011';

update JOGO set id_casa = 2, id_visitante = 3
where data = '06/06/1993';

update JOGO set id_casa = 3, id_visitante = 1
where data = '15/08/2025';


update JOGADOR set id_time = 1
where cpf = '11111111111';

update JOGADOR set id_time = 2
where cpf = '22222222222';

update JOGADOR set id_time = 3
where cpf = '33333333333';

-- Questão 6

alter table JOGO
add constraint pk_JOGO primary key (data, id_casa, id_visitante);

-- Questão 7

alter table JOGADOR
modify id_time not null;

-- Questão 8

alter table JOGADOR
add constraint uk_nome unique(nome);