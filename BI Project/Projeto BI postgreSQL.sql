CREATE TABLE ft_processodepatente(
pk_processodepatente INT,
fk_tempo INT,
fk_custosdoprocesso INT,
fk_local INT,
fk_responsavel INT,
NI VARCHAR(15),
titulo_NI INT,
n_pedido VARCHAR(50),
n_patente VARCHAR(50),
codigo_projeto VARCHAR(50),
titulo_projeto VARCHAR(50),
categoria VARCHAR(30),
estado VARCHAR(15),
organizacao VARCHAR(10),
area_origem VARCHAR(50),
priorizacao char,
area_aplicacao1 VARCHAR(50),
area_aplicacao2 VARCHAR(50),
area_aplicacao3 VARCHAR(50),
area_aplicacao4 VARCHAR(50),
area_aplicacao5 VARCHAR(50),
titularidade1 VARCHAR(50),
titularidade2 VARCHAR(50),
titularidade3 VARCHAR(50),
titularidade4 VARCHAR(50),
data_deposito DATE,
data_validade DATE,
data_publicacao DATE,
data_concessao DATE
);




CREATE TABLE dim_CUSTOSDOPROCESSO (
 pk_custosdoprocesso  INT,
 totaldoprocessoemREAIS  FLOAT,
 totaldoprocessolibraGBP  FLOAT,
 totaldoprocessodólarUSD  FLOAT,
 totaldoprocessoeuroEUR  FLOAT,
 totaldoprocessoaustraliaAUD  FLOAT,
 totaldoprocessonoruegaNOK  FLOAT,
 totaldoprocessosuéciEK  FLOAT,
 totaldoprocessoieneJPY  FLOAT,
 totaldoprocessocanadaCAD  FLOAT,
 totaldoprocessonovazelandiaNZD  FLOAT,
 custo_evpREAIS  FLOAT,
 custo_redaçãoREAIS  FLOAT
);

CREATE TABLE dim_TEMPO(
pk_tempo  INT,
data  DATE,
ano  INT,
mes  VARCHAR(15),
dia  VARCHAR(10)
);

CREATE TABLE dim_RESPONSAVEL(
pk_responsavel  INT,
nome_tecnico  VARCHAR(50),
nome_responsavel_externo  VARCHAR(50)
);

CREATE TABLE dim_LOCAL(
pk_local INT,
pais VARCHAR(30)
);