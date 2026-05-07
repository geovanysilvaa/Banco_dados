--  Exercícios
-- 1. Banco de dados

-- Crie um banco chamado empresa e conecte nele pelo psql.
CREATE DATABASE empresa;
\c empresa
-- 2. Tabela departamentos

-- Crie uma tabela departamentos com:

-- id → SERIAL, chave primária
-- nome → VARCHAR(60), obrigatório
-- ativo → BOOLEAN, padrão TRUE
CREATE TABLE departamentos(
    id SERIAL PRIMARY KEY,
    nome VARCHAR(60) NOT NULL,
    ativo BOOLEAN DEFAULT TRUE
);

-- 3. Tabela funcionarios

-- Crie uma tabela funcionarios com:

-- id → SERIAL, chave primária
-- nome → VARCHAR(80), obrigatório
-- salario → DECIMAL(10,2)
-- data_admissao → DATE
-- departamento_id → chave estrangeira referenciando departamentos(id)
CREATE TABLE funcionarios(
    id SERIAL PRIMARY KEY,
    nome VARCHAR(80) NOT NULL,
    salario DECIMAL(10,2),
    data_admissao DATE,
    departamento_id INTEGER,

    FOREIGN KEY (departamento_id) REFERENCES departamentos(id)
);

-- 4. Adicionar coluna

-- Na tabela funcionarios, adicione a coluna email do tipo VARCHAR(100).
ALTER TABLE funcionarios ADD COLUMN email VARCHAR(100);

-- 5. Alterar tipo

-- Altere a coluna nome para VARCHAR(120).
ALTER TABLE funcionarios ALTER COLUMN nome TYPE VARCHAR(120);

-- 6. NOT NULL

-- Torne a coluna salario obrigatória.
ALTER TABLE funcionarios ALTER COLUMN salario SET NOT NULL;

-- 7. DEFAULT

-- Defina valor padrão CURRENT_DATE para data_admissao.
ALTER TABLE funcionarios ALTER COLUMN data_admissao SET DEFAULT CURRENT_DATE;

-- 8. Renomear coluna

-- Renomeie a coluna salario para salario_base.
ALTER TABLE funcionarios RENAME COLUMN salario TO salario_base;
-- 9. Renomear tabela

-- Renomeie a tabela funcionarios para colaboradores.
ALTER TABLE funcionarios RENAME TO colaboradores;   

-- 10. Remover coluna

-- Remova a coluna email.
ALTER TABLE colaboradores DROP COLUMN email;

-- 11. Criar tabela projetos


-- Crie uma tabela projetos com:

-- id → SERIAL, chave primária
-- nome → VARCHAR(80), obrigatório
-- colaborador_id → chave estrangeira referenciando colaboradores(id)
CREATE TABLE projetos(
    id SERIAL PRIMARY KEY,
    nome VARCHAR(80) NOT NULL,
    colaborador_id INTEGER,

    FOREIGN KEY (colaborador_id) REFERENCES colaboradores(id)
);

-- 12. Adicionar foreign key via ALTER

-- Crie uma tabela tarefas com:


-- id → SERIAL, chave primária
-- descricao → TEXT

-- Depois, usando ALTER TABLE, adicione a coluna projeto_id e crie uma chave estrangeira para projetos(id).
CREATE TABLE tarefas(
    id SERIAL PRIMARY KEY,
    descricao TEXT,
   
);
LATER TABLE tarefas ADD COLUMN projeto_id INTEGER;
ALTER TABLE tarefas ADD CONSTRAINT fk FOREIGN KEY (projeto_id) REFERENCES projetos(id);

-- 13. TRUNCATE

-- Apague todos os dados da tabela projetos.
TRUNCATE TABLE projetos;

-- 14. TRUNCATE CASCADE

-- Apague todos os dados da tabela colaboradores, incluindo dependências.

TRUNCATE TABLE colaboradores CASCADE;
-- 15. DROP TABLE


-- Apague a tabela tarefas.
DROP TABLE tarefas;

-- 16. DROP DATABASE

-- Saia do banco atual e remova o banco empresa. 
\c postgres

DROP DATABASE empresa;