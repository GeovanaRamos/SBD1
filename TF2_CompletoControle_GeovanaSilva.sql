-- --------                      TF2                    ------------ --
--                                                                   --
--                    SCRIPT DE CONTROLE (DCL)                       --
--                                                                   --
-- Data Criacao ..........: 04/12/2018                               --
-- Autor(es) .............: Eduardo Lima, Geovana Ramos, Sara Silva  --
-- Banco de Dados ........: MySQL                                    --
-- Base de Dados(nome) ...: TF2                                      --
--                                                                   --
-- Data Ultima Alteracao ..: 04/12/2018                              --
--    + Criação de usuário                                           --
--                                                                   --
-- PROJETO => 1 Base de Dados                                        --
--         => 21 Tabelas                                             --
--                                                                   --
-- ----------------------------------------------------------------- --

CREATE USER if not exists 'admin2'
	IDENTIFIED BY 'senhaadmin';
	GRANT ALL PRIVILEGES ON TF2.* TO admin2;
