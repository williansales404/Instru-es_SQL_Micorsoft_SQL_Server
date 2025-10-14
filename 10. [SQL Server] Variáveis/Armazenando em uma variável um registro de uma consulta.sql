-- Armazenando em uma variável um registro de uma consulta
SELECT TOP(100) * FROM FactSales

-- Exemplo 1: Qual é o nome do produto que teve a maior quantidade vendida EM UMA ÚNICA VENDA da tabela FactSales.
declare @varProductMaisVendido int
declare @varTotalMaisVendido int

select
	top(1)
	@varProductMaisVendido = ProductKey,
	@varTotalMaisVendido = SalesQuantity
from FactSales
order by SalesQuantity desc

print @varProductMaisVendido
print @varTotalMaisVendido

select
	ProductKey,
	ProductName
from DimProduct
where ProductKey = @varProductMaisVendido


