-- Inserindo um novo cliente acionando a função defineData() 
INSERT INTO cliente(IDCliente,NomeCliente,DDDTelefone,Telefone,DataCadastro)
VALUES (3,'Ester Moreira','079','1245-8520',defineData());

SELECT * FROM cliente;
