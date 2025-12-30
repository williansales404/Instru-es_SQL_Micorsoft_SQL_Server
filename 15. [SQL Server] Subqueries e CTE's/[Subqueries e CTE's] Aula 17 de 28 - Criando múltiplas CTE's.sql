-- CTE: Criando múltiplas CTE's
-- Crie 2 CTE's:
-- 1. A primeira, chamada produtos_contoso, deve conter as seguintes colunas (DimProduct): ProductKey, ProductName, BrandName
-- 2. A segunda, chamada vendas_top100, deve ser um top 100 vendas mais recentes, considerando as seguintes colunas (FactSales): SalesKey, ProductKey, DateKey, SalesQuantity Por fim, faça um INNER JOIN dessas tabelas

--Solução Professor
/*WITH produtos_contoso AS (
	SELECT
		ProductKey,
		ProductName,
		BrandName
	FROM
		DimProduct
	WHERE
		BrandName = 'Contoso'
),
vendas_top100 AS (
	SELECT TOP(100)
		SalesKey,
		ProductKey,
		DateKey,
		SalesQuantity
	FROM
		FactSales
	ORDER BY
		DateKey DESC
)

SELECT * FROM vendas_top100
INNER JOIN produtos_contoso
	ON vendas_top100.ProductKey = produtos_contoso.ProductKey*/

--Minha solução
with produtos_contoso as (
	select
		ProductKey,
		ProductName,
		BrandName
	from DimProduct
	where BrandName = 'Contoso'
),

vendas_top100 as (
	select
		top(100)
		SalesKey,
		ProductKey,
		DateKey,
		SalesQuantity
	from FactSales
	where DateKey = (select max(DateKey) from FactSales)
	--order by DateKey desc
)

select
	produtos_contoso.ProductKey as 'produtos_contoso',
	produtos_contoso.ProductName as  'produtos_contoso',
	SalesKey,
	SalesQuantity
from vendas_top100
inner join produtos_contoso
	on produtos_contoso.ProductKey = vendas_top100.ProductKey