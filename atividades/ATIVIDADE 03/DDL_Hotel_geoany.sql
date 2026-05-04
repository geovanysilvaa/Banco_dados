INSERT INTO hospedes (nome,cpf,data_nascimento,telefone,email)
VALUES
('geovany','10101010101010','2000-01-01','86999292905','teste01@gmail'),
('afonso','20202020202020','2002-02-02','99999999999','teste02@gmail');


INSERT INTO quartos (tipo,valor_diaria,status)
VALUES
('casal',500,'Livro'),
('solteiro',200,'Ocupado');


INSERT INTO reservas (hospede_id,numero_quarto,data_entrada,data_saida,valor_total)
VALUES 
(1,1,'2004-05-02','2004-05-30',300),
(2,2,'2004-05-10','2004-05-30',500);


INSERT INTO servicos(descricao,valor)
VALUES
('serviço de quarto',400),
('serviço limpeza',500);


INSERT INTO consumos(reservas_id,servico_id,quantidade)
VALUES
(1,1,1),
(2,2,1);


SELECT * FROM hospedes;
SELECT * FROM quartos;
SELECT * FROM reservas;
SELECT * FROM servicos;
SELECT * FROM consumos;