--Exercício 1 — Criar tabela
create table professores(
    id int primary key,
    nome varchar(50) not null,
    idade int,
    materia varchar(60)
);

--Exercício 2 — ALTER TABLE
alter table professores add column salario int;

--Exercício 3 — FOREIGN KEY
create table turmas(
    id int primary key,
    nome varchar(50),
    professor_id int,

  foreign key (professor_id) references professores(id)
);

--Exercício 4 — INSERT
insert into professores 
(id,nome,idade,salario,materia) values
(01,'geovany',20,1000,'matematica'),
(02,'afonso',30,2000,'português');

insert into turmas 
(id,nome,professor_id) values
(01,'8b',1),
(02,'7b',2);

--Exercício 5 — ALTER mais completo
alter table professores alter column idade set not null;

--Exercício 1 — Criar tabela
create table professores(
    id int primary key,
    nome varchar(50) not null,
    idade int,
    materia varchar(60)
);

--Exercício 2 — ALTER TABLE
alter table professores add column salario int;

--Exercício 3 — FOREIGN KEY
create table turmas(
    id int primary key,
    nome varchar(50),
    professor_id int,

  foreign key (professor_id) references professores(id)
);

--Exercício 4 — INSERT
insert into professores 
(id,nome,idade,salario,materia) values
(01,'geovany',20,1000,'matematica'),
(02,'afonso',30,2000,'português');

insert into turmas 
(id,nome,professor_id) values
(01,'8b',1),
(02,'7b',2);

--Exercício 5 — ALTER mais completo
alter table professores alter column idade set not null;
alter table professores drop column materia;