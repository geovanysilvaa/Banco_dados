UPDATE professor 
SET salario = 1000;

SELECT * FROM professor;


UPDATE professor 
SET titulacao = 'Doutor';

SELECT * FROM professor;


UPDATE professor 
SET titulacao = 'Doutor', salario = 15000;

SELECT * FROM professor;


UPDATE professor 
SET salario = 15000
WHERE titulacao = 'Doutor';

SELECT * FROM professor;

UPDATE professor 
SET salario = 20000
WHERE matricula = 11;

SELECT * FROM professor;


UPDATE professor 
SET salario = 8000, titulacao = 'Mestre'
WHERE matricula = 44;

SELECT * FROM professor;

UPDATE professor 
SET salario = 10000
WHERE salario > 7000;

SELECT * FROM professor;

UPDATE professor 
SET salario = 10000
WHERE salario >= 7000 AND salario <= 7500;

SELECT * FROM professor;

UPDATE professor 
SET salario = 10000
WHERE titulacao = 'Doutor' AND salario > 7500;

SELECT * FROM professor;

UPDATE professor 
SET salario = 10000
WHERE titulacao = 'Mestre' OR titulacao = 'Especialista';

SELECT * FROM professor;