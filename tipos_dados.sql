-- =========================================================
-- CURSO DE TECNOLOGIA EM ANÁLISE E DESENVOLVIMENTO DE SISTEMAS
-- Banco de Dados I
-- Materiais extras
-- Prof. Dr. Wanderson de Vasconcelos
-- Tema: Principais Tipos de Dados suportados no SQL
-- =========================================================


-- =========================================================
-- 1. TIPOS NUMÉRICOS
-- =========================================================

-- INT / INTEGER
-- Armazena números inteiros (sem casas decimais)
-- Exemplo: idade de uma pessoa
idade INTEGER;

-- SMALLINT
-- Armazena números inteiros pequenos
-- Usa menos espaço que INTEGER
-- Exemplo: quantidade em estoque
quantidade_em_estoque SMALLINT;

-- BIGINT
-- Armazena números inteiros muito grandes
-- Exemplo: população mundial
populacao_mundial BIGINT;


-- =========================================================
-- PONTO FLUTUANTE E PRECISÃO FIXA
-- =========================================================

-- DECIMAL / NUMERIC
-- Armazena valores com precisão exata
-- Muito usado para valores monetários
-- Exemplo: preço de produto
preco DECIMAL(10,2);

-- FLOAT / REAL
-- Armazena números com casas decimais aproximadas
-- Menos preciso que DECIMAL
-- Exemplo: temperatura
temperatura FLOAT;


-- =========================================================
-- 2. TIPOS DE DADOS DE TEXTO
-- =========================================================

-- CHAR(n)
-- Armazena texto com tamanho fixo
-- Se o valor for menor, o banco completa com espaços
-- Exemplo: código de produto
codigo_produto CHAR(6);

-- VARCHAR(n)
-- Armazena texto com tamanho variável
-- Muito usado em nomes e campos de texto curtos
-- Exemplo: nome de pessoa
nome VARCHAR(100);

-- TEXT
-- Armazena textos longos
-- Exemplo: descrição de produto
descricao TEXT;


-- =========================================================
-- 3. TIPOS DE DADOS DE DATA E HORA
-- =========================================================

-- DATE
-- Armazena apenas a data
-- Exemplo: data de nascimento
data_nascimento DATE;

-- TIME
-- Armazena apenas horário
-- Exemplo: hora de abertura
hora_abertura TIME;

-- TIMESTAMP
-- Armazena data e hora juntas
-- Exemplo: momento em que um cadastro foi realizado
data_hora_cadastro TIMESTAMP;


-- =========================================================
-- 4. TIPOS DE DADOS LÓGICOS
-- =========================================================

-- BOOLEAN
-- Armazena valores lógicos
-- TRUE ou FALSE
-- Exemplo: usuário ativo ou inativo
ativo BOOLEAN;


-- =========================================================
-- 5. TIPOS DE DADOS BINÁRIOS
-- =========================================================

-- BYTEA (PostgreSQL)
-- BLOB (MySQL)
-- Armazena arquivos binários como imagens, PDFs e documentos
-- Exemplo: foto de perfil
foto_perfil BYTEA;