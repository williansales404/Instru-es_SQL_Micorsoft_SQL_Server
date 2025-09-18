--FULL(ANTI)JOIN
select * from DimProduct
select * from DimProductSubcategory

select
	ProductKey,
	ProductName,
	DimProduct.ProductSubcategoryKey,
	DimProductSubcategory.ProductSubcategoryName
from DimProduct
FULL join DimProductSubcategory
on DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
WHERE ProductKey is null or DimProductSubcategory.ProductSubcategoryKey is null