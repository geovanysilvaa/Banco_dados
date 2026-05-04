-- =========================================================
-- DML (Data Manipulation Language)
-- Banco de Dados II
-- Prof. Dr. Wanderson de Vasconcelos
-- =========================================================

-- A DML é responsável por manipular os dados das tabelas
-- Atua nos registros (linhas), não na estrutura


-- =========================================================
-- INSERT
-- =========================================================

-- Inserir um registro informando colunas
INSERT INTO nome_da_tabela (coluna1, coluna2)
VALUES (valor1, valor2);
-- Insere uma nova linha na tabela


-- Inserir informando todas as colunas na ordem
INSERT INTO nome_da_tabela
VALUES (valor1, valor2, valor3);
-- Usado quando todas as colunas serão preenchidas


-- =========================================================
-- EXEMPLO
-- =========================================================

INSERT INTO professor (matricula, nome, titulacao)
VALUES (2023101, 'Ana Costa', 'Mestre');
-- O campo id (SERIAL) é preenchido automaticamente


-- =========================================================
-- INSERINDO MÚLTIPLAS LINHAS
-- =========================================================

INSERT INTO professor (matricula, nome, titulacao)
VALUES
(2023102, 'Carlos Lima', 'Doutor'),
(2023103, 'Juliana Alves', 'Especialista');
-- Insere vários registros de uma vez


-- =========================================================
-- INSERT COM CHAVE ESTRANGEIRA
-- =========================================================

INSERT INTO disciplina (codigo, nome, id_professor)
VALUES
(301, 'Banco de Dados', 1),
(302, 'Estrutura de Dados', 2);
-- O valor de id_professor deve existir na tabela professor


-- =========================================================
-- CONSULTAR REGISTRO INSERIDO
-- =========================================================

SELECT *
FROM professor
WHERE matricula = 2023104;
-- Permite verificar o ID gerado automaticamente


-- =========================================================
-- UPDATE
-- =========================================================

UPDATE nome_da_tabela
SET coluna = valor
WHERE condicao;
-- Atualiza registros específicos


-- =========================================================
-- EXEMPLO
-- =========================================================

UPDATE professor
SET titulacao = 'Mestra'
WHERE matricula = 2023103;
-- Apenas o professor com essa matrícula será alterado


-- =========================================================
-- UPDATE DE MÚLTIPLAS COLUNAS
-- =========================================================

UPDATE professor
SET nome = 'Carlos A. Lima',
    titulacao = 'Mestre'
WHERE matricula = 2023102;
-- Atualiza mais de uma coluna ao mesmo tempo


-- =========================================================
-- OUTRO EXEMPLO
-- =========================================================

UPDATE disciplina
SET nome = 'Banco de Dados II'
WHERE codigo = 301;


-- =========================================================
-- DELETE
-- =========================================================

DELETE FROM nome_da_tabela
WHERE condicao;
-- Remove registros específicos


-- =========================================================
-- EXEMPLO
-- =========================================================

DELETE FROM professor
WHERE matricula = 2023103;
-- Remove o professor com essa matrícula


-- =========================================================
-- CUIDADO COM CHAVE ESTRANGEIRA
-- =========================================================

DELETE FROM professor
WHERE id = 2;
-- Se existir tabela dependente, pode ocorrer erro de integridade referencial


-- =========================================================
-- EXCLUIR REGISTROS FILHOS PRIMEIRO
-- =========================================================

DELETE FROM disciplina
WHERE id_professor = 2;

DELETE FROM professor
WHERE id = 2;
-- Primeiro remove registros dependentes, depois o principal


-- =========================================================
-- ON DELETE CASCADE
-- =========================================================

CREATE TABLE disciplina (
    id SERIAL PRIMARY KEY,
    codigo INT NOT NULL UNIQUE,
    nome VARCHAR(30) NOT NULL,
    id_professor INT NOT NULL,
    FOREIGN KEY (id_professor)
        REFERENCES professor(id)
        ON DELETE CASCADE
);
-- Se o professor for removido, as disciplinas associadas também serão removidas


-- =========================================================
-- EXEMPLO DE DELETE
-- =========================================================

DELETE FROM disciplina
WHERE codigo = 302;
-- Remove a disciplina com esse código