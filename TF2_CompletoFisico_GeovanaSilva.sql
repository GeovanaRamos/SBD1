-- --------                      TF2                    ------------ --
--                                                                   --
--                    SCRIPT DE CRIACAO (DDL)                        --
--                                                                   --
-- Data Criacao ..........: 29/11/2018                               --
-- Autor(es) .............: Eduardo Lima, Geovana Ramos, Sara Silva  --
-- Banco de Dados ........: MySQL                                    --
-- Base de Dados(nome) ...: TF2                                      --
--                                                                   --
-- Data Ultima Alteracao ..: 04/12/2018                              --
--    + Atualização de tabelas                                       --
--                                                                   --
-- PROJETO => 1 Base de Dados                                        --
--         => 21 Tabelas                                             --
--                                                                   --
-- ----------------------------------------------------------------- --

CREATE DATABASE IF NOT EXISTS TF2;
USE TF2;

-- --------- Atores ------- --
CREATE TABLE FUNCIONARIO (
    nome VARCHAR(50) NOT NULL,
    matricula INT PRIMARY KEY
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE FARMACEUTICO (
    crf INT PRIMARY KEY,
    matricula INT NOT NULL,
    CONSTRAINT FK_FARMACEUTICO_FUNCIONARIO
        FOREIGN KEY (matricula)
        REFERENCES FUNCIONARIO (matricula)
        ON DELETE RESTRICT ON UPDATE RESTRICT
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE BALCONISTA (
    matricula INT PRIMARY KEY,
    CONSTRAINT FK_BALCONISTA_FUNCIONARIO
        FOREIGN KEY (matricula)
        REFERENCES FUNCIONARIO (matricula)
        ON DELETE RESTRICT ON UPDATE RESTRICT
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE PACIENTE (
    nome VARCHAR(50) NOT NULL,
    dtNascimento DATE NOT NULL,
    cep INT NOT NULL,
    logradouro VARCHAR(50) NOT NULL,
    numero INT NOT NULL,
    rg INT NOT NULL,
    ses INT PRIMARY KEY NOT NULL,
    cpf VARCHAR(11) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------- Estoque -------- --
CREATE TABLE TIPOMEDICAMENTO (
    idTipoMedicamento INT PRIMARY KEY AUTO_INCREMENT,
    principioAtivo VARCHAR(50) NOT NULL,
    portaria INT NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE MEDICAMENTO (
    idMedicamento INT PRIMARY KEY AUTO_INCREMENT,
    idTipoMedicamento INT NOT NULL,
    laboratorio VARCHAR(50) NOT NULL,
    CONSTRAINT FK_MEDICAMENTO_TIPOMEDICAMENTO
        FOREIGN KEY (idTipoMedicamento)
        REFERENCES TIPOMEDICAMENTO (idTipoMedicamento)
        ON DELETE RESTRICT ON UPDATE RESTRICT
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE ESTOQUEMEDICAMENTO (
    idEstoqueMedicamento INT PRIMARY KEY AUTO_INCREMENT,
    tipoFarmacia ENUM('Interna', 'Externa')  NOT NULL,
    quantidade INT NOT NULL,
    idMedicamento INT NOT NULL,
    CONSTRAINT FK_ESTOQUEMEDICAMENTO_MEDICAMENTO
        FOREIGN KEY (idMedicamento)
        REFERENCES MEDICAMENTO (idMedicamento)
        ON DELETE RESTRICT ON UPDATE RESTRICT
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE INSUMO (
    nome VARCHAR(50) NOT NULL,
    idInsumo INT PRIMARY KEY AUTO_INCREMENT
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE ESTOQUEINSUMO (
    idEstoqueInsumo INT PRIMARY KEY AUTO_INCREMENT,
    quantidade INT NOT NULL,
    idInsumo INT NOT NULL,
    CONSTRAINT FK_ESTOQUEINSUMO_INSUMO
        FOREIGN KEY (idInsumo)
        REFERENCES INSUMO (idInsumo)
        ON DELETE RESTRICT ON UPDATE RESTRICT
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------- Pedidos ------- --
CREATE TABLE PEDIDO (
    idPedido INT PRIMARY KEY AUTO_INCREMENT,
    quantidade INT NOT NULL,
    data DATE NOT NULL,
    matricula INT NOT NULL,
    CONSTRAINT FK_PEDIDO_FUNCIONARIO
        FOREIGN KEY (matricula)
        REFERENCES FUNCIONARIO (matricula)
        ON DELETE RESTRICT ON UPDATE RESTRICT
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE PEDIDOINSUMO (
    idPedido INT PRIMARY KEY AUTO_INCREMENT,
    idInsumo INT NOT NULL,
    CONSTRAINT FK_PEDIDOINSUMO_PEDIDO
        FOREIGN KEY (idPedido)
        REFERENCES PEDIDO (idPedido)
        ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT FK_PEDIDOINSUMO_INSUMO
        FOREIGN KEY (idInsumo)
        REFERENCES INSUMO (idInsumo)
        ON DELETE RESTRICT ON UPDATE RESTRICT
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE PEDIDOMEDICAMENTO (
    idPedido INT PRIMARY KEY AUTO_INCREMENT,
    idTipoMedicamento INT NOT NULL,
    CONSTRAINT FK_PEDIDOMEDICAMENTO_PEDIDO
        FOREIGN KEY (idPedido)
        REFERENCES PEDIDO (idPedido)
        ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT FK_PEDIDOMEDICAMENTO_TIPOMEDICAMENTO
        FOREIGN KEY (idTipoMedicamento)
        REFERENCES TIPOMEDICAMENTO (idTipoMedicamento)
        ON DELETE RESTRICT ON UPDATE RESTRICT
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------- Receitas ------- --
CREATE TABLE RECEITA (
    crm INT NOT NULL,
    idReceita INT PRIMARY KEY AUTO_INCREMENT,
    nomeMedico VARCHAR(50) NOT NULL,
    dataEmissao DATE NOT NULL,
    dataRecebimento DATE NOT NULL,
    crf INT NOT NULL,
    ses INT NOT NULL,
    CONSTRAINT FK_RECEITA_FARMACEUTICO
        FOREIGN KEY (crf)
        REFERENCES FARMACEUTICO (crf)
        ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT FK_RECEITA_PACIENTE
        FOREIGN KEY (ses)
        REFERENCES PACIENTE (ses)
        ON DELETE RESTRICT ON UPDATE RESTRICT
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE RECEITASIMPLES (
    idReceita INT PRIMARY KEY,
    CONSTRAINT FK_RECEITASIMPLES_RECEITA
        FOREIGN KEY (idReceita)
        REFERENCES RECEITA (idReceita)
        ON DELETE RESTRICT ON UPDATE RESTRICT
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE RECEITAESPECIAL (
    codigoEspeciaL INT UNIQUE NOT NULL,
    abrangencia VARCHAR(15) NOT NULL,
    idReceita INT PRIMARY KEY NOT NULL,
    lista ENUM('A1', 'A2', 'A3', 'B1', 'B2', 'C1', 'C2', 'C3', 'C4', 'C5') NOT NULL,
    CONSTRAINT FK_RECEITAESPECIAL_RECEITA
        FOREIGN KEY (idReceita)
        REFERENCES RECEITA (idReceita)
        ON DELETE RESTRICT ON UPDATE RESTRICT
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE PRESCRICAO (
    quantidade INT NOT NULL,
    idPrescricao INT PRIMARY KEY AUTO_INCREMENT,
    idTipoMedicamento INT NOT NULL,
    idReceita INT NOT NULL,
    posologia VARCHAR(50) NOT NULL,
    CONSTRAINT FK_PRESCRICAO_TIPOMEDICAMENTO
        FOREIGN KEY (idTipoMedicamento)
        REFERENCES TIPOMEDICAMENTO (idTipoMedicamento)
        ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT FK_PRESCRICAO_RECEITA
        FOREIGN KEY (idReceita)
        REFERENCES RECEITA (idReceita)
        ON DELETE RESTRICT ON UPDATE RESTRICT
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------- Multivalorados ------- --
CREATE TABLE telefonepaciente (
    ses INT NOT NULL NOT NULL,
    telefone INT(11) NOT NULL,
    CONSTRAINT FK_telefone_PACIENTE
        FOREIGN KEY (ses)
        REFERENCES PACIENTE (ses)
        ON DELETE RESTRICT ON UPDATE RESTRICT
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE telefonefuncionario (
    matricula INT NOT NULL,
    telefone INT(11) NOT NULL,
    CONSTRAINT FK_telefone_matricula
        FOREIGN KEY (matricula)
        REFERENCES FUNCIONARIO (matricula)
        ON DELETE RESTRICT ON UPDATE RESTRICT
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------- Atendimento ------- --
CREATE TABLE ATENDIMENTO (
    data DATE NOT NULL,
    dataRetorno DATE NOT NULL,
    matricula INT NOT NULL,
    ses INT NOT NULL,
    idAtendimento INT PRIMARY KEY AUTO_INCREMENT,
    CONSTRAINT FK_ATENDIMENTO_FUNCIONARIO
        FOREIGN KEY (matricula)
        REFERENCES FUNCIONARIO (matricula)
        ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT FK_ATENDIMENTO_PACIENTE
        FOREIGN KEY (ses)
        REFERENCES PACIENTE (ses)
        ON DELETE RESTRICT ON UPDATE RESTRICT
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------- Relacionamentos ------- --
CREATE TABLE atende (
    matricula INT(11) NOT NULL,
    ses INT NOT NULL,
    CONSTRAINT FK_atende_FUNCIONARIO
        FOREIGN KEY (matricula)
        REFERENCES FUNCIONARIO (matricula)
        ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT FK_atende_PACIENTE
        FOREIGN KEY (ses)
        REFERENCES PACIENTE (ses)
        ON DELETE RESTRICT ON UPDATE RESTRICT
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE entrega (
    idMedicamento INT NOT NULL,
    idAtendimento INT NOT NULL,
    CONSTRAINT FK_entrega_MEDICAMENTO
        FOREIGN KEY (idMedicamento)
        REFERENCES MEDICAMENTO (idMedicamento)
        ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT FK_entrega_ATENDIMENTO
        FOREIGN KEY (idAtendimento)
        REFERENCES ATENDIMENTO (idAtendimento)
        ON DELETE RESTRICT ON UPDATE RESTRICT
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
