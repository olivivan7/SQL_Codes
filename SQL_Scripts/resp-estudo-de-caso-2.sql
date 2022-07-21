---Resolução do Estudo de Caso 2

---Criando do esquema do DW

CREATE SCHEMA dw;

---Criando a dimensão carro

CREATE TABLE dw.dim_carro (
  sk_carro serial primary key,
  nk_carro varchar(9),
  fabricante varchar(50),
  idProprietario integer,
  nm_proprietario varchar(100)
);

---Criando a dimensão local

CREATE TABLE dw.dim_local(
  sk_local serial primary key,
  nk_local char(6)
);

---Criando a dimensão multa

CREATE TABLE dw.dim_multa (
  sk_multa serial primary key,
  nk_multa varchar(6),
  descmulta varchar(200),
  pontos int,
  valor numeric(11,2)
);

---Criando a dimensão tempo

CREATE TABLE dw.dim_tempo(
   sk_tempo serial primary key,
   nk_tempo date,
   dia int,
   mes int,
   ano int 
);

---Criando a dimensão fato

CREATE TABLE dw.fato_ocorrencia(
   fk_carro int,
   fk_multa int,
   fk_tempo int,
   fk_local int,
   foreign key (fk_carro) references dw.dim_carro(sk_carro),
   foreign key (fk_local) references dw.dim_local(sk_local),
   foreign key (fk_multa) references dw.dim_multa(sk_multa), 
   foreign key (fk_tempo) references dw.dim_tempo(sk_tempo)
   
);

---Populando a dimensão carro
SELECT * FROM carro;
SELECT * FROM proprietario;


INSERT INTO dw.dim_carro (nk_carro, fabricante, idproprietario, nm_proprietario)
SELECT c.placa, c.fabricante, p.idproprietario, p.nomeproprietario
  FROM carro c, proprietario p
 WHERE c.idproprietario = p.idproprietario; 
 
 SELECT * FROM dw.dim_carro;


---Populando a dimensão local
SELECT * FROM local;

INSERT INTO dw.dim_local (nk_local)
SELECT rodovia 
 FROM  local;
 
 SELECT * FROM dw.dim_local; 

---Populando a dimensão multa
SELECT * FROM multa;

INSERT INTO dw.dim_multa (nk_multa, descmulta, pontos, valor)
SELECT idmulta, descmulta, pontos, valor
  FROM multa;
  
SELECT * FROM dw.dim_multa;   

---Populando a dimensão tempo
SELECT * FROM ocorrencia;

INSERT INTO dw.dim_tempo (nk_tempo, dia, mes, ano)
SELECT distinct data, extract(day from data) as dia, extract(month from data) as mes, extract(year from data) as ano  
  FROM ocorrencia;

SELECT * FROM dw.dim_tempo;

---Populando a tabela fato

INSERT INTO dw.fato_ocorrencia (fk_carro, fk_multa, fk_tempo, fk_local)
SELECT dc.sk_carro, dm.sk_multa, dt.sk_tempo, dl.sk_local
  FROM ocorrencia o, dw.dim_carro dc, dw.dim_multa dm, dw.dim_tempo dt, dw.dim_local dl
 WHERE o.placa = dc.nk_carro
   AND o.idmulta = dm.nk_multa
   AND o.idlocal = dl.nk_local
   AND o.data = dt.nk_tempo;
   
SELECT * FROM dw.fato_ocorrencia;

---Tirando a prova real

---no transacional, buscamos a quantidade de ocorrências de um determinado veículo = 8
SELECT * FROM ocorrencia
where placa = 'RUQ-0963';

---Depois buscamos a chave artificial dele no DW = 7
select * from dw.dim_carro
where nk_carro = 'RUQ-0963';

---Comparamos o número de ocorrências no DW = 8
select * from dw.fato_ocorrencia
where fk_carro = 7;

---Testando o DW 

---Multas por carro

SELECT c.nk_carro, c.fabricante, count(*) as "multas por carro"
  FROM dw.fato_ocorrencia f, dw.dim_carro c
 WHERE f.fk_carro = c.sk_carro
 GROUP BY c.nk_carro, c.fabricante
 ORDER BY 3 DESC;

---Multas por proprietário

SELECT c.nomeproprietario, count(*) as "multas por proprietario"
  FROM dw.fato_ocorrencia f, dw.dim_carro c
 WHERE f.fk_carro = c.sk_carro
 GROUP BY c.nomeproprietario
 ORDER BY 2 DESC; 


