-- =========================================================
-- Instituto Federal do Piauí – IFPI Campus Piripiri
-- Curso: Tecnologia em Análise e Desenvolvimento de Sistemas
-- Disciplina: Banco de Dados II
-- Professor: Wanderson de Vasconcelos
-- Atividade 06 – DQL Parte 01
-- Nome: Geovany de Oliveira Silva Batista
-- Data de entrega: 31/03/2025
-- =========================================================

-- Objetivo:
-- Conectar ao banco de dados chamado "hotel".
\c hotel

-- 1. DISTINCT + ORDER BY
-- Objetivo:
-- Listar todos os tipos de quartos sem repetição,
-- ordenando em ordem alfabética crescente.

SELECT DISTINCT tipo
FROM quartos
ORDER BY tipo ASC;

-- 2. WHERE + ORDER BY
-- Objetivo:
-- Exibir número, tipo, status e valor da diária
-- dos quartos com diária maior que 200,
-- que não estejam ocupados,
-- ordenando do mais caro para o mais barato.

SELECT numero, tipo, status, valor_diaria
FROM quartos
WHERE valor_diaria > 200
  AND status != 'Ocupado'
ORDER BY valor_diaria DESC;

-- 3. LIKE + IS NOT NULL
-- Objetivo:
-- Listar hóspedes que possuem telefone cadastrado
-- e cujo nome começa com a letra "M",
-- ordenando os resultados pelo nome.

SELECT nome, telefone, email
FROM hospedes
WHERE telefone IS NOT NULL
  AND nome LIKE 'M%'
ORDER BY nome ASC;

-- 4. BETWEEN + ORDER BY
-- Objetivo:
-- Listar reservas com valor total entre 800 e 2500
-- e data de entrada após 01/01/2024,
-- ordenando pelo maior valor total
-- e pela data mais recente em caso de empate.

SELECT id, hospede_id, numero_quarto, valor_total, data_entrada
FROM reservas
WHERE valor_total BETWEEN 800 AND 2500
  AND data_entrada > '2024-01-01'
ORDER BY valor_total DESC, data_entrada DESC;

-- 5. LIMIT + OFFSET
-- Objetivo:
-- Mostrar os quartos ordenados pela diária do maior para o menor,
-- ignorando os 3 primeiros registros
-- e exibindo apenas os próximos 5.

SELECT numero, tipo, valor_diaria, status
FROM quartos
ORDER BY valor_diaria DESC
OFFSET 3
LIMIT 5;

-- 6. Operadores Lógicos + Parênteses
-- Objetivo:
-- Listar hóspedes nascidos antes de 1995,
-- com email cadastrado,
-- cujo nome comece com "A" ou "J".

SELECT nome, data_nascimento, email
FROM hospedes
WHERE data_nascimento <= '1995-01-01'
  AND email IS NOT NULL
  AND (nome LIKE 'A%' OR nome LIKE 'J%');

-- 7. Alias + Expressões
-- Objetivo:
-- Exibir os quartos usando apelidos (alias) nas colunas
-- e calcular o valor correspondente a 5 diárias.

SELECT
    numero AS quarto,
    tipo AS categoria,
    valor_diaria AS preco_noite,
    valor_diaria * 5 AS valor_5_noites
FROM quartos
ORDER BY valor_diaria DESC;

-- 8. Funções de Agregação + WHERE
-- Objetivo:
-- Calcular a quantidade de reservas,
-- a soma dos valores totais
-- e a média dos valores,
-- considerando reservas acima de 1000
-- e com entrada após 01/06/2023.

SELECT COUNT(*) AS quantidade_de_reservas, SUM(valor_total) AS soma_total, AVG(valor_total) AS media_valores
FROM reservas
WHERE valor_total > 1000
AND data_entrada > '2023-06-01';

-- 9. ROUND + TO_CHAR
-- Objetivo:
-- Calcular a média das diárias dos quartos
-- que não estejam em manutenção
-- e tenham diária maior que 150,
-- formatando o resultado em moeda.

SELECT
    'R$ ' || TO_CHAR(ROUND(AVG(valor_diaria), 2), '999G999D00') AS "média diária"
FROM quartos
WHERE status <> 'Manutenção'
  AND valor_diaria > 150;

-- 10. Consulta Avançada (Questão Integrada)
-- Objetivo:
-- Listar hóspedes que possuem telefone e email cadastrados,
-- que não terminam com "Silva"
-- e nasceram entre 1980 e 2000.
-- Exibir a data formatada,
-- ordenar do mais velho para o mais novo,
-- ignorar os 2 primeiros registros
-- e mostrar apenas os próximos 6.

SELECT
    id,
    nome,
    telefone,
    email,
    TO_CHAR(data_nascimento, 'DD/MM/YYYY') AS data_nascimento
FROM hospedes
WHERE telefone IS NOT NULL
  AND email IS NOT NULL
  AND nome NOT LIKE '%Silva'
  AND data_nascimento BETWEEN '1980-01-01' AND '2000-12-31'
ORDER BY data_nascimento ASC
OFFSET 2
LIMIT 6;