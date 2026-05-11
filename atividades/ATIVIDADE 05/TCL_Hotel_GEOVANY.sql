-- =====================================================
-- Instituto Federal do Piauí - IFPI Campus Piripiri
-- Curso: Tecnologia em Análise e Desenvolvimento de Sistemas
-- Disciplina: Banco de Dados II
-- Professor: Dr. Wanderson de Vasconcelos
-- Aluno: Geovany de Oliveira Silva Batista
-- Atividade: TCL no PostgreSQL
-- Banco de Dados: HOTEL
-- =====================================================

-- Conectando ao banco de dados HOTEL
\c hotel

-- =====================================================
-- 1. TRANSAÇÃO COM COMMIT
-- =====================================================

-- Iniciando a transação
BEGIN;

-- Inserindo um novo hóspede
INSERT INTO hospedes(nome, cpf, data_nascimento, telefone, email)
VALUES ('Geovany Silva', '11111111111', '1990-01-01', '86999999999', 'geovany@email.com');

-- Verificando o hóspede inserido
SELECT * FROM hospedes
WHERE cpf = '11111111111';

-- Inserindo uma nova reserva para o hóspede
INSERT INTO reservas(hospede_id, numero_quarto, data_entrada, data_saida, valor_total)
VALUES (1, 101, '2024-07-01', '2024-07-10', 1000.00);

-- Verificando a reserva criada
SELECT * FROM reservas
WHERE hospede_id = 1;

-- O COMMIT confirma permanentemente todas as operações realizadas
COMMIT;

-- =====================================================
-- 2. TRANSAÇÃO COM ROLLBACK
-- =====================================================

-- Iniciando uma nova transação
BEGIN;

-- Inserindo um novo hóspede
INSERT INTO hospedes(nome, cpf, data_nascimento, telefone, email)
VALUES ('Afonso Lima', '22222222222', '1992-05-10', '86988888888', 'afonso@email.com');

-- Verificando o hóspede antes do rollback
SELECT * FROM hospedes
WHERE cpf = '22222222222';

-- Inserindo uma reserva vinculada ao hóspede
INSERT INTO reservas(hospede_id, numero_quarto, data_entrada, data_saida, valor_total)
VALUES (2, 102, '2024-08-01', '2024-08-05', 500.00);

-- Verificando a reserva antes do rollback
SELECT * FROM reservas
WHERE hospede_id = 2;

-- O ROLLBACK desfaz todas as operações da transação
ROLLBACK;

-- Verificando que os dados NÃO foram persistidos
SELECT * FROM hospedes
WHERE cpf = '22222222222';

SELECT * FROM reservas
WHERE hospede_id = 2;

-- =====================================================
-- 3. TRANSAÇÃO COM MÚLTIPLAS OPERAÇÕES
-- =====================================================

-- Iniciando a transação
BEGIN;

-- Inserindo um hóspede
INSERT INTO hospedes(nome, cpf, data_nascimento, telefone, email)
VALUES ('Maria Souza', '33333333333', '1995-03-15', '86977777777', 'maria@email.com');

-- Verificando o hóspede
SELECT * FROM hospedes
WHERE cpf = '33333333333';

-- Inserindo uma reserva
INSERT INTO reservas(hospede_id, numero_quarto, data_entrada, data_saida, valor_total)
VALUES (3, 103, '2024-09-01', '2024-09-07', 1200.00);

-- Verificando a reserva
SELECT * FROM reservas
WHERE hospede_id = 3;

-- Inserindo um serviço
INSERT INTO servicos(descricao, valor)
VALUES ('Café da manhã', 25.00);

-- Verificando o serviço
SELECT * FROM servicos
WHERE descricao = 'Café da manhã';

-- Registrando um consumo
INSERT INTO consumos(reserva_id, servico_id, quantidade)
VALUES (1, 1, 2);

-- Verificando o consumo
SELECT * FROM consumos
WHERE reserva_id = 1;

-- Atualizando o valor total da reserva
UPDATE reservas
SET valor_total = valor_total + (25.00 * 2)
WHERE id = 1;

-- Verificando o valor atualizado da reserva
SELECT * FROM reservas
WHERE id = 1;

-- Confirmando todas as operações da transação
COMMIT;

-- =====================================================
-- 4. USO DE SAVEPOINT
-- =====================================================

-- Iniciando a transação
BEGIN;

-- Inserindo um hóspede
INSERT INTO hospedes(nome, cpf, data_nascimento, telefone, email)
VALUES ('João Pedro', '44444444444', '1998-07-20', '86966666666', 'joao@email.com');

-- Inserindo uma reserva
INSERT INTO reservas(hospede_id, numero_quarto, data_entrada, data_saida, valor_total)
VALUES (4, 104, '2024-10-01', '2024-10-08', 1500.00);

-- Criando um SAVEPOINT chamado sp1
-- O SAVEPOINT permite retornar a um ponto específico da transação
SAVEPOINT sp1;

-- Inserindo um serviço
INSERT INTO servicos(descricao, valor)
VALUES ('Almoço', 50.00);

-- Registrando um consumo
INSERT INTO consumos(reserva_id, servico_id, quantidade)
VALUES (1, 1, 4);

-- Verificando os consumos
SELECT * FROM consumos
WHERE reserva_id = 1;

-- Criando um segundo SAVEPOINT
SAVEPOINT sp2;

-- Realizando uma operação adicional
INSERT INTO consumos(reserva_id, servico_id, quantidade)
VALUES (1, 1, 1);

-- Verificando os consumos após nova inserção
SELECT * FROM consumos
WHERE reserva_id = 1;

-- Desfazendo apenas as operações após o SAVEPOINT sp2
ROLLBACK TO SAVEPOINT sp2;

-- Verificando os dados após rollback parcial
SELECT * FROM consumos
WHERE reserva_id = 1;

-- Desfazendo as operações após o SAVEPOINT sp1
ROLLBACK TO SAVEPOINT sp1;

-- Verificando novamente os dados
SELECT * FROM consumos
WHERE reserva_id = 1;

-- Confirmando apenas as operações mantidas
COMMIT;

-- =====================================================
-- 5. SIMULAÇÃO DE ERRO
-- =====================================================

-- Iniciando a transação
BEGIN;

-- Inserindo um hóspede
INSERT INTO hospedes(nome, cpf, data_nascimento, telefone, email)
VALUES ('Ana Clara', '55555555555', '2000-11-10', '86955555555', 'ana@email.com');

-- Verificando o hóspede inserido
SELECT * FROM hospedes
WHERE cpf = '55555555555';

-- Tentando inserir uma reserva com hospede_id inexistente
-- Isso deve gerar erro de chave estrangeira
INSERT INTO reservas(hospede_id, numero_quarto, data_entrada, data_saida, valor_total)
VALUES (9999, 105, '2024-11-01', '2024-11-05', 700.00);

-- O ROLLBACK desfaz toda a transação após o erro
ROLLBACK;

-- Verificando que o hóspede também não foi salvo
SELECT * FROM hospedes
WHERE cpf = '55555555555';