/* EXERCÍCIOS SQL (NÍVEL INICIANTE → INTERMEDIÁRIO) */

/* Crie uma tabela chamada alunos com:
id (INT PRIMARY KEY)
nome (VARCHAR 50)
idade (INT) */

CREATE TABLE alunos(
    id INT PRIMARY KEY,
    nome VARCHAR(50),
    idade INT
);

/* Insira 3 alunos diferentes. */
INSERT INTO alunos (id,nome,idade) VALUES
(1,'geovany',23),
(2,'afonso',19),
(3,'gabriel',17);

/* Adicione a coluna email na tabela alunos. */
ALTER TABLE alunos ADD COLUMN email VARCHAR(50) UNIQUE;

/* Depois altere o tipo da coluna idade para SMALLINT. */
ALTER TABLE alunos ALTER COLUMN idade TYPE SMALLINT;

/* Defina idade como NOT NULL. */
ALTER TABLE alunos ALTER COLUMN idade SET NOT NULL;


/* Crie uma tabela log_acesso com */
CREATE TABLE log_acesso(
    id INT PRIMARY KEY,
    data_acesso DATE
);


/* Insira um registro usando:
CURRENT_DATE ou CURRENT_TIMESTAMP */

INSERT INTO log_acesso 
(id,data_acesso)
VALUES
(1,CURRENT_DATE);


/* Atualize o nome de um aluno específico pelo id. */
UPDATE alunos
SET nome = 'paulo'
WHERE id = 1;

/* Atualize a idade de todos os alunos com idade menor que 18 para 18. */
UPDATE alunos
SET idade = 18
WHERE idade < 18;


/* Liste alunos com idade maior que 18. */
SELECT * FROM alunos WHERE idade > 18;

/* Liste alunos com idade BETWEEN 18 e 25. */
SELECT * FROM alunos WHERE idade BETWEEN 18 AND 25;

/* Liste alunos com nomes IN ('joao', 'maria'). */
SELECT * FROM alunos WHERE nome IN('joao','maria');

/* Liste alunos cujo nome começa com 'A' (LIKE). */
SELECT * FROM alunos WHERE nome LIKE 'A%';

/* Limpe todos os dados da tabela alunos. */
TRUNCATE TABLE alunos;



/* Crie tabela matriculas */
CREATE TABLE matriculas(
    id INT PRIMARY KEY,
    aluno_id INT,

    FOREIGN KEY (aluno_id) REFERENCES alunos(id)
);