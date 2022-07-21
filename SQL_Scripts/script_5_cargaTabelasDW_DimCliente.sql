-- Insere dados na dimensão cliente a partir da tabela cliente da sua base relacional
INSERT INTO  fed_dw_final.Dim_Cliente (IDCliente, NomeCliente, DDDTelefone, Telefone, DataCadastro)
	SELECT IDCliente, NomeCliente, DDDTelefone, Telefone, DataCadastro
	FROM fed_final.Cliente;

SELECT * FROM fed_dw_final.dim_cliente;

