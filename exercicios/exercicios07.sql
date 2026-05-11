-- Exercícios
-- 1. Banco de dados

-- Crie um banco chamado loja e conecte nele pelo psql.

CREATE DATABASE loja;
\c loja
-- 2. Tabela clientes

-- Crie uma tabela clientes com:

-- id → SERIAL, chave primária
-- nome → VARCHAR(80), obrigatório
-- email → VARCHAR(100), único
-- ativo → BOOLEAN, padrão TRUE

CREATE TABLE clientes(
    id SERIAL PRIMARY KEY,
    nome VARCHAR(80) NOT NULL,
    email VARCHAR(100) UNIQUE,
    ativo BOOLEAN DEFAULT TRUE
);

-- 3. Tabela pedidos

-- Crie uma tabela pedidos com:

-- id → SERIAL, chave primária
-- cliente_id → chave estrangeira referenciando clientes(id)
-- data_pedido → DATE

CREATE TABLE pedidos(
    id SERIAL PRIMARY KEY,
    cliente_id INTEGER,
    data_pedido DATE,

    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

-- 4. Tabela com data e hora

-- Crie uma tabela movimentacoes com:

-- id → SERIAL, chave primária
-- descricao → TEXT, obrigatório
-- data_registro → data atual por padrão
-- hora_registro → hora atual por padrão
-- momento_registro → data e hora atuais por padrão

CREATE TABLE movimentacoes(
    id SERIAL PRIMARY KEY,
    descricao TEXT NOT NULL,
    data_registro DATE DEFAULT CURRENT_DATE,
    hora_registro TIME DEFAULT CURRENT_TIME,
    momento_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 5. ALTER TABLE — adicionar coluna

-- Na tabela clientes, adicione a coluna telefone do tipo VARCHAR(20).
ALTER TABLE clientes ADD COLUMN telefone VARCHAR(20);   

-- 6. ALTER TABLE — remover coluna

-- Remova a coluna telefone.
ALTER TABLE clientes DROP COLUMN telefone;

-- 7. ALTER TABLE — alterar tipo

-- Na tabela clientes, altere nome para VARCHAR(120).
ALTER TABLE clientes ALTER COLUMN nome TYPE VARCHAR(120);

-- 8. ALTER TABLE — NOT NULL

-- Na tabela pedidos, torne data_pedido obrigatória.
ALTER TABLE pedidos ALTER COLUMN data_pedido SET NOT NULL;

-- 9. ALTER TABLE — DEFAULT

-- Na tabela pedidos, defina CURRENT_DATE como valor padrão para data_pedido.
ALTER TABLE pedidos ALTER COLUMN data_pedido SET DEFAULT CURRENT_DATE;

-- 10. ALTER TABLE — renomear coluna

-- Na tabela pedidos, renomeie data_pedido para data_compra.
ALTER TABLE pedidos RENAME COLUMN data_pedido TO data_compra;

-- 11. ALTER TABLE — renomear tabela

-- Renomeie a tabela pedidos para vendas.
ALTER TABLE pedidos RENAME TO vendas;

-- 12. ALTER TABLE — add foreign key

-- Crie uma tabela itens com:

-- id → SERIAL, chave primária
-- descricao → VARCHAR(100)
CREATE TABLE itens (
    id SERIAL PRIMARY KEY,
    descricao VARCHAR(100)
);

-- Depois, usando ALTER TABLE, adicione a coluna venda_id e crie uma chave estrangeira para vendas(id).
ALTER TABLE itens ADD COLUMN venda_id INTEGER;

ALTER TABLE itens ADD CONSTRAINT fk_venda FOREIGN KEY (venda_id) REFERENCES vendas(id);

-- 13. TRUNCATE

-- Apague todos os dados da tabela itens.
TRUNCATE TABLE itens;

-- 14. TRUNCATE CASCADE

-- Apague todos os dados da tabela clientes, incluindo dependências.
TRUNCATE TABLE clientes CASCADE;

-- 15. DROP TABLE

-- Apague a tabela movimentacoes.
DROP TABLE movimentacoes;


-- 16. DROP DATABASE

-- Saia do banco atual e remova o banco loja.
\c postgres
DROP DATABASE loja; 