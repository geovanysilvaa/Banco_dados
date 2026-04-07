-- Disciplina:Banco de Dado II
-- Nome: Wanderson de Vasconcelos
-- Título: Sistema de Locação de Filmes
-- Nome: Geovany de Olveira Silva batista
-- Data entrega: 31/03/2025
------------------------------------------------------

\c postgres

DROP DATABASE if EXISTS faculdade;

CREATE DATABASE faculdade;

\c faculdade

CREATE TABLE professor(
    matricula INTEGER PRIMARY key,
    nome VARCHAR(50) NOT NULL,
    titulacao VARCHAR(20),
    salario DECIMAL(10,2)
);

INSERT INTO
 professor(matricula,nome,titulacao,salario)
VALUES
(11, 'Iallen Gabio','Doutor',7540.00),
(22, 'Jeferson Soares','Mestre',6250.00),
(33, 'Jonatas Jivago','Mestre',6415.00),
(44, 'Marcos Ramon','Especialista',5680.00),
(55, 'Mayllon Veras','Mestre',6990.00),
(66, 'Maykol Sampaio','Mestre',6110.00),
(77, 'Ricardo Serkeff','Doutor',7850.00),
(88, 'Wanderson leonardo','Mestre',6700.00),
(99, 'Wanderson de Vansconcelos','Doutor',7120.00);

SELECT * FROM professor;

