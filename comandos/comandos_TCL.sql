-- =========================================================
-- TCL (Transaction Control Language)
-- Banco de Dados II
-- Prof. Dr. Wanderson de Vasconcelos
-- =========================================================

-- A TCL é responsável pelo controle de transações
-- Uma transação é um conjunto de operações DML
-- executadas de forma atômica (tudo ou nada)


-- =========================================================
-- BEGIN
-- =========================================================

BEGIN;
-- Inicia manualmente uma transação

-- Também pode ser escrito como:
START TRANSACTION;


-- =========================================================
-- EXEMPLO COM BEGIN
-- =========================================================

BEGIN;

UPDATE professor
SET titulacao = 'Especialista'
WHERE matricula = 2023001;

-- A alteração ainda não foi salva permanentemente


-- =========================================================
-- COMMIT
-- =========================================================

COMMIT;
-- Confirma e salva permanentemente as alterações


-- =========================================================
-- EXEMPLO COM COMMIT
-- =========================================================

BEGIN;

INSERT INTO professor (matricula, nome, titulacao, salario)
VALUES (1, 'Mariana Silva', 'Mestre', 5000);

SELECT * FROM professor;
-- A transação ainda está aberta

COMMIT;
-- Agora o registro foi salvo


-- =========================================================
-- ROLLBACK
-- =========================================================

ROLLBACK;
-- Desfaz todas as alterações da transação atual


-- =========================================================
-- EXEMPLO COM ROLLBACK
-- =========================================================

BEGIN;

UPDATE disciplina
SET nome = 'Banco de Dados Avançado'
WHERE codigo = 1002;

SELECT * FROM disciplina;
-- Alteração visível dentro da transação

ROLLBACK;
-- Desfaz alteração

SELECT * FROM disciplina;
-- O valor volta ao original


-- =========================================================
-- SAVEPOINT
-- =========================================================

SAVEPOINT nome_do_ponto;
-- Cria um ponto intermediário na transação


-- =========================================================
-- ROLLBACK TO SAVEPOINT
-- =========================================================

ROLLBACK TO nome_do_ponto;
-- Desfaz apenas o que aconteceu após o savepoint


-- =========================================================
-- EXEMPLO COM SAVEPOINT
-- =========================================================

BEGIN;

INSERT INTO professor (matricula, nome, titulacao, salario)
VALUES (2023005, 'Lívia Costa', 'Mestre', 7000);

SAVEPOINT inserir_livia;

INSERT INTO professor (matricula, nome, titulacao, salario)
VALUES (2023006, 'João Batista', 'Doutor', 5000);

ROLLBACK TO inserir_livia;
-- Apenas João será desfeito

COMMIT;
-- Apenas Lívia permanece salva


-- =========================================================
-- VÁRIOS SAVEPOINTS
-- =========================================================

BEGIN;

INSERT INTO disciplina (codigo, nome, id_professor)
VALUES (2001, 'Engenharia de Software', 1);

SAVEPOINT ponto1;

INSERT INTO disciplina (codigo, nome, id_professor)
VALUES (2002, 'Lógica de Programação', 1);

SAVEPOINT ponto2;

ROLLBACK TO ponto1;
-- Remove apenas o que ocorreu após ponto1

COMMIT;


-- =========================================================
-- OBSERVAÇÕES
-- =========================================================

-- Sem BEGIN:
-- cada comando DML é salvo imediatamente

-- Com BEGIN + COMMIT:
-- alterações só são salvas ao final

-- Com BEGIN + ROLLBACK:
-- todas as alterações são desfeitas

-- Após COMMIT:
-- não é possível usar ROLLBACK