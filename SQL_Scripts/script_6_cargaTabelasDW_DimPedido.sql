-- Insere dados na dimensão pedido a partir da tabela pedido da sua base relacional
INSERT INTO fed_dw_final.Dim_Pedido (IDPedido, IDCLiente)
	SELECT IDPedido, IDCLiente FROM fed_final.Pedido;

SELECT * FROM fed_dw_final.dim_pedido;
