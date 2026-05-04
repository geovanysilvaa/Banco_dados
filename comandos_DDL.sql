-- =========================================================
-- DDL (Data Definition Language)
-- Banco de Dados II
-- Prof. Dr. Wanderson de Vasconcelos
-- =========================================================

-- A DDL é usada para criar, alterar e remover estruturas
-- do banco de dados, como tabelas e bancos


-- =========================================================
-- CREATE DATABASE
-- =========================================================

CREATE DATABASE escola;
-- Cria um banco de dados chamado escola


-- Conectar ao banco no psql
\c escola



-- =========================================================
-- CREATE TABLE
-- =========================================================

CREATE TABLE alunos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    data_nascimento DATE,
    email VARCHAR(100) UNIQUE,
    ativo BOOLEAN DEFAULT TRUE
);
-- id: chave primária com auto incremento
-- nome: obrigatório
-- email: não permite repetição
-- ativo: valor padrão TRUE



-- =========================================================
-- CREATE TABLE COM FOREIGN KEY
-- =========================================================

CREATE TABLE matriculas (
    id SERIAL PRIMARY KEY,
    aluno_id INTEGER,
    curso VARCHAR(50),
    FOREIGN KEY (aluno_id)
        REFERENCES alunos(id)
);
-- Cria vínculo entre matriculas.aluno_id e alunos.id



-- =========================================================
-- EXEMPLO DO MATERIAL
-- =========================================================

CREATE DATABASE faculdade;

\c faculdade

CREATE TABLE professor (
    matricula INTEGER PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    titulacao VARCHAR(20)
);

CREATE TABLE disciplina (
    codigo INTEGER PRIMARY KEY,
    nome VARCHAR(30) NOT NULL,
    matricula INTEGER,
    FOREIGN KEY (matricula)
        REFERENCES professor(matricula)
);



-- =========================================================
-- TABELA COM DATA E HORA
-- =========================================================

CREATE TABLE tarefas (
    id SERIAL PRIMARY KEY,
    descricao TEXT NOT NULL,
    data_criacao DATE DEFAULT CURRENT_DATE,
    hora_criacao TIME DEFAULT CURRENT_TIME,
    momento_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- CURRENT_DATE: data atual
-- CURRENT_TIME: hora atual
-- CURRENT_TIMESTAMP: data e hora atuais



-- =========================================================
-- DROP DATABASE
-- =========================================================

DROP DATABASE faculdade;
-- Remove o banco de dados
-- O banco não pode estar em uso



-- =========================================================
-- DROP TABLE
-- =========================================================

DROP TABLE disciplina;
-- Remove a tabela disciplina

DROP TABLE professor;
-- Remove a tabela professor



-- =========================================================
-- DROP TABLE CASCADE
-- =========================================================

DROP TABLE professor CASCADE;
-- Remove a tabela e objetos dependentes
-- Exemplo: foreign keys



-- =========================================================
-- ALTER TABLE - ADICIONAR COLUNA
-- =========================================================

ALTER TABLE professor
ADD COLUMN email VARCHAR(100);
-- Adiciona nova coluna



-- =========================================================
-- ALTER TABLE - REMOVER COLUNA
-- =========================================================

ALTER TABLE professor
DROP COLUMN email;
-- Remove a coluna



-- =========================================================
-- ALTER TABLE - ALTERAR TIPO
-- =========================================================

ALTER TABLE professor
ALTER COLUMN titulacao TYPE VARCHAR(40);
-- Altera o tipo da coluna



-- =========================================================
-- ALTER TABLE - NOT NULL
-- =========================================================

ALTER TABLE professor
ALTER COLUMN nome SET NOT NULL;
-- Torna a coluna obrigatória

ALTER TABLE professor
ALTER COLUMN nome DROP NOT NULL;
-- Remove obrigatoriedade



-- =========================================================
-- ALTER TABLE - RENOMEAR COLUNA
-- =========================================================

ALTER TABLE professor
RENAME COLUMN titulacao TO grau_academico;
-- Renomeia coluna



-- =========================================================
-- ALTER TABLE - RENOMEAR TABELA
-- =========================================================

ALTER TABLE professor
RENAME TO docente;
-- Renomeia tabela



-- =========================================================
-- ALTER TABLE - ADD FOREIGN KEY
-- =========================================================

ALTER TABLE disciplina
ADD CONSTRAINT fk_professor
FOREIGN KEY (matricula)
REFERENCES professor(matricula);
-- Adiciona chave estrangeira após criação da tabela



-- =========================================================
-- ALTER TABLE - DEFAULT
-- =========================================================

ALTER TABLE professor
ALTER COLUMN titulacao SET DEFAULT 'graduado';
-- Define valor padrão

ALTER TABLE professor
ALTER COLUMN titulacao DROP DEFAULT;
-- Remove valor padrão



-- =========================================================
-- TRUNCATE
-- =========================================================

TRUNCATE TABLE disciplina;
-- Remove todos os dados
-- Mantém a estrutura da tabela



-- =========================================================
-- TRUNCATE CASCADE
-- =========================================================

TRUNCATE TABLE professor CASCADE;
-- Remove dados da tabela e das dependentes