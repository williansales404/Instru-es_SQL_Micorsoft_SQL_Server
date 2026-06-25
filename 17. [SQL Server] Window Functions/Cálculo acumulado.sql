-- Soma acumulada: soma desde a primeira linha até a linha atual
SELECT
    *,
    SUM(Faturamento_MM) OVER (ORDER BY Data_Fechamento ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS 'Acumulado'
FROM Resultado;

-- ////////////////////////////////////////////////////////

-- Soma móvel: soma da linha anterior, atual e seguinte (janela de 3 linhas)
SELECT
    *,
    SUM(Faturamento_MM) OVER (
        ORDER BY Data_Fechamento 
        ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING
    ) AS 'Soma Movel'
FROM Resultado;

-- ////////////////////////////////////////////////////////

-- Soma total: soma de todas as linhas da tabela, independente da linha atual
SELECT
    *,
    SUM(Faturamento_MM) OVER (ORDER BY Data_Fechamento ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS 'Soma Total'
FROM Resultado;
