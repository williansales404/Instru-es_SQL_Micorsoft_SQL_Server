--RIGHT(ANTI)JOIN
select * from DimProduct
select * from DimProductSubcategory

select
	ProductKey,
	ProductName,
	DimProduct.ProductSubcategoryKey,
	DimProductSubcategory.ProductSubcategoryName
from DimProduct
right join DimProductSubcategory
on DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
where ProductKey is null

