-- Exercícios de DQL
-- SELECT

-- 1. Liste todos os dados da tabela hospedes.
SELECT * FROM hospedes;
-- 2. Liste apenas o nome e o CPF dos hóspedes.
SELECT nome,cpf FROM hospedes;
-- 3. Liste apenas o número e o tipo dos quartos.
SELECT numero,tipo FROM quartos;
-- DISTINCT

-- 4. Liste todos os tipos de quartos sem repetição.
SELECT DISTINCT tipo FROM quartos;
-- 5. Liste todos os status de quartos sem repetição.
SELECT DISTINCT status FROM quartos;
-- 6. Liste todas as combinações únicas de tipo e status dos quartos.
SELECT DISTINCT status,tipo FROM quartos;
-- LIMIT e OFFSET

-- 7. Mostre os 5 primeiros hóspedes cadastrados.
SELECT * FROM hospedes LIMIT 5;
-- 8. Mostre os próximos 5 hóspedes após os 5 primeiros.
SELECT * FROM hospedes LIMIT 5 OFFSET 5;
-- 9. Mostre os 3 primeiros quartos cadastrados.
SELECT * FROM quartos LIMIT 3;
-- ALIAS

-- 10. Mostre o nome do hóspede usando o alias cliente.
SELECT nome AS cliente FROM hospedes;
-- 11. Mostre o tipo do quarto como categoria.
SELECT tipo AS categoria FROM quartos;
-- 12. Mostre o valor da diária como preco_noite.
SELECT valor_diaria AS preco_noite FROM quantos;
-- ORDER BY

-- 13. Liste os hóspedes em ordem alfabética.
SELECT * FROM hospedes ORDER BY nome DESC; 
-- 14. Liste os quartos do mais caro para o mais barato.
SELECT * FROM quantos ORDER BY valor_diaria ASC;
-- 15. Liste os serviços do menor valor para o maior.
SELECT * FROM serviços ORDER BY valor ASC;
-- 16. Liste as reservas pela data de entrada mais recente.
SELECT * FROM reservas ORDER BY data_entrada ASC;

-- WHERE

-- 17. Mostre apenas os quartos com status 'Livre'.
SELECT * FROM quartos WHERE status = 'Livre';
-- 18. Mostre os quartos com diária maior que 300.
SELECT * FROM quartos WHERE valor_diaria > 300;
-- 19. Mostre os quartos com diária menor que 200.
SELECT * FROM quartos WHERE valor_diaria < 200;
-- 20. Mostre os hóspedes que possuem CPF igual a um valor específico.
SELECT * FROM quartos WHERE cpf = '11100011100';
-- LIKE

-- 21. Liste hóspedes cujo nome começa com a letra A.
SELECT * FROM hospedes WHERE nome LIKE 'A%';
-- 22. Liste hóspedes cujo nome termina com Silva.
SELECT * FROM hospedes WHERE nome LIKE '%A';
-- 23. Liste hóspedes cujo nome contém Souza.
SELECT *FROM hospedes WHERE nome LIKE '%Souza%';
-- BETWEEN

-- 24. Liste quartos com diária entre 150 e 400.
SELECT * FROM quantos WHERE valor_diaria BETWEEN 150 AND 400; 
-- 25. Liste reservas com valor total entre 500 e 2000.
SELECT * FROM reservas WHERE valor_total BETWEEN 500 AND 2000;
-- IS NULL e IS NOT NULL

-- 26. Liste hóspedes sem telefone.
SELECT * FROM hospedes WHERE telefone IS NULL;
-- 27. Liste hóspedes com e-mail cadastrado.
SELECT * FROM hospedes WHERE email IS NOT NULL;
-- 28. Liste hóspedes sem e-mail.

-- Operadores Lógicos

-- 29. Liste quartos com diária maior que 300 e status 'Livre'.
SELECT * FROM quartos WHERE valor_diaria > 300 AND status = 'Livre';
-- 30. Liste quartos com status 'Livre' ou 'Manutenção'.
SELECT * FROM quartos WHERE status = 'Livre' OR 'Manutenção';
-- 31. Liste quartos que não estejam ocupados.
SELECT * FROM quartos WHERE status <> 'Ocupado';
-- 32. Liste hóspedes cujo nome começa com M e possuem telefone cadastrado.
SELECT * FROM hospedes WHERE nome LIKE 'M%' AND telefone IS NOT NULL;
-- COUNT

-- 33. Conte quantos hóspedes existem cadastrados.
SELECT COUNT(numero) FROM hospedes;
-- 34. Conte quantos quartos existem.

-- 35. Conte quantas reservas existem.

-- SUM

-- 36. Calcule o valor total arrecadado com reservas.

-- 37. Calcule o valor total dos serviços.

-- AVG

-- 38. Calcule a média das diárias dos quartos.

-- 39. Calcule a média do valor das reservas.

-- MIN e MAX

-- 40. Mostre a menor diária cadastrada.

-- 41. Mostre a maior diária cadastrada.

-- 42. Mostre o menor e o maior valor dos serviços.

-- ROUND

-- 43. Mostre a média das diárias arredondada para 2 casas decimais.

-- 44. Mostre a média das reservas arredondada para 2 casas decimais.

-- TO_CHAR

-- 45. Mostre a média das diárias formatada com duas casas decimais.

-- 46. Mostre o total arrecadado com reservas formatado em reais.

-- 47. Mostre as datas de entrada das reservas no formato DD/MM/YYYY.

-- Desafio (misturando tudo)

-- 48. Liste os quartos do tipo 'Luxo' com diária maior que 400, ordenados do mais caro para o mais barato.

-- 49. Conte quantos quartos possuem status 'Livre'.

-- 50. Mostre a média das diárias dos quartos do tipo 'Luxo', arredondada para duas casas decimais.