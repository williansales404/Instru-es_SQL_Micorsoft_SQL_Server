-- CTE: Common Table Expression = tabela temporaria
-- Crie uma CTE para armazenar o resultado de uma consulta que contenha: 
-- ProductKey, ProductName, BrandName, ColorName e UnitPrice, apenas para a marca Contoso
with cte as (
	select
		ProductKey,
		ProductName,
		BrandName,
		ColorName,
		UnitPrice
	from DimProduct
	where BrandName = 'Contoso'
)

select * from cte