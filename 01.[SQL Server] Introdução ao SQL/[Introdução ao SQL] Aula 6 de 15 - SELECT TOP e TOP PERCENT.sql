--COMANDO SELECT * .. FROM SELECIONA TODAS AS COLUNAS DAS TABELAS, E TODAS AS LINHAS IDEPENDENTE DA COLUNA SELECIONADA

-- Comando SELECT TOP(N) e TOP(N) PERCENT: Retorna as N primeiras linhas

-- 1. Crie um código que retorna as 10 primeiras linhas da tabela de Produtos.

SELECT TOP(10) * FROM DimProduct

-- 2. Retorna as 10% primeiras linhas da tabela de Clientes

select top(10) percent * from DimCustomer