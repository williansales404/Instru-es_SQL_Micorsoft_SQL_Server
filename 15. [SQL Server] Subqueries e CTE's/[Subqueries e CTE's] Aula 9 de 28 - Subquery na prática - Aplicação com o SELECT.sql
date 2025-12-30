-- Subqueries: SELECT
-- Retornar uma tabela com todos os produtos (ID Produto e Nome Produto) e também o total de vendas para cada produto
select
	ProductKey,
	ProductName,
	(select count(ProductKey) from FactSales where FactSales.ProductKey = DimProduct.ProductKey) as 'QTD. Vendas'
from DimProduct