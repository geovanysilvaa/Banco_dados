-- BEGIN
-- START TRANSACTION
-- ROLLBACK
-- COMMIT
-- SAVEPOINT


UPDATE professor
SET salario = 10000
WHERE matricula = 55;

UPDATE professor
SET titulacao = 'Mestre'
WHERE matricula = 44;

UPDATE professor
SET salario = 7000
WHERE matricula = 44;

DELETE FROM professor
WHERE titulacao LIKE 'Mestre';


ROLLBACK TO nome_do_ponto;

INSERT INTO professor VALUES 
(100,'Afonso','Especialista',6750.00);

UPDATE professor
SET salario = 7000
WHERE titulacao = 'Especialista';

UPDATE professor
SET salario = 8000
WHERE titulacao = 'Mestre';
