DELETE FROM professor WHERE titulacao = 'Especialista';
SELECT * FROM professor;

DELETE FROM professor WHERE salario > 7000 OR salario < 6000;
SELECT * FROM professor;

DELETE FROM professor WHERE titulacao = 'Doutor' AND salario > 7500 AND salario < 7600;
SELECT * FROM professor;

DELETE FROM professor WHERE titulacao = 'Mestre' OR (salario > 6000 AND salario < 6500);
SELECT * FROM professor;
