-- =========================================================
-- DQL (Data Query Language)
-- Banco de Dados II
-- Prof. Dr. Wanderson de Vasconcelos
-- =========================================================

-- SELECT
-- Recupera dados de uma ou mais tabelas.

SELECT coluna1, coluna2
FROM tabela;


-- DISTINCT
-- Remove registros duplicados da consulta.

SELECT DISTINCT tipo
FROM quartos;

SELECT DISTINCT status
FROM quartos;

SELECT DISTINCT tipo, status
FROM quartos;


-- LIMIT
-- Limita a quantidade de registros retornados.

SELECT id, nome, cpf
FROM hospedes
ORDER BY id
LIMIT 5;


-- OFFSET
-- Ignora uma quantidade de registros antes de exibir o resultado.

SELECT id, nome, cpf
FROM hospedes
ORDER BY id
LIMIT 5
OFFSET 5;


-- ALIAS (AS)
-- Cria um nome temporário para colunas ou tabelas.

SELECT numero, tipo, valor_diaria AS preco
FROM quartos;

SELECT
    tipo,
    valor_diaria,
    valor_diaria * 7 AS valor_semana
FROM quartos;


-- ORDER BY
-- Ordena os resultados da consulta.

SELECT *
FROM hospedes
ORDER BY nome ASC;

SELECT *
FROM quartos
ORDER BY valor_diaria DESC;

SELECT *
FROM reservas
ORDER BY data_entrada DESC, valor_total DESC;


-- WHERE
-- Filtra registros que atendem a uma condição.

SELECT *
FROM quartos
WHERE status = 'Livre';


-- Operadores Relacionais
-- Realizam comparações entre valores.

SELECT *
FROM quartos
WHERE valor_diaria > 200;

SELECT *
FROM quartos
WHERE valor_diaria <= 400;

SELECT *
FROM quartos
WHERE tipo <> 'Luxo';


-- Operadores Lógicos
-- Combinam múltiplas condições.

SELECT *
FROM quartos
WHERE valor_diaria > 150
  AND status = 'Livre';

SELECT *
FROM quartos
WHERE status = 'Livre'
   OR status = 'Manutenção';

SELECT *
FROM quartos
WHERE NOT status = 'Ocupado';


-- LIKE
-- Procura padrões em textos.

SELECT *
FROM hospedes
WHERE nome LIKE 'M%';

-- ILIKE
-- Procura padrões em textos sem diferenciar
-- letras maiúsculas e minúsculas (PostgreSQL).

SELECT *
FROM hospedes
WHERE nome ILIKE 'M%';

-- Exemplos:
-- 'Maria'  -> encontrado
-- 'maria'  -> encontrado
-- 'MARIA'  -> encontrado


SELECT *
FROM hospedes
WHERE nome ILIKE '%silva';

-- Encontra:
-- João Silva
-- joão silva
-- JOÃO SILVA


SELECT *
FROM hospedes
WHERE nome ILIKE '%souza%';

-- Encontra qualquer nome que contenha "souza",
-- independente de letras maiúsculas ou minúsculas.

-- BETWEEN
-- Filtra valores dentro de um intervalo.

SELECT *
FROM quartos
WHERE valor_diaria BETWEEN 200 AND 500;


-- IS NULL
-- Verifica se um campo não possui valor.

SELECT *
FROM hospedes
WHERE telefone IS NULL;


-- IS NOT NULL
-- Verifica se um campo possui valor.

SELECT *
FROM hospedes
WHERE email IS NOT NULL;


-- Exemplo Combinado
-- Uso de operadores relacionais e lógicos.

SELECT *
FROM quartos
WHERE (tipo = 'Suíte' OR tipo = 'Luxo')
  AND valor_diaria > 300
  AND status = 'Livre';


-- COUNT()
-- Conta a quantidade de registros.

SELECT COUNT(*) AS total_reservas
FROM reservas;


-- SUM()
-- Soma os valores de uma coluna numérica.

SELECT SUM(valor_total) AS soma_reservas
FROM reservas;


-- AVG()
-- Calcula a média dos valores de uma coluna.

SELECT AVG(valor_diaria) AS media_diaria
FROM quartos;


-- MIN()
-- Retorna o menor valor da coluna.

SELECT MIN(valor_diaria) AS diaria_minima
FROM quartos;


-- MAX()
-- Retorna o maior valor da coluna.

SELECT MAX(valor_diaria) AS diaria_maxima
FROM quartos;


-- Funções Combinadas
-- Resumem informações da tabela.

SELECT
    COUNT(*) AS total_reservas,
    SUM(valor_total) AS soma_reservas,
    AVG(valor_total) AS media_reserva
FROM reservas;


-- ROUND()
-- Arredonda valores numéricos.

SELECT ROUND(AVG(valor_diaria), 2) AS media_diaria
FROM quartos;


-- TO_CHAR()
-- Formata números para exibição.

SELECT TO_CHAR(AVG(valor_diaria), '999G999D00') AS media_diaria
FROM quartos;


-- TO_CHAR() COM MOEDA
-- Exibe valor formatado em reais.

SELECT 'R$ ' || TO_CHAR(AVG(valor_diaria), '999G999D00') AS media_diaria
FROM quartos;


-- TO_CHAR() COM DATA
-- Formata datas para exibição.

SELECT
    data_entrada,
    TO_CHAR(data_entrada, 'DD/MM/YYYY') AS data_formatada
FROM reservas;