SELECT * FROM CLIENTE1;
SELECT * FROM CLIENTE2;

---criando o esquema para o dw

CREATE SCHEMA dw;

---aplicando boas práticas na qualidade do DW

SELECT MAX(length(email)), MAX(length(cidade)), MAX(length(nome))
FROM cliente1;

SELECT MAX(length(email)), MAX(length(cidade)), MAX(length(nomecliente))
FROM cliente2;

---criando a dimensão dim_cliente

CREATE TABLE dw.dim_cliente(
sk_cliente SERIAL PRIMARY KEY,
id_cliente int,
nomecliente varchar(50),
origem varchar(10),    
sexo char(1),
dt_nascimento date,
cidade varchar(50),
email varchar(100)
);

---carregando os dados da tabela cliente2

INSERT INTO dw.dim_cliente (id_cliente, nomecliente, origem, sexo, dt_nascimento, cidade, email)
SELECT idCliente, nomecliente, 'cliente2' as origem, sexo, dataNascimento, cidade, email
FROM cliente2;

---verificando os dados da dimensão cliente no DW

SELECT * FROM dw.dim_cliente;

---tratando os dados da tabela cliente1

SELECT codigocliente, 
        concat (nome, ' ', sobrenome) as nomecompleto, 
        CASE 
        WHEN sexo = 'Masculino' THEN 'M'
        WHEN sexo = 'Feminino' THEN 'F'
        END AS sexo,
        datanascimento,
        cidade,
        lower(email)
  FROM cliente1;      
        
---carregando os dados da tabela cliente1

INSERT INTO dw.dim_cliente (id_cliente, nomecliente, origem, sexo, dt_nascimento, cidade, email)
SELECT codigocliente, 
        concat (nome, ' ', sobrenome) as nomecompleto, 
        'cliente1' as origem,
        CASE 
        WHEN sexo = 'Masculino' THEN 'M'
        WHEN sexo = 'Feminino' THEN 'F'
        END AS sexo,
        datanascimento,
        cidade,
        lower(email)
  FROM cliente1;     

---testando o dw

SELECT * FROM dw.dim_cliente;

SELECT cidade, count(*) 
  FROM dw.dim_cliente
 GROUP BY cidade
 ORDER BY 2 DESC;

SELECT extract(year from age(dt_nascimento)) AS idade, sexo, COUNT(*)
  FROM dw.dim_cliente
 GROUP BY 1, 2 
 ORDER BY 1 DESC;