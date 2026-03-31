-- Disciplina:Banco de Dado II
-- Nome: Wanderson de Vasconcelos
-- Título: Sistema de Locação de Filmes
-- Nome: Geovany de Olveira Silva batista
-- Data entrega: 31/03/2025
------------------------------------------------------

\c postgres

DROP DATABASE if EXISTS locacao;

CREATE DATABASE locacao;

\c locacao

-- Tabela 01
CREATE TABLE Clientes (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    data_nascimento DATE 
);

-- Tabela 02
CREATE TABLE Filmes(
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    genero VARCHAR(50),
    ano_lancamento INTEGER
);

-- Tabela 03
CREATE TABLE locacoes(
    id SERIAL PRIMARY KEY,
    data_locacao DATE DEFAULT CURRENT_DATE,
    hora_locacao TIME DEFAULT CURRENT_TIME,
    devolvido BOOLEAN DEFAULT FALSE,
    cliente_id INTEGER, 
    filme_id INTEGER, 

    FOREIGN KEY (cliente_id) REFERENCES Clientes(id),
    FOREIGN KEY (filme_id) REFERENCES Filmes(id)
);

-- Modificações com ALTER TABLE
-- Realize as seguintes alterações nas tabelas:
-- ● Renomeie a coluna nome de clientes para nome_completo
ALTER TABLE Clientes RENAME nome TO nome_completo;

-- ● Adicione uma nova coluna telefone do tipo VARCHAR(15) à tabela clientes
ALTER TABLE Clientes ADD COLUMN telefone VARCHAR(15);

-- ● Altere o tipo da coluna ano_lancamento para SMALLINT
ALTER TABLE Filmes ALTER COLUMN ano_lancamento TYPE SMALLINT;

-- ● Altere o valor padrão da coluna data_locacao para NOW()
ALTER TABLE locacoes ALTER COLUMN data_locacao SET DEFAULT NOW();

-- ● Remova a restrição NOT NULL da coluna titulo em filmes
ALTER TABLE Filmes ALTER COLUMN titulo DROP NOT NULL;

-- ● Remova a coluna telefone da tabela clientes
ALTER TABLE Clientes DROP COLUMN telefone;

-- ● Renomeie a tabela clientes para usuarios
ALTER TABLE Clientes RENAME TO Usuarios;


-- Inserções e TRUNCATE
-- ● Insira pelo menos 1 registro em cada tabela
INSERT INTO Usuarios (nome_completo,email,data_nascimento) VALUES ('geovany de oliveira silva batista','teste@gmail','2001-01-01');
INSERT INTO Filmes (titulo,genero,ano_lancamento) VALUES ('homem de ferro','açao',2008);
INSERT INTO locacoes (data_locacao,hora_locacao,devolvido,cliente_id,filme_id) VALUES ('2008-05-20','10:45:00',TRUE,1,1);

-- ● Execute um comando TRUNCATE em locacoes
TRUNCATE TABLE locacoes;

-- ● Reinsira um registro na tabela locacoes
INSERT INTO locacoes (id, data_locacao,hora_locacao,devolvido,cliente_id,filme_id) VALUES (1, '2008-05-20','10:45:00',TRUE,1,1);

-- ● Execute TRUNCATE em filmes e usuarios com CASCADE
TRUNCATE TABLE Filmes CASCADE;
TRUNCATE TABLE usuarios CASCADE;

-- Remoção com DROP
-- ● Use DROP TABLE para excluir a tabela locacoes
DROP TABLE locacoes; 
-- ● Use DROP DATABASE para excluir o banco locadora_filmes (comentado para evitar execução acidental) 
-- DROP DATABASE locacao;
-- DROP DATABASE locadora_filmes;