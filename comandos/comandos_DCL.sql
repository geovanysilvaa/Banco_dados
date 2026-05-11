-- =========================================================
-- DCL (Data Control Language)
-- Banco de Dados II
-- Prof. Dr. Wanderson de Vasconcelos
-- =========================================================


-- =========================================================
-- CRIAÇÃO DE USUÁRIOS
-- =========================================================

CREATE USER nome_usuario
WITH PASSWORD 'senha';
-- Cria um novo usuário no PostgreSQL


-- Exemplo
CREATE USER aluno
WITH PASSWORD '1234';



-- =========================================================
-- CRIAÇÃO DE ROLES (GRUPOS)
-- =========================================================

CREATE ROLE nome_role;
-- Cria uma role (grupo de permissões)


-- Exemplo
CREATE ROLE leitores;



-- =========================================================
-- ASSOCIAR USUÁRIO A UMA ROLE
-- =========================================================

GRANT nome_role TO nome_usuario;
-- Adiciona o usuário à role


-- Exemplo
GRANT leitores TO aluno;



-- =========================================================
-- GRANT (CONCEDER PERMISSÕES)
-- =========================================================

GRANT permissao
ON objeto
TO usuario_ou_role;
-- Concede uma permissão


-- Permissões comuns:
-- SELECT
-- INSERT
-- UPDATE
-- DELETE
-- ALL


-- Exemplo: leitura
GRANT SELECT
ON professor
TO aluno;


-- Exemplo: múltiplas permissões
GRANT SELECT, INSERT
ON disciplina
TO analista;


-- Exemplo: todas as permissões
GRANT ALL
ON professor
TO coordenador;
-- ALL equivale a SELECT, INSERT, UPDATE e DELETE



-- =========================================================
-- WITH GRANT OPTION
-- =========================================================

GRANT SELECT
ON professor
TO analista
WITH GRANT OPTION;
-- Permite que o usuário repasse a permissão


-- Exemplo de repasse
GRANT SELECT
ON professor
TO estagiario;



-- =========================================================
-- REVOKE (REMOVER PERMISSÕES)
-- =========================================================

REVOKE permissao
ON objeto
FROM usuario_ou_role;
-- Remove uma permissão concedida anteriormente


-- Exemplo
REVOKE SELECT
ON professor
FROM aluno;

 
-- Exemplo em role
REVOKE INSERT
ON disciplina
FROM editores;



-- =========================================================
-- REMOVER APENAS O GRANT OPTION
-- =========================================================

REVOKE GRANT OPTION FOR SELECT
ON professor
FROM coordenador;
-- Remove apenas o direito de repassar a permissão
-- O usuário continua podendo consultar



-- =========================================================
-- CONSULTAR ROLES E USUÁRIOS
-- =========================================================
 
 
SELECT rolname, rolsuper, rolcreaterole, rolcreatedb
FROM pg_roles;
-- Lista usuários e roles existentes


-- Via terminal
\du
-- Lista usuários e roles



-- =========================================================
-- USUÁRIO ATUAL
-- =========================================================

SELECT current_user;
-- Mostra o usuário atualmente ativo

SELECT session_user;
-- Mostra quem iniciou a sessão



-- =========================================================
-- TROCAR ROLE
-- =========================================================

SET ROLE nome_role;
-- Ativa uma role recebida com GRANT



-- =========================================================
-- CONECTAR COM OUTRO USUÁRIO
-- =========================================================

\q
-- Sai do psql

psql -U novo_usuario -d nome_do_banco
-- Entra novamente usando outro usuário

-- Conectar com outro usuário
\c nome_do_banco nome_usuario
-- Conecta no banco faculdade usando o usuário aluno


-- =========================================================
-- REMOVER USUÁRIOS E ROLES
-- =========================================================

DROP USER nome_do_usuario;
-- Remove usuário

DROP ROLE nome_da_role;
-- Remove role



-- =========================================================
-- TRANSFERIR DONO DE OBJETO
-- =========================================================

ALTER TABLE tabela
OWNER TO novo_usuario;
-- Transfere a posse da tabela antes de excluir usuário



-- =========================================================
-- VER PERMISSÕES DE UMA TABELA
-- =========================================================

\z nome_da_tabela
-- Mostra quem tem acesso à tabela

