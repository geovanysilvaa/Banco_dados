-- =========================
--  COMANDOS DO TERMINAL (psql)
-- =========================

-- Entrar no PostgreSQL
-- psql -U postgres

-- Entrar em um banco específico
-- psql -U postgres -d nome_do_banco

-- Listar bancos de dados
-- \l

-- Conectar em um banco
-- \c nome_do_banco

-- Listar tabelas do banco atual
-- \dt

-- Ver estrutura de uma tabela
-- \d nome_da_tabela

-- Sair do psql
-- \q


-- =========================
--  COMANDOS SQL BÁSICOS
-- =========================

-- Criar banco de dados
CREATE DATABASE nome;

-- Apagar banco de dados
DROP DATABASE nome;

-- Apaga se existir
DROP DATABASE IF EXISTS nome_base;


-- =========================
--  TABELAS
-- =========================

Criar tabela
CREATE TABLE alunos (
    id INT PRIMARY KEY,
    nome VARCHAR(50)
);

-- Apagar tabela
DROP TABLE alunos;


-- =========================
--  INSERT
-- =========================

-- Inserir dados

INSERT INTO alunos (id, nome) VALUES (1, 'geovany');

INSERT INTO
alunos (id, nome)
VALUES
(1, 'geovany'),
(2, 'geovany'),
(3, 'geovany'),
(4, 'geovany');

-- =========================
--  TRUNCATE (limpar tabela)
-- =========================

-- Limpa todos os dados da tabela
TRUNCATE TABLE alunos;

-- Limpa e reinicia relações (FK)
TRUNCATE TABLE alunos CASCADE;


-- =========================
--  FOREIGN KEY (REFERENCES)
-- =========================

CREATE TABLE matriculas (
    id INT PRIMARY KEY,
    aluno_id INT,
    FOREIGN KEY (aluno_id) REFERENCES alunos(id)
);


-- =========================
--  ALTER TABLE
-- =========================

-- Adicionar coluna
ALTER TABLE alunos ADD COLUMN idade INT;

-- Remover coluna
ALTER TABLE alunos DROP COLUMN idade;

-- Alterar tipo da coluna
ALTER TABLE alunos ALTER COLUMN idade TYPE SMALLINT;

-- NOT NULL
ALTER TABLE alunos ALTER COLUMN nome SET NOT NULL;

-- DEFAULT
ALTER TABLE alunos ALTER COLUMN idade SET DEFAULT 18;

-- Remover DEFAULT
ALTER TABLE alunos ALTER COLUMN idade DROP DEFAULT;

-- Renomear coluna
ALTER TABLE alunos RENAME COLUMN nome TO nome_novo;

-- Renomear uma tabela
ALTER TABLE alunos RENAME TO estudantes;

-- =========================
--  CONSTRAINT FOREIGN KEY (ADD CONSTRAINT)
-- =========================

-- Adicionar chave estrangeira depois da tabela já criada
ALTER TABLE matriculas ADD CONSTRAINT fk_aluno FOREIGN KEY (aluno_id) REFERENCES alunos(id);

-- =========================
--  UPDATE
-- =========================
UPDATE nome_coluna
SET coluna1 = valor1, coluna2 = valor2
WHERE condicao;

UPDATE professor
SET salario = 15000, titulacao = 'Doutor';