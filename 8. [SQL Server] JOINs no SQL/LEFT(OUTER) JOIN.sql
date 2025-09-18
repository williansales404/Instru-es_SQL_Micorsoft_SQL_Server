--LEFT(OUTER)JOIN
-- Este comando e um dos mais usados

select * from DimProduct
select * from DimProductSubcategory

select
	DimProduct.ProductKey,
	DimProduct.ProductName,
	DimProduct.ProductSubcategoryKey,
	DimProductSubcategory.ProductSubcategoryName
from DimProduct
LEFT JOIN DimProductSubcategory
ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
