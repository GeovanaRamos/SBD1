-- --------            << TRABALHO FINAL - TEMA 2 >>                        ------------ --
--                                                                                       --
--                    SCRIPT DE CRIACAO (DDL)                                            --
--                                                                                       --
-- Data Criacao ..........: 26/11/2018                                                   --
-- Autor(es) .............: Geovana Silva, Sara Silva, Eduardo Lima                      --
-- Banco de Dados ........: MySQL                                                        --
-- Base de Dados(nome) ...: farmacia                                                     --
--                                                                                       --
-- Data Ultima Alteracao ..: 26/11/2018                                                  --
--    + Criação nova tabela prescreve
--    + Adição de alguns atributos
--    + Criação nova tabela ESTOQUE_MEDICAMENTO
--                                                                                       --
-- PROJETO => 1 Base de Dados                                                            --
--         => 10 Tabelas                                                                 --
--                                                                                       --
-- -----------------------------------------------------------------                     --

create database if not exists farmacia;

use farmacia;

CREATE TABLE PACIENTE (
    ses INT(14)  PRIMARY KEY,
    nome VARCHAR(255)  NOT NULL,
    dataNascimento DATE  NOT NULL,
    rg INT(7)  NOT NULL,
    numero INT(3)  NOT NULL,
    rua VARCHAR(60)  NOT NULL,
    bairro VARCHAR(60)  NOT NULL,
    cidade VARCHAR(60)  NOT NULL,
    estado VARCHAR(60)  NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE FARMACEUTICO (
    cpf INT(11) NOT NULL,
    dataNascimento DATE  NOT NULL,
    crf INT(5)  PRIMARY KEY,
    nomeCompleto VARCHAR(255)  NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE PRODUTO (
    codigoBarras int(13) PRIMARY KEY,
    nome VARCHAR(255)  NOT NULL,
	tipoFarmacia varchar(20) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE MEDICAMENTO (
    portaria INT(4)  NOT NULL,
    codigoBarras int(13) PRIMARY KEY,
    CONSTRAINT FK_MEDICAMENTO_PRODUTO
       FOREIGN KEY (codigoBarras)
       REFERENCES PRODUTO (codigoBarras)
       ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE ESTOQUE_PRODUTO (
    idProduto INT PRIMARY KEY,
    codigoBarras INT(13),
    quantidade INT,

    CONSTRAINT FK_PRODUTO
    	FOREIGN KEY (codigoBarras)
	REFERENCES PRODUTO (codigoBarras)
	ON DELETE RESTRICT ON UPDATE RESTRICT,
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE retira (
    codDistribuicao INT(8) PRIMARY KEY AUTO_INCREMENT,
    quantidadeSolicitada INT(4)  NOT NULL,
    quantidadeFornecida INT(4)  NOT NULL,
    dataHora DATETIME  NOT NULL,
    codigoBarras INT(13)  NOT NULL,
    crf INT(5)  NOT NULL,
    CONSTRAINT FK_retira_ESTOQUE_PRODUTO
        FOREIGN KEY (codigoBarras)
        REFERENCES ESTOQUE_PRODUTO (codigoBarras)
        ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT FK_retira_FARMACEUTICO
        FOREIGN KEY (crf)
        REFERENCES FARMACEUTICO (crf)
        ON DELETE RESTRICT ON UPDATE RESTRICT
)ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT = 1;

CREATE TABLE RECEITA (
    codReceita INT(8) PRIMARY KEY AUTO_INCREMENT,
    dataHora DATETIME  NOT NULL,
    crm VARCHAR(10)  NOT NULL,
    nomeMedico VARCHAR(50) NOT NULL,
    ses INT(14)  NOT NULL,
    crf INT(5)  NOT NULL,
   CONSTRAINT FK_RECEITA_PACIENTE
       FOREIGN KEY (ses)
       REFERENCES PACIENTE (ses)
       ON DELETE RESTRICT ON UPDATE RESTRICT,
   CONSTRAINT FK_RECEITA_FARMACEUTICO
       FOREIGN KEY (crf)
       REFERENCES FARMACEUTICO (crf)
       ON DELETE RESTRICT ON UPDATE RESTRICT
)ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT = 1;

CREATE TABLE RECEITASIMPLES (
    codReceita INT(8) PRIMARY KEY,
    CONSTRAINT FK_RECEITASIMPLES_RECEITA
       FOREIGN KEY (codReceita)
       REFERENCES RECEITA (codReceita)
       ON DELETE RESTRICT ON UPDATE RESTRICT
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE RECEITAESPECIAL (
    codReceita INT(8) PRIMARY KEY,
    lista ENUM('A1', 'A2', 'A3', 'B1', 'B2', 'C1', 'C2', 'C3', 'C4', 'C5'),
    codigoBarras int(13) NOT NULL,
    CONSTRAINT FK_RECEITAESPECIAL_RECEITA
        FOREIGN KEY (codReceita)
        REFERENCES RECEITA (codReceita)
        ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT FK_RECEITAESPECIAL_MEDICAMENTO
        FOREIGN KEY (codigoBarras)
        REFERENCES MEDICAMENTO (codigoBarras)
        ON DELETE RESTRICT ON UPDATE RESTRICT
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE prescreve(
    codReceita INT(8) NOT NULL,
    codigoBarras int(13) NOT NULL,
    dose VARCHAR(255) NOT NULL,
    frequencia VARCHAR(255) NOT NULL,
	duração VARCHAR(255) NOT NULL,
    CONSTRAINT FK_prescreve_RECEITASIMPLES
        FOREIGN KEY (codReceita)
        REFERENCES RECEITASIMPLES (codReceita)
        ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT FK_prescreve_MEDICAMENTO
        FOREIGN KEY (codigoBarras)
        REFERENCES MEDICAMENTO (codigoBarras)
        ON DELETE RESTRICT ON UPDATE RESTRICT
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE telefones (
    ses INT(14)  NOT NULL,
    telefones INT(11)  NOT NULL,
    CONSTRAINT FK_RECEITA_atende_3
        FOREIGN KEY (ses)
        REFERENCES PACIENTE (ses)
        ON DELETE RESTRICT ON UPDATE RESTRICT
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
