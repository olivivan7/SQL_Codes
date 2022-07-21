-- Inserindo um novo cliente acinando a função defineData() 
INSERT INTO fed_final.cliente(IDCliente,NomeCliente,DDDTelefone,Telefone,DataCadastro)
VALUES (5,'Ester Moreira','079','1245-8520',defineData());

SELECT * FROM fed_final.cliente;

-- Para conferir o funcionamento da Trigger, insira o registro abaixo, onde a data do cadastro é superior a data atual.

/*INSERT INTO fed_final.cliente(IDCliente,NomeCliente,DDDTelefone,Telefone,DataCadastro)
VALUES (6,'Alberto Silva',NULL,NULL,CURRENT_DATE + INTERVAL 1 DAY);

SELECT * FROM fed_final.cliente;
-- Observe que a data de cadastro deste cliente é 10 dias anteriores à data de hoje. Como programado em nossa Trigger
*/
/*
INSERT INTO fed_final.cliente(NomeCliente,DDDTelefone,Telefone,DataCadastro) VALUES ('Carolina Malu Alessandra Figueiredo','044','2750-9343',defineData());
INSERT INTO fed_final.cliente(NomeCliente,DDDTelefone,Telefone,DataCadastro) VALUES ('Thiago Danilo Calebe Campos','062','2556-5478',defineData());
INSERT INTO fed_final.cliente(NomeCliente,DDDTelefone,Telefone,DataCadastro) VALUES ('Antonio Renato da Rocha','091','2877-1546',defineData());
INSERT INTO fed_final.cliente(NomeCliente,DDDTelefone,Telefone,DataCadastro) VALUES ('Louise Maya Moraes','095','2664-4406',defineData());
INSERT INTO fed_final.cliente(NomeCliente,DDDTelefone,Telefone,DataCadastro) VALUES ('Heloise Louise Pinto','062','3814-9257',defineData());

SELECT * FROM fed_final.cliente;
*/