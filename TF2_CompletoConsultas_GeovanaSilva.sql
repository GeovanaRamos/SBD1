-- --------                      TF2                    ------------ --
--                                                                   --
--                    SCRIPT DE CONSULTA (DML)                         --
--                                                                   --
-- Data Criacao ..........: 04/12/2018                               --
-- Autor(es) .............: Eduardo Lima, Geovana Ramos, Sara Silva  --
-- Banco de Dados ........: MySQL                                    --
-- Base de Dados(nome) ...: TF2                                      --
--                                                                   --
-- Data Ultima Alteracao ..: 04/12/2018                              --
--    + Criação dos selects                                          --
--                                                                   --
-- PROJETO => 1 Base de Dados                                        --
--         => 21 Tabelas                                             --
--                                                                   --
-- ----------------------------------------------------------------- --

USE TF2;

-- Mostrar lista de atendimentos feitos no posto, indicando qual o paciente atendido,
-- o balconista que fez o atendimento, o farmaceutico que deu baixa na receita,
-- o medicamento que foi entregue e
-- a data do atendimento/retirada do remedio.
SELECT
    P.nome as nomePaciente,
    B.matricula as matriculaBalconista,
    F.crf as crfFarmaceutico,
    M.laboratorio,
    T.principioAtivo,
    A.data as dataAtendimento
    FROM ATENDIMENTO A
    JOIN PACIENTE P ON P.ses = A.ses
    JOIN BALCONISTA B ON B.matricula = A.matricula
    JOIN entrega e ON e.idAtendimento = A.idAtendimento
    JOIN MEDICAMENTO M ON M.idMedicamento = e.idMedicamento
    JOIN TIPOMEDICAMENTO T ON T.idTipoMedicamento = M.idTipoMedicamento
    JOIN RECEITA R ON R.ses = P.ses AND R.dataRecebimento = A.data
    JOIN FARMACEUTICO F ON F.crf = R.crf;

-- Mostrar pedidos de insumo e quais funcionários que pediram
SELECT
    I.nome as nomeInsumo,
    P.quantidade as quantidadeInsumo,
    F.matricula as matriculaFuncionario,
    P.data as dataPedido
    FROM PEDIDO P
    JOIN FUNCIONARIO F ON F.matricula = P.matricula
    JOIN PEDIDOINSUMO PI ON PI.idPedido = P.idPedido
    JOIN INSUMO I ON I.idInsumo = PI.idInsumo;

-- Mostrar pedido de medicamentos e quais funcionários que pediram
SELECT
    T.principioAtivo,
    P.quantidade as quantidadeMedicamento,
    F.matricula as matriculaFuncionario,
    P.data as dataPedido
    FROM PEDIDO P
    JOIN FUNCIONARIO F ON F.matricula = P.matricula
    JOIN PEDIDOMEDICAMENTO PM ON PM.idPedido = P.idPedido
    JOIN TIPOMEDICAMENTO T ON T.idTipoMedicamento = PM.idTipoMedicamento;
