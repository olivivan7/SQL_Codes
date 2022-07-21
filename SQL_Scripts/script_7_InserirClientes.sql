INSERT INTO cliente(IDCliente,NomeCliente,DDDTelefone,Telefone,DataCadastro) VALUES (5,'Carolina Malu Alessandra Figueiredo','044','2750-9343',defineData());
INSERT INTO cliente(IDCliente,NomeCliente,DDDTelefone,Telefone,DataCadastro) VALUES (6, 'Thiago Danilo Calebe Campos','062','2556-5478',defineData());
INSERT INTO cliente(IDCliente,NomeCliente,DDDTelefone,Telefone,DataCadastro) VALUES (7, 'Antonio Renato da Rocha','091','2877-1546',defineData());

-- Observe que não estamos informando o IDCliente no comando
INSERT INTO cliente(NomeCliente,DDDTelefone,Telefone,DataCadastro) VALUES ('Carmelo Silva da Rocha','041','2547-1246',defineData());

SELECT * FROM cliente;
