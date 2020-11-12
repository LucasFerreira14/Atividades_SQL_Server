
--CRIE UM BANCO DE DADOS CHAMADO BD_LOJA_ONLINE
CREATE DATABASE BD_LOJA_ONLINE
GO

USE BD_LOJA_ONLINE
GO

--CRIAÇÃO DAS TABELAS
CREATE TABLE TB_CLIENTE(
CPF VARCHAR(20),
NOME VARCHAR(150) NOT NULL,
SOBRENOME VARCHAR(150) NOT NULL,
CEP VARCHAR(20),
LOGRADOURO VARCHAR(200),
NUMERO INT,
COMPLEMENTO VARCHAR (100),

CONSTRAINT PK_CPF_CLIENTE PRIMARY KEY (CPF)
);


CREATE TABLE TB_EMAIL_CLIENTE(
CPF_CLIENTE VARCHAR(20),
EMAIL VARCHAR(200),

CONSTRAINT PK_CPF_EMAIL_CLIENTE PRIMARY KEY(CPF_CLIENTE, EMAIL),
CONSTRAINT FK_CPF_CLIENTE FOREIGN KEY (CPF_CLIENTE) REFERENCES TB_CLIENTE(CPF)
);

CREATE TABLE TB_TELEFONE_CLIENTE(
CPF_CLIENTE VARCHAR(20),
TELEFONE VARCHAR(200),
TIPO VARCHAR(150), 

CONSTRAINT PK_CPF_TEL_CLIENTE PRIMARY KEY(CPF_CLIENTE, TELEFONE),
CONSTRAINT FK_CPF_CLI FOREIGN KEY (CPF_CLIENTE) REFERENCES TB_CLIENTE(CPF)
);

CREATE TABLE TB_PRODUTO(
COD INT IDENTITY,
NOME VARCHAR (200) NOT NULL,
ORIGEM VARCHAR(150),
DISPONIVEL BIT NOT NULL,
VALOR_CUSTO MONEY,
VALOR_VENDA MONEY

CONSTRAINT PK_COD_PRODUTO PRIMARY KEY (COD)
);

CREATE TABLE TB_COMPRA(
CPF_CLIENTE VARCHAR(20),
COD_PRODUTO INT,
DATA_HORA_COMPRA DATETIME,
QUANTIDADE INT NOT NULL,

CONSTRAINT FK_CPF_C FOREIGN KEY (CPF_CLIENTE) REFERENCES TB_CLIENTE(CPF),
CONSTRAINT FK_COD_PROD FOREIGN KEY (COD_PRODUTO) REFERENCES TB_PRODUTO (COD)

);

ALTER TABLE TB_COMPRA ADD
CONSTRAINT DF_DATA_HORA DEFAULT (GETDATE()) FOR DATA_HORA_COMPRA,
CONSTRAINT CK_QUANTIDADE CHECK (QUANTIDADE > 0)

--============================================================================================

--INSERÇÃO DE VALORES

INSERT INTO TB_CLIENTE(CPF, NOME, SOBRENOME, CEP, LOGRADOURO, NUMERO, COMPLEMENTO)
VALUES
('111.111.111-01', 'João', 'Antonio de Oliveira', '00000-001', 'Rua dos Eucaliptos', 15, 'Casa 01'),
('111.254.547-25', 'Marcos', 'Sauro Junior', '02547-254', 'Av Nossa Senhora da Custódia', 1854, NULL),
('254.874.254-00', 'Silvia', 'Aparecida Moraes', '02458-254', 'Rua dos Milagres', 12, 'Ap 15'),
('145.254.547-25', 'Marcelo', 'de Oliveira', '25487-253', 'Avenida Dom João', 250, NULL),
('254.245.254-36', 'Jorge', 'Matias', '12585-001', 'Avenida dos Himaláias', 258, 'Ap 150'),
('145.857.547-36','marcela','Ramos', '12547-254', 'Rua dos Eucaliptos', 154, NULL),
('154.478.365-38', 'Joana', 'Matos dos Santos', '25485-587', 'Travessa Manaus', 25, 'Casa 03'),
('254.888.958-25','manoela','de Oliveira Hamburgo', '25487-253', 'Avenida Dom João', 4589, 'B'),
('458.458.222.10', 'João', 'Pereira Manoel', '10125-154', 'Rua nova Flor', 102, NULL),
('011.547.857-88', 'Miqueias', 'Filho Pereira', '12585-001', 'Avenida dos Himaláias', 900,NULL),
('154.888.999-45', 'patricia', 'augusto de Oliveira Santos', '10125-154', 'Rua nova Flor', 40, NULL),
('552.120.452-99', 'Rafaela', 'Lins', '12585-001', 'Avenida dos Himaláias', 448, 'Apartamento 14'),
('452.998.220-36', 'Simão', 'Pedro Neto', '55478-552', 'Avenida Paulista', 1540, 'Bloco B Apartamento 26'),
('458.472.785-36','Lucas','Moreira', '25487-253', 'Avenida Dom João', 524, NULL),
('001.254.452-58','Lucas', 'de Paula Filho','10125-154', 'Rua nova Flor', 447, 'Casa 03'),
('254.000.111-85','Thiago','Henrrique Pereira', '25487-253', 'Avenida Dom João', 202, NULL),
('441.222.555-96', 'Miqueias', 'das Neves', '02458-254', 'Rua dos Milagres', 208, NULL),
('524.555.785-65', 'Fernanda', 'dos Santos','55478-552', 'Avenida Paulista', 1854, 'Apartamento 905'),
('458.001.444.96', 'Cristina', 'Malaqueu', '10125-154', 'Rua nova Flor', 991, NULL),
('254.555.020-65', 'Fernando', 'Saulo Filho', '02458-254', 'Rua dos Milagres', 14, 'Casa 18');

INSERT INTO TB_TELEFONE_CLIENTE
VALUES

('111.111.111-01','96854-9988', 'Celular'),
('111.111.111-01','96587-1010', 'Celular'),
('111.111.111-01','95874-4587', 'Celular'),
('111.111.111-01','98877-1011', 'Celular'),
('111.254.547-25', '98547-8020', 'Celular'),
('111.254.547-25', '3985-8855', 'Residencial'),
('254.874.254-00', '99587-8584', 'Celular'),
('254.874.254-00', '91015-8521', 'Celular'),
('254.874.254-00', '3355-8585', 'Residencial'),
('145.254.547-25', '96587-5410', 'Celular'),
('254.245.254-36', '95201-0001', 'Celular'),
('254.245.254-36', '3399-8855', 'Residencial'),
('254.245.254-36', '99857-5200', 'Celular'),
('145.857.547-36','96520-1033', 'Celular'),
('145.857.547-36','3301-0001', 'Fax'),
('154.478.365-38','95050-1515','Celular'),
('154.478.365-38','2587-8541', 'Residencial'),
('458.458.222.10', '96587-0054', 'Celular'),
('458.458.222.10', '96588-0025', 'Celular'),
('011.547.857-88', '96587-8547', 'Celular'),
('011.547.857-88', '3355-9977', 'Residencial'),
('154.888.999-45', '99887-2540', 'Celular'),
('154.888.999-45', '3355-8587', 'Residencial'),
('154.888.999-45', '95874-1547', 'Celular'),
('552.120.452-99', '96587-2521', 'Celular'),
('452.998.220-36', '99955-0001', 'Celular'),
('452.998.220-36', '99955-0002', 'Celular'),
('452.998.220-36', '99955-0003', 'Celular'),
('452.998.220-36', '99955-0004', 'Celular'),
('452.998.220-36', '3985-1500', 'Residencial'),
('458.472.785-36', '90306-9988', 'Celular'),
('458.472.785-36', '2020-8877', 'Fax'),
('001.254.452-58', '96503-8045', 'Celular'),
('441.222.555-96', '97410-5288', 'Celular'),
('441.222.555-96', '8542-2020', 'Residencial'),
('524.555.785-65', '2025-8588', 'Residencial'),
('254.555.020-65', '90205-9951', 'Celular'),
('254.555.020-65', '97015-1547', 'Celular');



INSERT INTO TB_EMAIL_CLIENTE
VALUES
('111.111.111-01', 'joao@gmail.com'),
('111.111.111-01', 'joao@hotmail.com'),
('111.111.111-01', 'joao@uol.com.br'),
('111.254.547-25', 'marcos@live.com'),
('111.254.547-25', 'marcos123@gmail.com'),
('254.874.254-00', 'silvida14@gmail.com'),
('254.874.254-00', 'silviaap@gmail.com'),
('254.874.254-00', 'silvia@globo.com'),
('145.254.547-25', 'marceoli@gmail.com'),
('145.254.547-25', 'marcelinho@hotmail.com'),
('145.254.547-25', 'moliveira125b@live.com'),
('254.245.254-36', 'jm7678@gmail.com'),
('254.245.254-36', 'jorge@hotmail.com'),
('254.245.254-36', 'jorge@ig.com.br'),
('145.857.547-36', 'mramos14@gmail.com'),
('145.857.547-36', 'marcelar@ig.com.br'),
('145.857.547-36', 'mmra@live.com'),
('154.478.365-38', 'joanamds@gmail.com'),
('154.478.365-38', 'joana@live.com'),
('154.478.365-38', 'joanamds2@gmail.com'),
('254.888.958-25','manoela@ig.com.br'),
('011.547.857-88','mm@live.com'),
('552.120.452-99','rafinha@gmail.com'),
('552.120.452-99','rafaela@live.com'),
('452.998.220-36', 'sisimao@gmail.com'),
('452.998.220-36', 'simaopedro@gmail.com'),
('452.998.220-36', 'simaopedro@live.com'),
('458.472.785-36','lumoreira@gmail.com'),
('001.254.452-58','lfilho@live.com'),
('001.254.452-58','lucasf@gmail.com'),
('254.000.111-85','Thihp@gmail.com'),
('524.555.785-65','fesantos@gmail.com'),
('254.555.020-65','ffilho@gmail.com');

INSERT INTO TB_PRODUTO(NOME, ORIGEM, DISPONIVEL, VALOR_CUSTO, VALOR_VENDA)
VALUES
('Mouse sem fio', 'Nacional', 1, 35.5, 48),
('Mouse sem fio', 'Importado', 0, 185, 260),
('Mouse com fio', 'Nacional', 1, 60.9, 85),
('Notebook ASUS', 'Importado', 1, 1650, 1999),
('Placa mãe dualbit', 'Nacional', 1, 680, 950),
('Teclado sem fio', 'Importado', 1, 200, 310),
('Teclado sem fio', 'Nacional', 0, 280, 430),
('Teclado para notebook Apple', 'Importado', 1, 950, 1350),
('Teclado para notebook Samsung', 'Importado', 1 , 600, 780),
('Placa de Video GTX980 TI','Importado',1, 950, 1100),
('Placa de Rede Minimi', 'Nacional', 1 , 210, 280),
('Cadeira Gamer THM', 'Nacional', 1, 650, 910.15),
('Fonte 500W Real DualTek', 'Nacional', 1 , 400, 480.99),
('Carregador para IPhone', 'Importado', 0, 700, 1050.99)
--14

INSERT INTO TB_COMPRA (CPF_CLIENTE, COD_PRODUTO, QUANTIDADE)
VALUES
('111.111.111-01', 1, 10),
('111.111.111-01', 2, 2),
('111.111.111-01', 1, 2),
('111.111.111-01', 3, 1),
('111.111.111-01', 4, 2),
('111.111.111-01', 5, 3),
('111.111.111-01', 6, 30),
('111.111.111-01', 7, 20),
('111.254.547-25', 10, 3),
('111.254.547-25', 11, 2),
('111.254.547-25', 3, 5),
('111.254.547-25', 4, 8),
('111.254.547-25', 14, 5),
('111.254.547-25', 13, 2),
('111.254.547-25', 12, 6),
('111.254.547-25', 11, 4),
('111.254.547-25', 13, 5),
('111.254.547-25', 10, 8),
('254.874.254-00', 1, 15),
('254.874.254-00', 2, 3),
('254.874.254-00', 3, 5),
('254.874.254-00', 10, 18),
('145.254.547-25', 14, 20),
('145.254.547-25', 6, 8),
('145.254.547-25', 3, 5),
('145.254.547-25', 4, 15),
('254.245.254-36', 1, 10),
('254.245.254-36', 2, 2),
('254.245.254-36', 3, 1),
('254.245.254-36', 4, 3),
('254.245.254-36', 10, 15),
('145.857.547-36', 14, 2),
('145.857.547-36', 10, 1),
('145.857.547-36', 8, 1),
('145.857.547-36', 5, 2),
('154.478.365-38', 14, 2),
('154.478.365-38', 3, 1),
('154.478.365-38', 5, 5),
('154.478.365-38', 8, 2),
('154.478.365-38', 3, 4),
('254.888.958-25', 1, 10),
('254.888.958-25', 2, 5),
('254.888.958-25', 3, 15),
('254.888.958-25', 4, 18),
('254.888.958-25', 14, 15),
('458.458.222.10', 10, 2),
('458.458.222.10', 1, 5),
('458.458.222.10', 13 , 8),
('011.547.857-88', 14, 2),
('011.547.857-88', 10,2),
('011.547.857-88', 6, 10),
('154.888.999-45', 6, 2),
('154.888.999-45', 3, 9),
('154.888.999-45', 8, 14),
('154.888.999-45', 9, 16),
('552.120.452-99', 5, 9),
('552.120.452-99',3, 9),
('552.120.452-99', 7, 15),
('552.120.452-99', 6, 30),
('458.472.785-36', 13, 5),
('458.472.785-36', 4, 6),
('458.472.785-36', 9, 15),
('458.472.785-36', 2, 6),
('458.472.785-36', 6, 15),
('254.000.111-85', 14, 3),
('254.000.111-85', 6, 1),
('441.222.555-96', 3, 1),
('441.222.555-96', 6, 2),
('441.222.555-96', 9, 5),
('441.222.555-96', 13, 1),
('441.222.555-96', 14, 1),
('441.222.555-96', 2, 1),
('458.001.444.96', 2, 3),
('254.555.020-65', 9, 15)