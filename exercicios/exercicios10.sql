-- Exercícios DCL — treino 2

-- Considere que o banco faculdade e as tabelas professor, disciplina e alunos já existem.

-- 1. Criar usuários

-- Crie os usuários:

-- lucas com senha 1111
-- paula com senha 2222
CREATE USER lucas WITH PASSWORD '1111';
CREATE USER paula WITH PASSWORD '2222';

-- 2. Criar roles

-- Crie duas roles:

-- leitura
-- edicao
CREATE ROLE leitura;
CREATE ROLE edicao;

-- 3. Associar usuários

-- Associe:

-- lucas à role leitura
-- paula às roles leitura e edicao
GRANT leitura TO lucas;
GRANT leitura TO paula;
GRANT edicao TO paula;
-- 4. Permissão de leitura

-- Conceda permissão SELECT na tabela professor para a role leitura.

GRANT SELECT
ON professor
TO leitura;

-- 5. Permissões múltiplas

-- Conceda permissões SELECT e UPDATE na tabela disciplina para a role edicao.

GRANT SELECT,UPDATE 
ON disciplina
TO edicao;

-- 6. Permissão individual

-- Conceda permissão INSERT na tabela alunos para o usuário lucas.

GRANT INSERT 
ON alunos
TO lucas;

-- 7. WITH GRANT OPTION

-- Permita que paula possa repassar a permissão SELECT da tabela professor.

GRANT SELECT
ON professor 
TO paula
WITH GRANT OPTION;

-- 8. Revogar permissão

-- Remova a permissão UPDATE da role edicao na tabela disciplina.

REVOKE UPDATE
ON disciplina
FROM edicao;

-- 9. Revogar apenas GRANT OPTION

-- Remova apenas o direito de paula repassar SELECT na tabela professor.

REVOKE GRANT OPTION FOR SELECT
ON professor
FROM paula;

-- 10. Consultar roles

-- Liste todos os usuários e roles existentes.

\du

-- 11. Ver usuário atual

-- Mostre:

-- usuário atual
SELECT current_user;
-- usuário da sessão
SELECT session_user;
-- 12. Trocar role

-- Ative a role leitura.

SET ROLE leitura;

-- 13. Conectar com outro usuário

-- Conecte no banco faculdade usando o usuário lucas.

\c faculdade lucas

-- 14. Ver permissões

-- Mostre quem possui permissões na tabela disciplina.

\z disciplina

-- 15. Revogar associação

-- Remova lucas da role leitura.

REVOKE leitura FROM lucas;

-- 16. Transferir dono

-- Transfira a posse da tabela alunos para o usuário paula.

ALTER TABLE alunos OWNER TO paula;

-- 17. Remover usuário

-- Remova o usuário lucas.

DROP USER lucas; 

-- 18. Remover role

-- Remova a role edicao.

DROP ROLE edicao;