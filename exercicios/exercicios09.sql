-- Exercícios DCL

-- Considere que o banco faculdade e as tabelas professor e disciplina já existem.

-- 1. Criar usuário
-- Crie um usuário chamado maria com senha 1234.
CREATE USER maria WITH PASSWORD '1234';

-- 2. Criar usuário

-- Crie um usuário chamado carlos com senha abcd.
CREATE USER carlos WITH PASSWORD 'abcd';

-- 3. Criar role

-- Crie uma role chamada pesquisadores.
CREATE ROLE pesquisadores;

-- 4. Associar usuário à role

-- Associe os usuários maria e carlos à role pesquisadores.
GRANT pesquisadores TO maria;
GRANT pesquisadores TO carlos;

-- 5. Permissão SELECT

-- Conceda permissão de leitura na tabela professor para a role pesquisadores.
GRANT SELECT 
ON professor
TO pesquisadores;

-- 6. Múltiplas permissões

-- Conceda permissões SELECT e INSERT na tabela disciplina para a role pesquisadores.
GRANT SELECT,INSERT 
ON disciplina 
TO pesquisadores;

-- 7. Permissão individual

-- Conceda permissão UPDATE na tabela professor para o usuário maria.
GRANT UPDATE 
ON professor
TO maria;

-- 8. WITH GRANT OPTION

-- Permita que maria possa repassar permissão SELECT da tabela professor.
GRANT SELECT 
ON professor
TO maria
WITH GRANT OPTION;

-- 9. Revogar permissão

-- Remova a permissão INSERT da role pesquisadores na tabela disciplina.
REVOKE INSERT
ON disciplina
FROM pesquisadores;


-- 10. Revogar apenas GRANT OPTION

-- Remova apenas o direito de maria repassar a permissão SELECT na tabela professor.
REVOKE GRANT OPTION FOR SELECT
ON professor
FROM maria;

-- 11. Consultar roles e usuários

-- Liste todos os usuários e roles existentes.
\du

-- 12. Ver usuário atual

-- Mostre:

-- usuário atual
SELECT current_user;
-- usuário da sessão
SELECT session_user;

-- 13. Trocar role

-- Ative a role pesquisadores.
SET ROLE pesquisadores;

-- 14. Conectar com outro usuário

-- Conecte no banco faculdade usando o usuário maria.
\c faculdade maria

-- 15. Ver permissões

-- Mostre quem possui permissões na tabela professor.
\z professor

-- 16. Revogar associação

-- Remova o usuário carlos da role pesquisadores.
REVOKE pesquisadores
FROM carlos;

-- 17. Transferir dono

-- Transfira a posse da tabela disciplina para o usuário maria.
ALTER TABLE disciplina OWNER TO maria;

-- 18. Remover usuário

-- Remova o usuário carlos.
DROP USER carlos;

-- 19. Remover role

-- Remova a role pesquisadores.
DROP ROLE pesquisadores;