-- Disciplina:Banco de Dado II
-- Nome: Wanderson de Vasconcelos
-- Título: Sistema de Locação de Filmes
-- Nome: Geovany de Olveira Silva batista
-- Data entrega: 28/04/2025
------------------------------------------------------

\c postgres

DROP DATABASE if EXISTS hotel;

CREATE DATABASE hotel;

\c hotel


-- ================================================
-- Script Gabarito: Criação do Banco de Dados HOTEL
-- Disciplina: Banco de Dados II
-- Prof.: Dr. Wanderson de Vasconcelos
-- ================================================

-- Conectar à base padrão 'postgres' para dropar a base de teste, se existir
\c postgres

-- Remove o banco de dados HOTEL caso exista
DROP DATABASE IF EXISTS hotel;

-- Cria o banco de dados HOTEL
CREATE DATABASE hotel;

-- Conecta na base de dados HOTEL criada
\c hotel

-- ================================================
-- Criação da Tabela hospedes
-- ================================================

CREATE TABLE hospedes (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    data_nascimento DATE NOT NULL,
    telefone VARCHAR(15),
    email VARCHAR(100)
);

-- ================================================
-- Criação da Tabela quartos
-- ================================================

CREATE TABLE quartos (
    numero SERIAL PRIMARY KEY,
    tipo VARCHAR(50) NOT NULL,
    valor_diaria DECIMAL(10,2) NOT NULL,
    status VARCHAR(20) NOT NULL
    -- Exemplos de status: Livre, Ocupado, Manutenção
);

-- ================================================
-- Criação da Tabela reservas
-- ================================================

CREATE TABLE reservas (
    id SERIAL PRIMARY KEY,
    hospede_id INTEGER NOT NULL,
    numero_quarto INTEGER NOT NULL,
    data_entrada DATE NOT NULL,
    data_saida DATE NOT NULL,
    valor_total DECIMAL(10,2),
    FOREIGN KEY (hospede_id) REFERENCES hospedes(id),
    FOREIGN KEY (numero_quarto) REFERENCES quartos(numero)
);

-- ================================================
-- Criação da Tabela servicos
-- ================================================

CREATE TABLE servicos (
    id SERIAL PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL,
    valor DECIMAL(10,2) NOT NULL
);

-- ================================================
-- Criação da Tabela consumos
-- ================================================

CREATE TABLE consumos (
    id SERIAL PRIMARY KEY,
    reserva_id INTEGER NOT NULL,
    servico_id INTEGER NOT NULL,
    quantidade INTEGER NOT NULL,
    FOREIGN KEY (reserva_id) REFERENCES reservas(id),
    FOREIGN KEY (servico_id) REFERENCES servicos(id)
);

-- ================================================
-- Fim do Script Gabarito
-- ================================================



-- Cria grupo (role)
CREATE ROLE role_recepcionista;
CREATE ROLE role_gerente;
CREATE ROLE role_auditor;


-- Cria usuário
CREATE USER ana_recepcao WITH PASSWORD '1234';
CREATE USER bruno_gerencia WITH PASSWORD '1234';
CREATE USER carlos_auditoria WITH PASSWORD '1234';


-- Associa usuário a uma role
GRANT role_recepcionista TO ana_recepcao; -- ana_recepcao à role_recepcionista
GRANT role_gerente TO bruno_gerencia; -- bruno_gerencia à role_gerente
GRANT role_auditor TO carlos_auditoria; -- carlos_auditoria à role_auditor


-- 5. Concessão de permissões com GRANT
-- Conceda as permissões necessárias em cada tabela, de acordo com cada perfil.


-- 1. Recepcionista
-- Deve poder:
-- ● consultar a tabela quartos
-- ● consultar a tabela hospedes
-- ● consultar a tabela reservas
-- ● inserir novas reservas na tabela reservas

-- Permite leitura
GRANT SELECT ON quartos,hospedes,reservas TO role_recepcionista;

-- Permite inserção
GRANT INSERT ON reservas TO role_recepcionista;

--2. Gerente
--Deve poder:
--● consultar todas as tabelas
--● inserir, atualizar e excluir dados nas tabelas:
--○ quartos
--○ reservas
--○ servicos

-- Permite leitura
GRANT SELECT ON consumos,hospedes,quartos,reservas,servicos TO role_gerente;

-- Permite leitura,delete,udpate,insert
GRANT INSERT,DELETE,UPDATE ON quartos,reservas,servicos TO role_gerente;

-- 3. Auditor
-- Deve poder:
-- ● apenas consultar todas as tabelas

-- Permite leitura
GRANT SELECT ON consumos,hospedes,quartos,reservas,servicos TO role_auditor;


-- 6. Revogação de permissões com REVOKE
-- Depois de conceder as permissões, faça as seguintes revogações:

-- ● remova da role_recepcionista a permissão de INSERT na tabela reservas

-- Remove permissão concedida insert
REVOKE INSERT ON reservas FROM role_recepcionista;

-- ● remova da role_gerente a permissão de DELETE na tabela servicos

-- Remove permissão concedida delete
REVOKE DELETE ON servicos FROM role_gerente;
