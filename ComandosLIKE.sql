DELETE FROM professor WHERE nome LIKE 'J%' OR nome LIKE 'M%';
SELECT * FROM professor;


UPDATE professor
SET salario = 15000, titulacao = 'Doutor'
WHERE nome LIKE 'M%' OR nome LIKE 'I%';
SELECT * FROM professor;


UPDATE professor
SET salario = 20000
WHERE nome LIKE 'W%' AND titulacao = 'Doutor';
SELECT * FROM professor;


UPDATE professor
SET salario = 15000
WHERE nome LIKE '%f%' OR nome LIKE '%F%';
SELECT * FROM professor;


UPDATE professor
SET salario = 20000
WHERE (nome LIKE '%y%' OR nome LIKE '%Y%') AND titulacao = 'Mestre';
SELECT * FROM professor;

UPDATE professor 
SET salario = 15000, titulacao = 'Doutor'
WHERE (titulacao = 'Mestre' OR titulacao = 'Especialista') AND (nome LIKE '%E%' OR nome LIKE '%e%');
SELECT * FROM professor;