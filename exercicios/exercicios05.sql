-- Exercícios DCL
-- 1. Criar usuário

-- Crie um usuário chamado joao com senha 1234.
CREATE USER joao WITH PASSWORD '1234';

-- 2. Criar role

-- Crie uma role chamada desenvolvedores.
CREATE ROLE desenvolvedores;
-- 3. Associar usuário à role

-- Associe o usuário joao à role desenvolvedores.
GRANT desenvolvedores TO joao;

-- 4. Permissão SELECT

-- Conceda permissão de leitura na tabela professor para o usuário joao.
GRANT SELECT ON professor TO joao;

-- 5. Múltiplas permissões

-- Conceda permissões SELECT e INSERT na tabela disciplina para a role desenvolvedores.
GRANT SELECT, INSERT ON disciplina TO desenvolvedores;

-- 6. Todas as permissões

-- Conceda todas as permissões na tabela professor para o usuário admin.
GRANT ALL ON professor TO admin;

-- 7. WITH GRANT OPTION

-- Permita que o usuário admin possa repassar permissão SELECT da tabela professor.

GRANT SELECT ON professor TO admin WITH GRANT OPTION;
-- 8. Revogar permissão

-- Remova a permissão SELECT do usuário joao na tabela professor.
REVOKE SELECT ON professor FROM joao;
-- 9. Revogar INSERT

-- Remova a permissão INSERT da role desenvolvedores na tabela disciplina.
REVOKE INSERT ON disciplina FROM desenvolvedores;
-- 10. Revogar apenas GRANT OPTION

-- Remova apenas o direito de repassar permissões SELECT do usuário admin.
REVOKE GRANT OPTION FOR SELECT
ON professor
FROM admin;

-- 11. Consultar usuários e roles

-- Faça uma consulta que liste todas as roles e usuários do PostgreSQL.
\du

-- 12. Ver usuário atual

-- Mostre:

-- usuário atual
SELECT current_user;
-- usuário da sessão
SELECT session_user;

-- 13. Trocar role

-- Ative a role desenvolvedores.
SET ROLE desenvolvedores;

-- 14. Conectar com outro usuário

-- Conecte no banco faculdade usando o usuário joao.
\c faculdade joao

-- 15. Remover usuário

-- Remova o usuário joao.
DROP USER joao;

-- 16. Remover role

-- Remova a role desenvolvedores.
DROP ROLE desenvolvedores;

-- 17. Transferir dono da tabela

-- Transfira a posse da tabela professor para o usuário admin.
ALTER TABLE professor OWNER TO admin;

-- 18. Ver permissões da tabela

-- Mostre quem possui permissões na tabela professor.
\z professor