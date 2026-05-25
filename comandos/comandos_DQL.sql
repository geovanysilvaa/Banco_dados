SELECT 
numero,
tipo, 
valor_diaria,
valor_diaria * 7 * 0.9 AS "valor semanual" FROM quartos;


SELECT 
numero,
tipo, 
valor_diaria,
valor_diaria * 7 * 0.9 AS "valor semanual"
FROM quartos;


SELECT * FROM quartos WHERE status = 'Livre';
SELECT * FROM quartos WHERE status LIKE 'Livre';

SELECT nome,data_nascimento FROM hospedes WHERE nome ILIKE '%silva%' ORDER BY data_nascimento ASC;

SELECT * FROM hospedes WHERE  data_nascimento>= '1970-01-01' AND data_nascimento<='1979-12-31';

SELECT * FROM hospedes WHERE  data_nascimento BETWEEN '1970-01-01' AND'1979-12-31';