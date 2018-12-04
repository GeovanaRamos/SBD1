-- --------                      TF2                    ------------ --
--                                                                   --
--                    SCRIPT DE POPULA (DML)                         --
--                                                                   --
-- Data Criacao ..........: 29/11/2018                               --
-- Autor(es) .............: Eduardo Lima, Geovana Ramos, Sara Silva  --
-- Banco de Dados ........: MySQL                                    --
-- Base de Dados(nome) ...: TF2                                      --
--                                                                   --
-- Data Ultima Alteracao ..: 03/12/2018                              --
--    + Criação dos inserts                                          --
--                                                                   --
-- PROJETO => 1 Base de Dados                                        --
--         => 21 Tabelas                                             --
--                                                                   --
-- ----------------------------------------------------------------- --

USE TF2;

-- --------- Atores ------- --
INSERT INTO FUNCIONARIO VALUES
    ('Ana Maria Lima', '160122180'),
    ('João Pedro Gomes', '150120190'),
    ('Maria Joana Pereira', '160121213');

INSERT INTO FARMACEUTICO VALUES
    (16834, 160122180),
    (87648, 150120190),
    (94734, 160121213);

INSERT INTO BALCONISTA VALUES
    (160122180),
    (150120190),
    (160121213);

INSERT INTO PACIENTE VALUES
    ('Gabriela Maria da Silva', '1998-12-12', 72316107, 'lote', 1, 3107891, 827346, '05859393287' ),
    ('Ricardo Pereira Gomes', '1972-10-10', 76385108, 'lote', 3, 3897905, 928374, '05589576328'),
    ('Guilherme Siqueira Nunes', '1968-07-07', 89765389, 'lote', 10, 2345786, 298374, '05748749838');

-- --------- Estoque -------- --
INSERT INTO TIPOMEDICAMENTO VALUES
    (1, 'Azatioprina', 3456 ),
    (2, 'Diazepam', 6456),
    (3, 'Pantoprazol', 1343);

INSERT INTO MEDICAMENTO VALUES
    (1,1, 'Germed'),
    (2,2, 'Bayer'),
    (3,3, 'Eurofarma');

INSERT INTO ESTOQUEMEDICAMENTO VALUES
    (1, 'Interna', 14, 1),
    (2, 'Externa', 56, 2),
    (3, 'Externa', 78, 3);

INSERT INTO INSUMO VALUES
    ('Gaze', 1),
    ('Par de Luvas', 2),
    ('Algodão', 3);

INSERT INTO ESTOQUEINSUMO VALUES
    (1, 34, 1),
    (2, 45, 2),
    (3, 45, 3);

-- --------- Pedidos ------- --
INSERT INTO PEDIDO VALUES
    (1, 34, '2018-06-05', 160122180),
    (2, 65, '2018-03-06', 150120190),
    (3, 84, '2018-03-07', 160121213 ),
    (4, 73, '2018-05-05', 160122180),
    (5, 36, '2018-02-06', 150120190),
    (6, 64, '2018-07-07', 160121213 );

INSERT INTO PEDIDOINSUMO VALUES
    (1,1),
    (2,2),
    (3,3);

INSERT INTO PEDIDOMEDICAMENTO VALUES
    (4,1),
    (5,2),
    (6,3);

-- --------- Receitas ------- --
INSERT INTO RECEITA VALUES
    (87653, 1, 'Pedro Barcelos Junior', '2017-07-07', '2017-07-12',16834, 827346 ),
    (98658, 2, 'Valéria Dantas Silva', '2017-02-06', '2017-02-13', 87648, 928374),
    (83729, 3, 'Henrique Silveira Pedrosa', '2017-03-06', '2017-03-10', 94734, 298374 );

INSERT INTO RECEITASIMPLES VALUES
    (1),
    (2),
    (3);

INSERT INTO RECEITAESPECIAL VALUES
    (23874, 'Nacional', ),
    (23890, 'Nacional', ),
    (98354, 'Nacional', );

INSERT INTO PRESCRICAO VALUES
    (),
    (),
    ();

-- --------- Multivalorados ------- --
INSERT INTO telefonepaciente VALUES
    (),
    (),
    ();

INSERT INTO telefonefuncionario VALUES
    (),
    (),
    ();

-- --------- Atendimento ------- --
INSERT INTO ATENDIMENTO VALUES
    (),
    (),
    ();

-- --------- Relacionamentos ------- --
INSERT INTO atende VALUES
    (),
    (),
    ();

INSERT INTO entrega VALUES
    (),
    (),
    ();
