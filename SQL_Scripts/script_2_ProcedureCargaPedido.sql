DELIMITER $$
CREATE PROCEDURE `fed_final`.`cargaPedidoRelacional`()
BEGIN
    #Declaramos as variáveis de apoio
	DECLARE id_Cliente INT;
	DECLARE dataCadastroCliente DATE;
	DECLARE dataPedido, dataPagamento DATE;
    DECLARE controle, num , min_id, max_id INT;
   
   SELECT min(IDCliente), max(IDCliente)  INTO min_id, max_id FROM Cliente;
   SET min_id = min_id +1;
   	WHILE min_id <= max_id DO
        SELECT DataCadastro  INTO dataCadastroCliente FROM Cliente WHERE IDCliente = min_id;
        
        SET dataPedido = '2014-12-31'; -- Inicialização da data com uma data inferior à data mais antiga de cadastro de cliente
        SET dataPagamento  = '2014-12-30';
        -- Garante que a dataPedido não seja inferior à data do cadastro do cliente ou maior que a data atual (pedido futuro)
        WHILE dataPedido < dataCadastroCliente OR dataPedido > CURRENT_DATE DO
			SELECT defineData() INTO dataPedido;
		END WHILE;

        WHILE dataPagamento < dataPedido OR dataPagamento > CURRENT_DATE DO
			SELECT defineData() INTO dataPagamento;
		END WHILE;
        
        -- Insere pedidos aleatórios para cada cliente
		INSERT INTO Pedido (PedidoData,IDCliente,PagamentoData) VALUES (dataPedido,min_id,dataPagamento);

		SET min_id = min_id + 1;
        COMMIT;
	END WHILE;
END$$
DELIMITER ;