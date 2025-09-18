--JOINS MENOS USADOS
--LEFT(ANTI)JOIN
select * from DimProduct
select * from DimProductSubcategory

select
	ProductKey,
	ProductName,
	DimProduct.ProductSubcategoryKey,
	DimProductSubcategory.ProductSubcategoryName
from DimProduct
left join DimProductSubcategory
on DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
--aqui e so um exemplo pois o retorno de left join nõa tem nehum retor de null nas tabelas selecionadas
--para retor um left anti join usa o where para filtra somentos os null
where DimProductSubcategory.ProductSubcategoryName is null