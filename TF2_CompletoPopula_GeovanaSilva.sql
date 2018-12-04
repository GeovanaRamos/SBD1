-- --------                      TF2                    ------------ --
--                                                                   --
--                    SCRIPT DE POPULA (DML)                         --
--                                                                   --
-- Data Criacao ..........: 29/11/2018                               --
-- Autor(es) .............: Eduardo Lima, Geovana Ramos, Sara Silva  --
-- Banco de Dados ........: MySQL                                    --
-- Base de Dados(nome) ...: TF2                                      --
--                                                                   --
-- Data Ultima Alteracao ..: 04/12/2018                              --
--    + Criação de outros inserts                                    --
--                                                                   --
-- PROJETO => 1 Base de Dados                                        --
--         => 21 Tabelas                                             --
--                                                                   --
-- ----------------------------------------------------------------- --

USE TF2;

-- --------- Atores ------- --
INSERT INTO FUNCIONARIO VALUES
    ('Ana Maria Lima', 160122180),
    ('João Pedro Gomes', 150120190),
    ('Maria Joana Pereira', 160121213),
    ('Luiz Claudio Ferreira', 148493423),
    ('Maria de Fátima Sousa', 298423945),
    ('Estevam Melo Santos', 238742837),
    ('Marina Ribeiro Cunha', 947259357),
    ('Pedro Castro Silva', 847364837),
    ('Samuel Lima Sousa', 843837893),
    ('Leonardo Dias Melo', 394837483);

INSERT INTO FARMACEUTICO VALUES
    (16834, 160122180),
    (87648, 150120190),
    (94734, 160121213),
    (84748, 148493423),
    (84357, 298423945);

INSERT INTO BALCONISTA VALUES
    (238742837),
    (947259357),
    (847364837),
    (843837893),
    (394837483);

INSERT INTO PACIENTE VALUES
    ('Gabriela Maria da Silva', '1998-12-12', 72316107, 'lote', 1, 3107891, 827346, '05859393287' ),
    ('Ricardo Pereira Gomes', '1972-10-10', 76385108, 'lote', 3, 3897905, 928374, '05589576328'),
    ('Guilherme Siqueira Nunes', '1968-07-07', 89765389, 'lote', 10, 2345786, 298374, '05748749838'),
    ('Leila Carvalho Barros', '1983-01-25', 72878544, 'lote', 6, 8495949, 849394, '48815951130' ),
    ('Lara Almeida Castro', '1967-02-23', 3730000, 'apartamento', 67, 28347, 28374, '29006396540 ');

-- --------- Estoque -------- --
INSERT INTO TIPOMEDICAMENTO VALUES
    (1, 'Azatioprina', 3456 ),
    (2, 'Diazepam', 6456),
    (3, 'Pantoprazol', 1343),
    (4, 'Albendazol', 9843),
    (5, 'Dipirona', 1298);

INSERT INTO MEDICAMENTO VALUES
    (1,1, 'Germed'),
    (2,2, 'Bayer'),
    (3,3, 'Eurofarma'),
    (4,4, 'EMS'),
    (5, 5, 'Ache');

INSERT INTO ESTOQUEMEDICAMENTO VALUES
    (1, 'Interna', 14, 1),
    (2, 'Externa', 56, 2),
    (3, 'Externa', 78, 3),
    (4, 'Interna', 54, 4),
    (5, 'Externa', 45, 3);

INSERT INTO INSUMO VALUES
    ('Gaze', 1),
    ('Par de Luvas', 2),
    ('Algodão', 3),
    ('Máscara Descartavel', 4 ),
    ('Seringa', 5);

INSERT INTO ESTOQUEINSUMO VALUES
    (1, 34, 1),
    (2, 45, 2),
    (3, 45, 3),
    (4, 84, 4),
    (5, 26, 5);

-- --------- Pedidos ------- --
INSERT INTO PEDIDO VALUES
    (1, 34, '2018-06-05', 160122180),
    (2, 65, '2018-03-06', 150120190),
    (3, 84, '2018-03-07', 160121213 ),
    (4, 73, '2018-05-05', 148493423),
    (5, 36, '2018-02-06', 298423945),
    (6, 64, '2018-07-07', 238742837 ),
    (7, 84, '2018-12-10', 947259357),
    (8, 94, '2018-10-04', 847364837),
    (9, 53, '2018-07-25', 843837893),
    (10, 45, '2018-04-17', 394837483);

INSERT INTO PEDIDOINSUMO VALUES
    (1,1),
    (2,2),
    (3,3),
    (4,4),
    (5,5);

INSERT INTO PEDIDOMEDICAMENTO VALUES
    (4,1),
    (5,2),
    (6,3),
    (7,4),
    (8,5);

-- --------- Receitas ------- --
INSERT INTO RECEITA VALUES
    (87653, 1, 'Pedro Barcelos Junior', '2017-07-07', '2017-07-12',16834, 827346 ),
    (98658, 2, 'Valéria Dantas Silva', '2017-02-06', '2017-02-13', 87648, 928374),
    (83729, 3, 'Henrique Silveira Pedrosa', '2017-03-06', '2017-03-10', 94734, 298374 ),
    (23848, 4, 'Rodrigo Martins Pereira', '2018-10-01', '2018-10-04', 84748, 849394),
    (38475, 5, 'Samuel Melo Araujo', '2018-04-25', '2018-04-28', 84357, 28374 ),
    (65384, 6, 'João Barcelos Junior', '2017-05-08', '2017-05-12',16834, 827346 ),
    (86888, 7, 'Ricardo Dantas Silva', '2017-01-10', '2017-01-13', 87648, 928374),
    (72945, 8, 'Maria Silveira Pedrosa', '2017-09-16', '2017-09-20', 94734, 298374 ),
    (38484, 9, 'Laura Martins Pereira', '2018-12-11', '2018-12-14', 84748, 849394),
    (75234, 10, 'Leia Melo Araujo', '2018-08-15', '2018-08-22', 84357, 28374 );

INSERT INTO RECEITASIMPLES VALUES
    (1),
    (2),
    (3),
    (4),
    (5);

INSERT INTO RECEITAESPECIAL VALUES
    (23874, 'Nacional', 6, 'A1'),
    (23890, 'Nacional', 7, 'A2'),
    (98354, 'Nacional', 8, 'C1'),
    (87493, 'Regional', 9, 'B2'),
    (83743, 'Regional', 10, 'C2');

INSERT INTO PRESCRICAO VALUES
    (2, 1, 1, 1, '3 vezes ao dia'),
    (5, 2, 2, 2, '2 vezes ao dia'),
    (7, 3, 3, 3, 'de 12h em 12h'),
    (6, 4, 4, 4, 'de 7h em 7h'),
    (3, 5, 5, 5, '1 vez ao dia pela manhã'),
    (2, 6, 1, 6, '4 vezes ao dia'),
    (5, 7, 2, 7, '1 vez ao dia'),
    (7, 8, 3, 8, 'de 10h em 10h'),
    (6, 9, 4, 9, 'de 7h em 7h'),
    (3, 10, 5, 10, '1 vez ao dia pela tarde');

-- --------- Multivalorados ------- --
INSERT INTO telefonepaciente VALUES
    (827346, 972316107),
    (928374, 876385108),
    (298374, 989765389),
    (849394, 872878544),
    (28374, 93730000);

INSERT INTO telefonefuncionario VALUES
    (160122180, 837383738),
    ( 150120190, 923746374),
    ( 160121213, 828374627),
    (148493423, 928374634),
    (298423945, 82634762),
    ( 238742837, 98834432),
    (947259357, 823746343),
    ( 847364837, 92734634),
    ( 843837893, 82734374),
    (394837483, 92837423);

-- --------- Atendimento ------- --
INSERT INTO ATENDIMENTO VALUES
    ('2017-07-12','2017-07-20',238742837, 827346, 1),
    ('2017-02-13', '2017-02-18',947259357, 928374, 2),
    ('2017-03-10', '2017-03-16', 847364837, 298374, 3),
    ('2018-10-04', '2018-10-15',843837893, 849394, 4),
    ('2018-04-28', '2018-04-29',  394837483, 28374, 5);

-- --------- Relacionamentos ------- --
INSERT INTO atende VALUES
    (238742837, 827346),
    ( 947259357, 928374),
    ( 847364837, 298374),
    (843837893, 849394),
    (394837483, 28374);

INSERT INTO entrega VALUES
    (1,1),
    (2,2),
    (3,3),
    (4,4),
    (5,5);
