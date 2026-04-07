-- Disciplina:Banco de Dado II
-- Nome: Wanderson de Vasconcelos
-- Título: Sistema de Locação de Filmes
-- Nome: Geovany de Olveira Silva batista
-- Data entrega:
------------------------------------------------------

\c postgres

DROP DATABASE if EXISTS hotel;

CREATE DATABASE hotel;

\c hotel

/* hospedes */
CREATE TABLE hospedes(
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    data_nascimento DATE NOT NULL,
    telefone VARCHAR(15),
    email VARCHAR(100)
);

/* quartos */
CREATE TABLE quartos(
    numero SERIAL PRIMARY KEY,
    tipo VARCHAR(50) NOT NULL, --(Exemplos: casal,solteiro)
    valor_diaria DECIMAL(10,2) NOT NULL,
    status VARCHAR(20) NOT NULL --(Exemplos: Livre, Ocupado, Manutenção)
);

/* reservas */
CREATE TABLE reservas(
    id SERIAL PRIMARY KEY,
    hospede_id INTEGER,
    numero_quarto INTEGER,
    data_entrada DATE NOT NULL,
    data_saida DATE NOT NULL,
    valor_total DECIMAL(10,2),

    FOREIGN KEY (hospede_id) REFERENCES hospedes(id),
    FOREIGN KEY (numero_quarto) REFERENCES quartos(numero)
);

/* servicos */
CREATE TABLE servicos(
    id SERIAL PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL,
    valor DECIMAL(10,2) NOT NULL
);

/* consumos */
CREATE TABLE consumos(
    id SERIAL PRIMARY KEY,
    reservas_id INTEGER,
    servico_id INTEGER,
    quantidade INTEGER NOT NULL,

    FOREIGN KEY (reservas_id) REFERENCES reservas(id),
    FOREIGN KEY (servico_id) REFERENCES servicos(id)
);

SELECT * FROM hospedes;
SELECT * FROM quartos;
SELECT * FROM reservas;
SELECT * FROM servicos;
SELECT * FROM consumos;