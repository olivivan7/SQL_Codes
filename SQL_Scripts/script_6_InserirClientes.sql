-- Para conferir o funcionamento da Trigger, insira o registro abaixo, onde a data do cadastro é superior a data atual.

INSERT INTO cliente(IDCliente,NomeCliente,DDDTelefone,Telefone,DataCadastro)
VALUES (4,'Roberto da Silva',NULL,NULL,CURRENT_DATE + INTERVAL 1 DAY);

SELECT * FROM cliente;

