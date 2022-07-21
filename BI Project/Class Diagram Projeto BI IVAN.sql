CREATE TABLE dim_CUSTOSDOPROCESSO (
 pk_custosdoprocesso INT,
 totaldoprocessoemREAIS FLOAT,
 totaldoprocessolibraGBP FLOAT,
 totaldoprocessodólarUSD FLOAT,
 totaldoprocessoeuroEUR FLOAT,
 totaldoprocessoaustraliaAUD FLOAT,
 totaldoprocessonoruegaNOK FLOAT,
 totaldoprocessosuéciaSEK FLOAT,
 totaldoprocessoieneJPY FLOAT,
 totaldoprocessocanadaCAD FLOAT,
 totaldoprocessonovazelandiaNZD FLOAT,
 custo_evpREAIS FLOAT,
 custo_redaçãoREAIS FLOAT
);


CREATE TABLE dim_Local (
 pk_local INT
);


CREATE TABLE dim_responsável (
 pk_responsável INT
);


CREATE TABLE dim_TEMPO (
 pk_tempo INT
);


CREATE TABLE ft_processodepatente (
 fk_tempo INT,
 fk_custosdoprocesso INT,
 fk_local INT,
 fk_responsável INT,
 título_NI INT,
 priorização CHAR
);


CREATE TABLE varchar(10) (
);

