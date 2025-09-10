-- [SQL Server] Introdução ao SQL
-- Aula 8 de 15: Renomeando colunas (aliasing)

-- Comando AS: Renomeando colunas (aliasing)

-- Selecione as 3 colunas da tabela DimProduct: ProductName, BrandName e ColorName

select ProductName as 'Produto',
	BrandName as 'Marca',
	ColorName as 'Cor'
from
	DimProduct