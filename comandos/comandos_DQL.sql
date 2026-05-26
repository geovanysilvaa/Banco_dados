-- Exercícios DQL — Sistema de Hotelaria PostgreSQL

-- Exercício 1 — DISTINCT

-- Liste todos os tipos de quartos sem repetir.

SELECT DISTINCT tipo
FROM quartos;

-- Exercício 2 — WHERE

-- Liste todos os quartos livres.

SELECT *
FROM quartos
WHERE status = 'Livre';

-- Exercício 3 — OR

-- Liste quartos do tipo Luxo ou Premium.

SELECT *
FROM quartos
WHERE tipo = 'Luxo'
OR tipo = 'Premium';

-- Exercício 4 — NOT

-- Liste quartos que não estão ocupados.

SELECT *
FROM quartos
WHERE NOT status = 'Ocupado';

-- Exercício 5 — BETWEEN

-- Liste quartos com diária entre 100 e 300 reais.

SELECT *
FROM quartos
WHERE valor_diaria BETWEEN 100 AND 300;

-- Exercício 6 — LIKE

-- Liste hóspedes cujo nome começa com Ana.

SELECT *
FROM hospedes
WHERE nome LIKE 'Ana%';

-- Exercício 7 — ILIKE

-- Liste hóspedes cujo nome contém silva ignorando maiúsculas e minúsculas.

SELECT *
FROM hospedes
WHERE nome ILIKE '%silva%';

-- Exercício 8 — IS NULL

-- Liste reservas sem valor total registrado.

SELECT *
FROM reservas
WHERE valor_total IS NULL;

-- Exercício 9 — ORDER BY

-- Liste quartos ordenados da diária mais cara para a mais barata.

SELECT *
FROM quartos
ORDER BY valor_diaria DESC;

-- Exercício 10 — LIMIT

-- Mostre apenas os 3 primeiros hóspedes cadastrados.

SELECT *
FROM hospedes
LIMIT 3;

-- Exercício 11 — OFFSET

-- Pule os 2 primeiros hóspedes e mostre os próximos 3.

SELECT *
FROM hospedes
LIMIT 3 OFFSET 2;

-- Exercício 12 — Alias com AS

-- Mostre número do quarto e valor semanal com desconto.

SELECT
numero,
tipo,
valor_diaria,
valor_diaria * 7 * 0.9 AS "valor semanal"
FROM quartos;

-- Exercício 13 — ORDER BY ASC

-- Liste hóspedes ordenados por data de nascimento crescente.

SELECT nome, data_nascimento
FROM hospedes
ORDER BY data_nascimento ASC;

-- Exercício 14 — BETWEEN com datas

-- Liste hóspedes nascidos entre 1980 e 1990.

SELECT *
FROM hospedes
WHERE data_nascimento BETWEEN '1980-01-01' AND '1990-12-31';

-- Exercício 15 — LIKE exato

-- Liste quartos cujo status seja Livre usando LIKE.

SELECT *
FROM quartos
WHERE status LIKE 'Livre';

-- Exercício 16 — WHERE com AND

-- Liste quartos livres com diária menor que 200.

SELECT *
FROM quartos
WHERE status = 'Livre'
AND valor_diaria < 200;

-- Exercício 17 — ILIKE começo

-- Liste hóspedes cujo nome começa com joão ignorando maiúsculas.

SELECT *
FROM hospedes
WHERE nome ILIKE 'joão%';

-- Exercício 18 — NOT com BETWEEN

-- Liste quartos cuja diária NÃO esteja entre 150 e 300.

SELECT *
FROM quartos
WHERE NOT valor_diaria BETWEEN 150 AND 300;

-- Exercício 19 — LIMIT + ORDER BY

-- Liste os 5 quartos mais caros.

SELECT *
FROM quartos
ORDER BY valor_diaria DESC
LIMIT 5;

-- Exercício 20 — Alias simples

-- Mostre descrição e valor do serviço usando alias.

SELECT
descricao AS servico,
valor AS preco
FROM servicos;