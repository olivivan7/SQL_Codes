-- Insere dados na tabela fato faturamento

CALL `fed_dw_final`.`cargaFatoFaturamentoPedido`();

SELECT * FROM fed_dw_final.fato_faturamentopedido;