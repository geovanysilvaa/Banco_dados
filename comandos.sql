-- =========================
--  COMANDOS DO TERMINAL (psql)
-- =========================

-- Entrar no PostgreSQL
psql -U usuario
-- abre o banco via terminal

-- Entrar em um banco específico
psql -U usuario -d nome_do_banco
-- conecta direto em um banco

-- Listar bancos
\l
-- mostra todos os bancos

-- Conectar em um banco
\c nome_do_banco
-- troca de banco

-- Listar tabelas
\dt
-- mostra tabelas do banco

-- Ver estrutura da tabela
\d nome_da_tabela
-- mostra colunas e tipos

-- Sair
\q
-- sai do psql


-- =========================
--  BANCO DE DADOS
-- =========================

-- Criar banco
CREATE DATABASE nome;
-- cria um novo banco

-- Apagar banco
DROP DATABASE nome;
-- remove o banco


-- =========================
--  TABELAS
-- =========================

-- Criar tabela
CREATE TABLE nome_tabela (
    id INT PRIMARY KEY,
    coluna VARCHAR(50)
);
-- cria estrutura da tabela

-- Apagar tabela
DROP TABLE nome_tabela;
-- remove tabela


-- =========================
--  INSERT
-- =========================

-- Inserir dados
INSERT INTO nome_tabela (coluna1, coluna2)
VALUES (valor1, valor2);
-- adiciona dados na tabela


-- =========================
--  TRUNCATE
-- =========================

-- Limpar tabela
TRUNCATE TABLE nome_tabela;
-- apaga todos os dados

-- Limpar com dependências
TRUNCATE TABLE nome_tabela CASCADE;
-- apaga dados mesmo com FK


-- =========================
--  FOREIGN KEY
-- =========================

-- Criar com FK
CREATE TABLE outra_tabela (
    id INT PRIMARY KEY,
    fk_id INT,
    FOREIGN KEY (fk_id) REFERENCES nome_tabela(id)
);
-- cria relação entre tabelas


-- =========================
--  ALTER TABLE
-- =========================

-- Adicionar coluna
ALTER TABLE nome_tabela ADD COLUMN coluna tipo;
-- cria nova coluna

-- Remover coluna
ALTER TABLE nome_tabela DROP COLUMN coluna;
-- remove coluna

-- Alterar tipo
ALTER TABLE nome_tabela ALTER COLUMN coluna TYPE tipo;
-- muda tipo da coluna

-- NOT NULL
ALTER TABLE nome_tabela ALTER COLUMN coluna SET NOT NULL;
-- não permite vazio

-- Remover NOT NULL
ALTER TABLE nome_tabela ALTER COLUMN coluna DROP NOT NULL;
-- permite vazio

-- DEFAULT
ALTER TABLE nome_tabela ALTER COLUMN coluna SET DEFAULT valor;
-- valor padrão automático

-- Remover DEFAULT
ALTER TABLE nome_tabela ALTER COLUMN coluna DROP DEFAULT;
-- remove valor padrão

-- Renomear coluna
ALTER TABLE nome_tabela RENAME COLUMN antigo TO novo;
-- muda nome da coluna

-- Renomear tabela
ALTER TABLE nome_tabela RENAME TO novo_nome;
-- muda nome da tabela


-- =========================
--  CONSTRAINT FOREIGN KEY (ALTER)
-- =========================

-- Adicionar FK depois da tabela
ALTER TABLE nome_tabela
ADD CONSTRAINT nome_fk
FOREIGN KEY (coluna)
REFERENCES outra_tabela(coluna);
-- cria relação depois da tabela pronta


-- =========================
--  UPDATE
-- =========================

-- Atualizar dados
UPDATE nome_tabela
SET coluna = valor
WHERE condicao;
-- altera dados existentes

-- Atualizar várias colunas
UPDATE nome_tabela
SET coluna1 = valor1,
    coluna2 = valor2
WHERE condicao;
-- altera várias colunas ao mesmo tempo


-- =========================
--  OPERADORES LÓGICOS (WHERE)
-- =========================

-- =  (igual)
-- <> (diferente)
-- >  <  >=  <=

AND
OR
NOT

-- BETWEEN
WHERE coluna BETWEEN valor1 AND valor2;
-- verifica se o valor está dentro de um intervalo (entre dois valores)

-- IN
WHERE coluna IN (valor1, valor2);
-- verifica se o valor está dentro de uma lista de opções

-- LIKE e tambem ______
WHERE coluna LIKE 'A%';   -- começa com A
WHERE coluna LIKE '%a';   -- termina com a
WHERE coluna LIKE '%a%';  -- contém a

-- =========================
--  CURRENT (DATA E HORA)
-- =========================

-- Data atual
CURRENT_DATE
-- só data

-- Hora atual
CURRENT_TIME
-- só hora

-- Data e hora
CURRENT_TIMESTAMP
-- data + hora atual


-- =========================
--  DELETE
-- =========================

DELETE FROM nome_tabela WHERE condição;