-- [SQL Server] Introdução ao SQL
-- Aula 7 de 15: SELECT DISTINCT

-- Comando SELECT DISTINCT: Retorna os valores distintos de 1 ou mais colunas de uma tabela

-- Retorne todas as linhas da tabela DimProduct
select * from 
	DimProduct

-- Retorne os valores distintos da coluna ColorName da tabela DimProduct
select
	distinct ColorName 
from 
	DimProduct 

-- Retorne todas as linhas da tabela DimEmployee
select * from DimEmployee

-- Retorne os valores distintos da coluna DepartmentName da tabela DimEmployee
select 
	distinct DepartmentName 
from
	DimEmployee