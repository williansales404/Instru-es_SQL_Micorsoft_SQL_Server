-- Função IIF: Alternativa ao CASE
-- Exemplo 1: Qual é a categoria de risco do projeto abaixo, de acordo com a sua nota:
-- Risco Alto: Classificacao >= 5
-- Risco Baixo: Classificacao < 5

DECLARE @varClassificacao INT
SET @varClassificacao = 9

select
	IIF(
		@varClassificacao >= 5,
		'Risco Alto',
		'Risco Baixo'
	)

-- Exemplo 2: Crie uma coluna única de 'Cliente', contendo o nome do Cliente, seja ele uma pessoa ou uma empresa. Traga também a coluna de CustomerKey e CustomerType.
SELECT
	CustomerKey,
	CustomerType,
	IIF(CustomerType = 'Person',
	FirstName,
	CompanyName) as 'Clientes'
FROM DimCustomer

