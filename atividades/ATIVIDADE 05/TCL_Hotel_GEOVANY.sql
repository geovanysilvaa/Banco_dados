-- =========================================================
-- Instituto Federal de Educação, Ciência e Tecnologia do Piauí
-- Campus Piripiri
-- Curso: ADS
-- Disciplina: Banco de Dados II
-- Professor: Dr. Wanderson de Vasconcelos
-- Aluno: Geovany de Oliveira Silva Batista
-- Atividade: TCL no PostgreSQL
-- Banco de Dados: HOTEL
-- =========================================================

\c hotel;

-- =========================================================
-- 1. TRANSAÇÃO COM COMMIT
-- =========================================================

BEGIN;

INSERT INTO hospedes(nome, cpf, data_nascimento, telefone, email)
VALUES ('Geovany', '1234567', '1990-01-01', '1199', 'geovany@email.com');

INSERT INTO quartos(numero, tipo, valor_diaria, status)
VALUES (10, 'Casal', 100.00, 'Disponível');

INSERT INTO reservas(hospede_id, numero_quarto, data_entrada, data_saida, valor_total)
VALUES (1, 10, '2024-07-01', '2024-07-10', 1000.00);

COMMIT;


-- =========================================================
-- 2. TRANSAÇÃO COM ROLLBACK
-- =========================================================

BEGIN;

INSERT INTO hospedes(nome, cpf, data_nascimento, telefone, email)
VALUES ('Afonso', '134567', '1990-01-01', '1010', 'afonso@email.com');

INSERT INTO quartos(numero, tipo, valor_diaria, status)
VALUES (20, 'Solteiro', 80.00, 'Disponível');

INSERT INTO reservas(hospede_id, numero_quarto, data_entrada, data_saida, valor_total)
VALUES (2, 20, '2024-08-01', '2024-08-05', 500.00);

ROLLBACK;

SELECT * FROM hospedes WHERE cpf = '134567';
SELECT * FROM reservas WHERE hospede_id = 2;


-- =========================================================
-- 3. TRANSAÇÃO COM MÚLTIPLAS OPERAÇÕES (CORRIGIDO)
-- =========================================================

BEGIN;

INSERT INTO hospedes(nome, cpf, data_nascimento, telefone, email)
VALUES ('Maria', '12345678', '1995-03-15', '1199', 'maria@email.com');

INSERT INTO quartos(numero, tipo, valor_diaria, status)
VALUES (30, 'Luxo', 200.00, 'Disponível');

INSERT INTO reservas(hospede_id, numero_quarto, data_entrada, data_saida, valor_total)
VALUES (3, 30, '2024-09-01', '2024-09-07', 1200.00);

INSERT INTO servicos(descricao, valor)
VALUES ('Café da manhã', 25.00);

-- usa último ID de reserva de forma segura
INSERT INTO consumos(reserva_id, servico_id, quantidade)
SELECT r.id, s.id, 2
FROM reservas r, servicos s
WHERE r.hospede_id = 3 AND s.descricao = 'Café da manhã';

UPDATE reservas
SET valor_total = valor_total + (25.00 * 2)
WHERE hospede_id = 3;

COMMIT;


-- =========================================================
-- 4. SAVEPOINT (CORRIGIDO E FUNCIONAL)
-- =========================================================

BEGIN;

INSERT INTO hospedes(nome, cpf, data_nascimento, telefone, email)
VALUES ('Joao', '123456789', '1990-01-01', '1199', 'joao@email.com');

INSERT INTO quartos(numero, tipo, valor_diaria, status)
VALUES (40, 'Standard', 150.00, 'Disponível');

INSERT INTO reservas(hospede_id, numero_quarto, data_entrada, data_saida, valor_total)
VALUES (4, 40, '2024-07-01', '2024-07-10', 800.00);

SAVEPOINT sp1;

INSERT INTO servicos(descricao, valor)
VALUES ('Almoço', 50.00);

SAVEPOINT sp2;

INSERT INTO consumos(reserva_id, servico_id, quantidade)
SELECT r.id, s.id, 4
FROM reservas r, servicos s
WHERE r.hospede_id = 4 AND s.descricao = 'Almoço';

-- desfaz só consumo
ROLLBACK TO SAVEPOINT sp2;

-- desfaz serviço também
ROLLBACK TO SAVEPOINT sp1;

COMMIT;


-- =========================================================
-- 5. SIMULAÇÃO DE ERRO (CORRIGIDO)
-- =========================================================

BEGIN;

INSERT INTO hospedes(nome, cpf, data_nascimento, telefone, email)
VALUES ('Ana', '1234567890', '2000-11-10', '1199', 'ana@email.com');

INSERT INTO quartos(numero, tipo, valor_diaria, status)
VALUES (50, 'Standard', 120.00, 'Disponível');

-- ERRO proposital: hóspede não existe (9999)
INSERT INTO reservas(hospede_id, numero_quarto, data_entrada, data_saida, valor_total)
VALUES (9999, 50, '2024-11-01', '2024-11-05', 700.00);

ROLLBACK;

SELECT * FROM hospedes WHERE cpf = '1234567890';