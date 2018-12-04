-- --------                      TF2                    ------------ --
--                                                                   --
--                    SCRIPT DE APAGA (DDL)                          --
--                                                                   --
-- Data Criacao ..........: 04/12/2018                               --
-- Autor(es) .............: Eduardo Lima, Geovana Ramos, Sara Silva  --
-- Banco de Dados ........: MySQL                                    --
-- Base de Dados(nome) ...: TF2                                      --
--                                                                   --
-- Data Ultima Alteracao ..: 04/12/2018                              --
--    + Criação dos drops                                            --
--                                                                   --
-- PROJETO => 1 Base de Dados                                        --
--         => 21 Tabelas                                             --
--                                                                   --
-- ----------------------------------------------------------------- --

USE TF2;

-- --------- Relacionamentos ------- --
DROP TABLE atende;
DROP TABLE entrega;

-- --------- Atendimento ------- --
DROP TABLE ATENDIMENTO;

-- --------- Multivalorados ------- --
DROP TABLE telefonepaciente;
DROP TABLE telefonefuncionario;

-- --------- Receitas ------- --
DROP TABLE PRESCRICAO;
DROP TABLE RECEITAESPECIAL;
DROP TABLE RECEITASIMPLES;
DROP TABLE RECEITA ;

-- --------- Pedidos ------- --
DROP TABLE PEDIDOINSUMO ;
DROP TABLE PEDIDOMEDICAMENTO ;
DROP TABLE PEDIDO ;

-- --------- Estoque -------- --
DROP TABLE ESTOQUEMEDICAMENTO;
DROP TABLE MEDICAMENTO;
DROP TABLE TIPOMEDICAMENTO;
DROP TABLE ESTOQUEINSUMO ;
DROP TABLE INSUMO ;

-- --------- Atores ------- --
DROP TABLE FARMACEUTICO ;
DROP TABLE BALCONISTA ;
DROP TABLE FUNCIONARIO;
DROP TABLE PACIENTE;
