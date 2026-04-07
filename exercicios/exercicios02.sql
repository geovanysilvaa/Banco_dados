--Exercício 1 — Criar + Constraint

-- Crie uma tabela chamada cursos:
-- id (PK)
-- nome (NOT NULL)
-- carga_horaria (INT)

create table cursos(
    id int primary key,
    nome varchar(50) not null,
    carga_horaria int
);

--Exercício 2 — ALTER completo

-- Na tabela cursos:
-- Adicione uma coluna preco (INT)
-- Depois coloque valor padrão 500
-- Depois torne preco NOT NULL

alter table cursos add column preco int;
alter table cursos alter column preco set default 500;
alter table cursos alter column preco set not null;

--Exercício 3 — Relacionamento

-- Crie uma tabela chamada alunos:
-- id (PK)
-- nome (NOT NULL)
create table alunos(
    id int primary key,
    nome varchar(50) not null
);

-- Crie uma tabela chamada matriculas:
-- id (PK)
-- aluno_id (FK → alunos.id)
-- curso_id (FK → cursos.id)


create table matriculas(
    id int primary key,
    aluno_id int,
    curso_id int,

    foreign key (aluno_id) references alunos(id),
    foreign key (curso_id) references cursos(id)
);

--Exercício 4 — INSERT (relacionado)

-- Insira:
-- 2 cursos
-- 2 alunos
-- 2 matriculas ligando eles


insert into cursos 
(id,nome,carga_horaria,preco)
values
(01,'poo',60,1000),
(02,'banco de dados',100,1000);

insert into alunos 
(id,nome)
values
(01,'geovany'),
(02,'gleyson');

insert into matriculas
(id,aluno_id,curso_id)
values
(01,01,01),
(02,02,02);


--Exercício 5 — ALTER avançado

-- Na tabela alunos:
-- Adicione coluna idade
-- Depois altere o tipo para SMALLINT
-- Depois defina valor padrão 18

alter table alunos add column idade int;
alter table alunos alter column idade TYPE SMALLINT;
alter table alunos alter column idade set default 18;

--Exercício 6 — Pensamento (esse é importante)

-- Na tabela cursos:
-- Remova a coluna carga_horaria
-- Depois adicione novamente com tipo INT

alter table cursos drop column carga_horaria;
alter table cursos add column carga_horaria int;