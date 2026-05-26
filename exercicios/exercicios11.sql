-- Exercícios DQL — Sistema de Hotelaria PostgreSQL

-- Exercício 1
-- Liste todos os tipos de quartos sem repetir.

SELECT DISTINCT tipos FROM quartos; 




-- Exercício 2
-- Liste todos os quartos livres.


SELECT * FROM quarto WHERE status = 'Livre';



-- Exercício 3
-- Liste quartos do tipo Luxo ou Premium.


SELECT tipos FROM quartos WHERE 'Luxo' OR 'Premium';



-- Exercício 4
-- Liste quartos que não estão ocupados.



SELECT * FROM quartos WHERE NOT status = 'ocupados';


-- Exercício 5
-- Liste quartos com diária entre 100 e 300 reais.

SELECT * FROM quartos WHERE valor_diaria BETWEEN 200 AND 500;




-- Exercício 6
-- Liste hóspedes cujo nome começa com Ana.



SELECT * FROM  hospedes WHERE nome LIKE "Ana%"


-- Exercício 7
-- Liste hóspedes cujo nome contém silva ignorando maiúsculas e minúsculas.


SELECT * FROM hospedes WHERE nome ILIKE "%silva%";



-- Exercício 8
-- Liste reservas sem valor total registrado.


SELECT * FROM reservas WHERE valor_total IS NULL; 



-- Exercício 9
-- Liste quartos ordenados da diária mais cara para a mais barata.


SELECT * FROM quartos ORDER BY  valor_diaria ASC;
 


-- Exercício 10
-- Mostre apenas os 3 primeiros hóspedes cadastrados.


SELECT * FROM hospedes LIMIT 3;



-- Exercício 11
-- Pule os 2 primeiros hóspedes e mostre os próximos 3.



SELECT * FROM hospedes LIMIT 3 OFFSET 2;


-- Exercício 12
-- Mostre número do quarto, tipo e o valor semanal com 10% de desconto usando alias.






-- Exercício 13
-- Liste hóspedes ordenados por data de nascimento crescente.






-- Exercício 14
-- Liste hóspedes nascidos entre 1980 e 1990.






-- Exercício 15
-- Liste quartos cujo status seja Livre usando LIKE.



SELECT * FROM quartos WHERE status = 'Livre';


-- Exercício 16
-- Liste quartos livres com diária menor que 200.


SELECT * FROM quartos WHERE status = 'Livre' AND valor_diaria < 200;



-- Exercício 17
-- Liste hóspedes cujo nome começa com joão ignorando maiúsculas e minúsculas.



SELECT * FROM hospedes WHERE nome ILIKE 'joão%';


-- Exercício 18
-- Liste quartos cuja diária NÃO esteja entre 150 e 300.


SELECT * from quartos WHERE NOT valor_diaria BETWEEN 150 AND 300;



-- Exercício 19
-- Liste os 5 quartos mais caros.



SELECT * FROM quartos ORDER BY valor_diaria DESC LIMIT 5;


-- Exercício 20
-- Mostre descrição e valor do serviço usando alias.

SELECT
descricao AS servico,
valor AS preco
FROM servicos;


SELECT nom,data_nascimento
FROM hospedes
WHERE NOT data_nascimento BETWEEN '1980-01-01' AND '1989-12-31';

SELECT * FROM hospedes WHERE teleno IS NULL;

SELECT * FROM hospedes WHERE teleno IS NOT NULL;

SELECT * FROM quartos WHERE (tipo ='Suite' OR tipo = 'Luxo')
AND valor_diaria > 300
AND status ='Livre';