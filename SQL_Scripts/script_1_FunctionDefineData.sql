USE fed_final;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `defineData`() RETURNS varchar(12) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
 -- Com o uso das funções CONCAT(), FLOOR() e RAND(), é possível criar datas aleatórias no MySQL.

 	DECLARE minhaData VARCHAR(12);
    DECLARE ano CHAR(4);
	DECLARE mes CHAR(2);
	DECLARE dia CHAR(2);
    
	-- Data gerada para tabela Cliente (DataCadastro)
    -- Para obter um número inteiro aleatório R no intervalo i <= R <j, use a expressão FLOOR (i + RAND () * (j - i)).
    -- Por exemplo, para obter um número inteiro aleatório no intervalo 1 <= R <13, você pode usar a seguinte instrução: SELECT FLOOR(1 + (RAND() * 12));
    
	SELECT FLOOR(2015+RAND()*6) INTO ano;
    SELECT FLOOR(1 + (RAND() * 12))  INTO mes;
    SELECT FLOOR(1+RAND()*31) INTO dia;    
        
	label1: LOOP
		IF mes  = 2 AND dia > 28 THEN -- Para mês de fevereiro, quando o dia for maior que 28, mantenha dia = 28
			SET dia = 28;
		-- Garantir que os meses que tenham 31 dias tenham no máximo dia 31           
		ELSEIF (mes  = 1 OR mes  = 3 OR mes  = 5 OR mes  = 7 OR mes  = 8 OR mes  = 10 OR mes  = 12) AND dia > 31 THEN
			SET dia = 31;
		-- Garantir que os meses que tenham 30 dias tenham no máximo dia 30           
		ELSEIF (mes  = 4 OR mes  = 6 OR mes  = 9 OR mes  =11) AND dia > 30 THEN
			SET dia = 30;
		ELSE
			LEAVE label1;
		END IF;
	END LOOP label1;
    
    -- Função LPAD serve para preencher com zeros à esqueda, para garantir o dia e mês com 2 digitos.
    SET minhaData = CONCAT(ano,'-',LPAD(mes,2,'0'),'-',LPAD(dia,2,'0'));
    
	RETURN minhaData;
    
END$$
DELIMITER ;
