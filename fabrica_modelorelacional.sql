DROP TABLE IF EXISTS TRABALHA;
DROP TABLE IF EXISTS OPERA;
DROP TABLE IF EXISTS FABRICA;
DROP TABLE IF EXISTS FORNECE;
DROP TABLE IF EXISTS REVENDE;
DROP TABLE IF EXISTS GUARDA;
DROP TABLE IF EXISTS DISTRIBUI;
DROP TABLE IF EXISTS POSSUI;
DROP TABLE IF EXISTS VENDE;
DROP TABLE IF EXISTS PRODUTO;
DROP TABLE IF EXISTS DEPARTAMENTO;
DROP TABLE IF EXISTS FUNCIONARIOS;
DROP TABLE IF EXISTS MAQUINA;
DROP TABLE IF EXISTS CATEGORIA;
DROP TABLE IF EXISTS FORNECEDOR;
DROP TABLE IF EXISTS REVENDEDOR;
DROP TABLE IF EXISTS estoque;
DROP TABLE IF EXISTS loja;
DROP TABLE IF EXISTS distribuidora;


CREATE TABLE FUNCIONARIOS(
	   cpf INTEGER PRIMARY KEY,
       nome VARCHAR(100),
       registro INTEGER
);

CREATE TABLE DEPARTAMENTO(
		registro INTEGER PRIMARY KEY,
        nome VARCHAR(100),
        local VARCHAR(100)
);

CREATE TABLE MAQUINA(
		registro INTEGER PRIMARY KEY,
        tipo VARCHAR(100),
        local VARCHAR(100)
);

CREATE TABLE TRABALHA(
	   cpf_funcionario INTEGER,
       registro_departamento INTEGER,
       FOREIGN KEY(cpf_funcionario) REFERENCES FUNCIONARIOS(cpf),
       FOREIGN KEY(registro_departamento) REFERENCES DEPARTAMENTO(registro),
       PRIMARY KEY(cpf_funcionario, registro_departamento)
);

CREATE TABLE OPERA(
	   cpf_funcionario INTEGER,
       registro_maquina INTEGER,
       FOREIGN KEY(cpf_funcionario) REFERENCES FUNCIONARIOS(cpf),
       FOREIGN KEY(registro_maquina) REFERENCES MAQUINA(registro),
       PRIMARY KEY(cpf_funcionario, registro_maquina)
);

CREATE TABLE PRODUTO(
		cod INTEGER PRIMARY KEY,
        valor INTEGER,
        material VARCHAR(100)

);

CREATE TABLE FABRICA(
	   registro_maquina INTEGER,
       cod_produto INTEGER,
       FOREIGN KEY(registro_maquina) REFERENCES MAQUINA(registro),
       FOREIGN KEY(cod_produto) REFERENCES PRODUTO(cod),
       PRIMARY KEY(registro_maquina, cod_produto)
);

CREATE TABLE CATEGORIA(
		registro INTEGER PRIMARY KEY,
        nome VARCHAR(100),
        setor VARCHAR(100)

);

CREATE TABLE POSSUI(
	   cod_produto INTEGER,
       registro_categoria INTEGER,
       FOREIGN KEY(cod_produto) REFERENCES PRODUTO(cod),
       FOREIGN KEY(registro_categoria) REFERENCES CATEGORIA(registro),
       PRIMARY KEY(cod_produto, registro_categoria)
);
	

CREATE TABLE FORNECEDOR(
		cnpj INTEGER PRIMARY KEY,
        nome VARCHAR(100),
        local VARCHAR(100),
        contato VARCHAR(100)

);

CREATE TABLE FORNECE(
		cnpj_fornecedor INTEGER,
        cod_produto INTEGER,
        FOREIGN KEY(cnpj_fornecedor) REFERENCES FORNECEDOR(cnpj),
        FOREIGN KEY(cod_produto) REFERENCES PRODUTO(cod),
        PRIMARY KEY(cnpj_fornecedor, cod_produto)
);

CREATE TABLE REVENDEDOR(
		cnpj INTEGER PRIMARY KEY,
        nome VARCHAR(100),
        local VARCHAR(100),
        contato VARCHAR(100)
);

CREATE TABLE REVENDE(
	   cnpj_revendedor INTEGER,
       cod_produto INTEGER,
       FOREIGN KEY(cnpj_revendedor) REFERENCES REVENDEDOR(cnpj),
       FOREIGN KEY(cod_produto) REFERENCES PRODUTO(cod),
       PRIMARY KEY(cnpj_revendedor, cod_produto)
);

CREATE TABLE ESTOQUE(
		registro INTEGER PRIMARY KEY,
        quantidade INTEGER,
        local VARCHAR(100)
);

CREATE TABLE GUARDA(
	   registro_estoque INTEGER,
       cod_produto INTEGER,
       FOREIGN KEY(registro_estoque) REFERENCES ESTOQUE(registro),
       FOREIGN KEY(cod_produto) REFERENCES PRODUTO(cod),
       PRIMARY KEY(cod_produto)
);


CREATE TABLE LOJA(
		cnpj INTEGER PRIMARY KEY,
        nome VARCHAR(100),
        local VARCHAR(100),
        contato VARCHAR(100)
);

CREATE TABLE VENDE(
		cnpj_loja INTEGER,
        cod_produto INTEGER,
        FOREIGN KEY(cnpj_loja) REFERENCES LOJA(cnpj),
        FOREIGN KEY(cod_produto) REFERENCES PRODUTO(cod),
        PRIMARY KEY(cnpj_loja, cod_produto)
);

CREATE TABLE DISTRIBUIDORA(
		cnpj INTEGER PRIMARY KEY,
        nome VARCHAR(100),
        local VARCHAR(100),
        contato VARCHAR(100)
);

CREATE TABLE DISTRIBUI(
		cnpj_distribuidora INTEGER,
        cod_produto INTEGER,
        FOREIGN KEY(cnpj_distribuidora) REFERENCES DISTRIBUIDORA(cnpj),
        FOREIGN KEY(cod_produto) REFERENCES PRODUTO(cod),
        PRIMARY KEY(cnpj_distribuidora, cod_produto)
);

