--FULL(OUTER)JOIN
select * from DimProduct
select * from DimProductSubcategory

select
	ProductKey,
	ProductName,
	DimProduct.ProductSubcategoryKey as 'chave estrangeira em product',
	DimProductSubcategory.ProductSubcategoryKey as 'chave primaria em subcategory',
	DimProductSubcategory.ProductSubcategoryName
from DimProduct
full join DimProductSubcategory
on DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
