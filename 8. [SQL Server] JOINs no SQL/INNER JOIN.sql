--INNER JOIN
--Um dos comando mais usado

select * from DimProductCategory
select * from DimProductSubcategory
select * from DimProduct

select 
	ProductKey,
	ProductName,
	DimProduct.ProductSubcategoryKey,
	DimProductSubcategory.ProductSubcategoryName
from DimProduct
inner join DimProductSubcategory
on DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey