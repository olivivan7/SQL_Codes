DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `fed_dw_final`.`exportaFaturamentoCSV`()
BEGIN

	SELECT 'IDPedido', 'NomeCliente', 'Telefone','DataPedido','DataPagamento', 'valorTotalPedido' -- Define o cabeçalho do arquivo CSV
	UNION
	SELECT `dim_pedido`.`IDPedido`,    `dim_cliente`.`NomeCliente`
				, IFNULL(CONCAT('(',`dim_cliente`.`DDDTelefone`,')',`dim_cliente`.`Telefone`) , 'Não Informado')AS Telefone
				, `dtpedido`.`DataCompleta` AS DataPedido, `dtpagto`.`DataCompleta` AS DataPagamento,  `fato_faturamentopedido`.`valorTotalPedido`
	FROM `fed_dw_final`.`fato_faturamentopedido` JOIN `fed_dw_final`.`dim_cliente` 
	ON  `fato_faturamentopedido`.`PK_DIM_Cliente` = `dim_cliente`.`PK_DIM_Cliente`
	JOIN `fed_dw_final`.`dim_pedido` ON `fato_faturamentopedido`.`PK_DIM_Pedido` = `dim_pedido`.`PK_DIM_Pedido`
	JOIN  `fed_dw_final`.`dim_tempo` AS dtpedido ON `fato_faturamentopedido`.`PK_DataPedido` = dtpedido.PK_DIM_Tempo
	JOIN  `fed_dw_final`.`dim_tempo` AS dtpagto ON `fato_faturamentopedido`.`PK_DataPagamento` = dtpagto.PK_DIM_Tempo
	INTO OUTFILE ''secure_file_priv', 'C:\\MySQL\\Uploads\\'faturamento.csv'
	FIELDS TERMINATED BY ',' ENCLOSED BY """"   LINES TERMINATED BY '\n';

END$$
DELIMITER ;