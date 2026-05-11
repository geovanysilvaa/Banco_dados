-- =========================================================
-- Exercícios DML
-- =========================================================

-- Considere que as tabelas professor e disciplina já existem.


-- 1. INSERT
-- Insira um professor:
-- matricula: 2024101
-- nome: Maria Silva
-- titulacao: Mestre
INSERT INTO professor (matricula,nome,titulacao) 
VALUES
(2024101,'Maria Silva','Mestre');

-- 2. INSERT
-- Insira outro professor:
-- matricula: 2024102
-- nome: João Costa
-- titulacao: Doutor
INSERT INTO  professor (matricula,nome,titulacao)
VALUES
(2024102,'João Costa','Doutor');

-- 3. INSERT múltiplas linhas
-- Insira de uma vez:
-- matricula: 2024103 | nome: Ana Lima | titulacao: Especialista
-- matricula: 2024104 | nome: Pedro Alves | titulacao: Mestre
INSERT INTO professor (matricula,nome,titulacao)
VALUES 
(2024103,'Ana Lima','Especialista'),
(2024104,'Pedro Alves','Mestre');

-- 4. SELECT
-- Liste todos os professores.
SELECT * FROM professor;

-- 5. SELECT com WHERE
-- Consulte apenas o professor de matrícula 2024102.
SELECT * FROM professor WHERE matricula = 2024102;

-- 6. INSERT com chave estrangeira
-- Insira na tabela disciplina:
-- codigo: 401
-- nome: Banco de Dados
-- id_professor: 2024101

-- Insira também:
-- codigo: 402
-- nome: Estrutura de Dados
-- id_professor: 2024102

INSERT INTO disciplina (codigo,nome,id_professor)
VALUES 
(401,'Banco de Dados',2024101),
(402,'Estrutura de Dados',2024102);


-- 7. SELECT
-- Liste todas as disciplinas.
SELECT * FROM disciplina;

-- 8. UPDATE
-- Altere a titulação do professor de matrícula 2024103 para Mestre.
UPDATE professor
SET titulacao = 'Mestre'
WHERE matricula = 2024103;

-- 9. UPDATE múltiplas colunas
-- No professor de matrícula 2024104:
-- nome: Pedro A. Alves
-- titulacao: Doutor
UPDATE professor 
SET nome = 'Pedro A. Alves', titulacao = 'Doutor'
WHERE matricula = 2024104;

-- 10. UPDATE
-- Altere o nome da disciplina de código 401 para Banco de Dados II.
UPDATE disciplina
SET nome = 'Banco de Dados II'
WHERE codigo = 401; 

-- 11. DELETE
-- Remova a disciplina de código 402.
DELETE FROM disciplina 
WHERE codigo = 402;

-- 12. DELETE
-- Remova o professor de matrícula 2024103.
DELETE FROM professor 
WHERE  matricula = 2024103;

-- 13. SELECT final
-- Liste todos os professores.
SELECT * FROM professor;

-- 14. SELECT final
-- Liste todas as disciplinas.
SELECT * FROM disciplina;