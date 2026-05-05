

-- Exercícios
-- 1. Banco de dados

-- Crie um banco chamado biblioteca e conecte nele pelo psql.
CREATE DATABASE biblioteca;

\c biblioteca


-- 2. Tabela autores

-- Crie uma tabela autores com:

-- id → SERIAL, chave primária
-- nome → VARCHAR(80), obrigatório
-- email → VARCHAR(100), único
-- ativo → BOOLEAN, padrão TRUE
-- 3. Tabela livros
CREATE TABLE autores(
    id SERIAL PRIMARY KEY,
    nome VARCHAR(80) NOT NULL,
    email VARCHAR(100) UNIQUE,
    ativa BOOLEAN DEFAULT TRUE
);

-- Crie uma tabela livros com:

-- id → SERIAL, chave primária
-- titulo → VARCHAR(100), obrigatório
-- ano_publicacao → INTEGER
-- autor_id → chave estrangeira referenciando autores(id)
-- 4. Alteração de tabela
CREATE TABLE livros(
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    ano_publicacao INTEGER,
    autor_id INTEGER,

    FOREIGN KEY (autor_id) REFERENCES autores(id)
);

-- Na tabela livros, adicione uma coluna chamada preco do tipo DECIMAL(10,2).
ALTER TABLE livros ADD COLUMN preco DECIMAL(10,2);


-- 5. Alterar tipo

-- Altere o campo titulo da tabela livros para VARCHAR(150).
ALTER TABLE livros 
ALTER COLUMN titulo TYPE VARCHAR(150);

-- 6. NOT NULL

-- Torne a coluna ano_publicacao obrigatória.
ALTER TABLE livros 
ALTER COLUMN ano_publicacao SET NOT NULL;

-- 7. DEFAULT

-- Defina valor padrão 0.00 para a coluna preco.
ALTER TABLE livros 
ALTER COLUMN preco SET DEFAULT 0.00;

-- 8. Renomear coluna

-- Renomeie ano_publicacao para ano.
ALTER TABLE livros
RENAME COLUMN ano_publicacao TO ano;

-- 9. Renomear tabela

-- Renomeie a tabela livros para obra.
ALTER TABLE livros
RENAME TO obra;

-- 10. Remover coluna

-- Remova a coluna email da tabela autores.
ALTER TABLE autores
DROP COLUMN email;

-- 11. TRUNCATE

-- Apague todos os dados da tabela obra, mantendo sua estrutura.
TRUNCATE TABLE obra;

-- 12. DROP TABLE

-- Apague a tabela obra.
DROP TABLE obra;

-- 13. DROP DATABASE

-- Saia do banco atual e apague o banco biblioteca.
\c postgres
DROP DATABASE biblioteca;