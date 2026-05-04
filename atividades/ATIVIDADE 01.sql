-- Script DDL para criação da base de dados FACULDADE
-- Nome:Geovany de Olveira Silva batista
-- Disciplina:Banco de Dado II
-- ADS - Modulo 03
-- Atividade 01

------------------------------------------------------
\c postgres

DROP DATABASE if EXISTS faculdade;

CREATE DATABASE faculdade;

\c faculdade

CREATE TABLE cadastro (
    id SERIAL PRIMARY KEY,
    nome_pessoa VARCHAR(50) NOT NULL,
    email VARCHAR(70) UNIQUE NOT NULL,
    telefone VARCHAR(40) UNIQUE NOT NULL,
    data_criacao DATE DEFAULT CURRENT_DATE
);

CREATE TABLE materia (
    id SERIAL PRIMARY KEY,
    nome_materia VARCHAR(50) NOT NULL,
    id_cadastro INT NOT NULL,
    data_criacao DATE DEFAULT CURRENT_DATE,
    
    FOREIGN KEY (id_cadastro) REFERENCES cadastro(id)
);

CREATE TABLE alunos (
    id SERIAL PRIMARY KEY,
    nome_aluno VARCHAR(50) NOT NULL,
    email VARCHAR(60) UNIQUE NOT NULL,
    telefone VARCHAR(40) UNIQUE NOT NULL,
    data_criacao DATE DEFAULT CURRENT_DATE
);

CREATE TABLE matricula (
    id SERIAL PRIMARY KEY,
    id_aluno INT NOT NULL,
    id_materia INT NOT NULL,
    data_matricula DATE DEFAULT CURRENT_DATE,

    FOREIGN KEY (id_aluno) REFERENCES alunos(id),
    FOREIGN KEY (id_materia) REFERENCES materia(id)
);

CREATE TABLE notas (
    id SERIAL PRIMARY KEY,
    id_matricula INT NOT NULL,
    nota DECIMAL(5,2) NOT NULL,
    semestre VARCHAR(10),

    FOREIGN KEY (id_matricula) REFERENCES matricula(id)
);