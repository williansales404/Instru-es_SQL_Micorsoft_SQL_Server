-- EXISTS
--Tambem poderia o usar o join
-- Retornar uma tabela com todos os produtos (ID Produto e Nome Produto) que possuem alguma venda no dia 01/01/2007
select * from DimProduct

select top(100) * from FactSales

select 
	ProductKey,
	ProductName
from DimProduct
where exists(
	select
		ProductKey
	from FactSales
	--Linha de extrema importancia para usar exists
	where DateKey = '01/01/2007'
	and DimProduct.ProductKey = FactSales.ProductKey
)

--Essa e outro maneira de fazer a consulta usando any e deconsiderar 'and DimProduct.ProductKey = FactSales.ProductKey'
select 
	ProductKey,
	ProductName
from DimProduct
where ProductKey = any (
	select
		ProductKey
	from FactSales
	where DateKey = '01/01/2007'
)
