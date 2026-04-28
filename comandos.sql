-- =========================
--  COMANDOS DO TERMINAL (psql)
-- =========================

-- Entrar no PostgreSQL
psql -U usuario
-- Abre o terminal do PostgreSQL com o usuário informado

-- Entrar em um banco específico
psql -U usuario -d nome_do_banco
-- Já conecta direto em um banco específico

-- Listar bancos
\l
-- Lista todos os bancos disponíveis

-- Conectar em um banco
\c nome_do_banco
-- Troca para o banco desejado

-- Listar tabelas
\dt
-- Mostra todas as tabelas do banco atual

-- Ver estrutura da tabela
\d nome_da_tabela
-- Mostra colunas, tipos e restrições da tabela

-- Sair do psql
\q
-- Encerra o terminal do PostgreSQL

-- =========================
--  BANCO DE DADOS
-- =========================

-- Criar banco
CREATE DATABASE nome;
-- Cria um novo banco de dados

-- Apagar banco
DROP DATABASE nome;
-- Remove o banco (CUIDADO: perde tudo)

-- =========================
--  TABELAS
-- =========================

-- Criar tabela
CREATE TABLE nome_tabela (
id INT PRIMARY KEY,
coluna VARCHAR(50)
);
-- Define estrutura da tabela com chave primária

-- Apagar tabela
DROP TABLE nome_tabela;
-- Remove a tabela completamente

-- =========================
--  INSERT
-- =========================

-- Inserir dados
INSERT INTO nome_tabela (coluna1, coluna2)
VALUES (valor1, valor2);
-- Insere uma nova linha na tabela

-- =========================
--  TRUNCATE
-- =========================

-- Limpar tabela
TRUNCATE TABLE nome_tabela;
-- Remove TODOS os dados rapidamente (sem WHERE)

-- Limpar com dependências
TRUNCATE TABLE nome_tabela CASCADE;
-- Remove dados mesmo se houver relações (FK)

-- =========================
--  FOREIGN KEY
-- =========================

-- Criar tabela com chave estrangeira
CREATE TABLE outra_tabela (
id INT PRIMARY KEY,
fk_id INT,
FOREIGN KEY (fk_id) REFERENCES nome_tabela(id)
);
-- Cria relação entre tabelas (integridade referencial)

-- =========================
--  ALTER TABLE
-- =========================

-- Adicionar coluna
ALTER TABLE nome_tabela ADD COLUMN coluna tipo;
-- Adiciona nova coluna

-- Remover coluna
ALTER TABLE nome_tabela DROP COLUMN coluna;
-- Remove coluna existente

-- Alterar tipo da coluna
ALTER TABLE nome_tabela ALTER COLUMN coluna TYPE tipo;
-- Muda o tipo de dado

-- Definir NOT NULL
ALTER TABLE nome_tabela ALTER COLUMN coluna SET NOT NULL;
-- Obriga preenchimento

-- Remover NOT NULL
ALTER TABLE nome_tabela ALTER COLUMN coluna DROP NOT NULL;
-- Permite valores nulos

-- Definir valor padrão
ALTER TABLE nome_tabela ALTER COLUMN coluna SET DEFAULT valor;
-- Valor automático ao inserir

-- Remover valor padrão
ALTER TABLE nome_tabela ALTER COLUMN coluna DROP DEFAULT;

-- Renomear coluna
ALTER TABLE nome_tabela RENAME COLUMN antigo TO novo;

-- Renomear tabela
ALTER TABLE nome_tabela RENAME TO novo_nome;

-- =========================
--  CONSTRAINT (FK via ALTER)
-- =========================

ALTER TABLE nome_tabela
ADD CONSTRAINT nome_fk
FOREIGN KEY (coluna)
REFERENCES outra_tabela(coluna);
-- Adiciona chave estrangeira após tabela já criada

-- =========================
--  UPDATE
-- =========================

UPDATE nome_tabela
SET coluna = valor
WHERE condicao;
-- Atualiza dados específicos

UPDATE nome_tabela
SET coluna1 = valor1,
coluna2 = valor2
WHERE condicao;
-- Atualiza múltiplas colunas

-- =========================
--  OPERADORES (WHERE)
-- =========================

-- Comparação:
-- = igual
-- <> diferente
-- > < >= <=

-- Lógicos:
AND  -- E
OR   -- OU
NOT  -- NÃO

-- Intervalo
WHERE coluna BETWEEN valor1 AND valor2;

-- Lista de valores
WHERE coluna IN (valor1, valor2);

-- Busca por padrão (texto)
WHERE coluna LIKE 'A%';   -- começa com A
WHERE coluna LIKE '%a';   -- termina com a
WHERE coluna LIKE '%a%';  -- contém "a"

-- =========================
--  DATA E HORA
-- =========================

CURRENT_DATE       -- Data atual
CURRENT_TIME       -- Hora atual
CURRENT_TIMESTAMP  -- Data e hora

-- =========================
--  DELETE
-- =========================

DELETE FROM nome_tabela WHERE condição;
-- Remove registros específicos (use com cuidado)

-- =========================
--  USUÁRIOS E PERMISSÕES
-- =========================

CREATE USER geovany WITH PASSWORD '1234';
-- Cria usuário

CREATE ROLE developer;
-- Cria grupo (role)

GRANT developer TO geovany;
-- Associa usuário a uma role

GRANT SELECT ON hospedes TO geovany;
-- Permite leitura

GRANT ALL ON hospedes TO teodora WITH GRANT OPTION;
-- Permite tudo + pode repassar permissões

-- Ver roles
SELECT rolname, rolsuper, rolcreaterole, rolcreatedb
FROM pg_roles;

-- Usuário atual
SELECT current_user;

-- Usuário da sessão
SELECT session_user;

-- Listar usuários
\du

-- Trocar usuário ativo
SET ROLE geovany;

-- Conectar com usuário
\c nome_da_base nome_usuario

-- Remover usuário
DROP USER nome_do_usuario;

-- Remover role
DROP ROLE nome_da_role;

-- Transferir dono de tabela
ALTER TABLE tabela OWNER TO novo_usuario;

-- =========================
--  REVOKE (REMOVER PERMISSÃO)
-- =========================

REVOKE permissão ON objeto FROM usuario;

-- Remove permissão concedida

REVOKE GRANT OPTION FOR permissão
ON objeto
FROM aluno01;
-- Remove apenas o direito de repassar permissões

REVOKE SELECT
ON hospedes, quartos, reservas
FROM aluno01;
-- Remove acesso de leitura

-- =========================
--  VER PERMISSÕES
-- =========================

\z nome_da_tabela;
-- Mostra quem tem acesso à tabela