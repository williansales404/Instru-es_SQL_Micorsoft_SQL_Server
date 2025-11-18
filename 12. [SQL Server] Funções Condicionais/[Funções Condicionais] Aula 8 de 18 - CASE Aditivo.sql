-- CASE Aditivo ea soma de dos resultados de duas case ou mais
-- Os produtos da categoria 'TV and Video' terão um desconto de 10%
-- Se além de ser da categoria 'TV and Video', o produto for da subcategoria 'Televisions', receberá mais 5%.
--Total, 15%

select 
	ProductKey,
	ProductName,
	DimProductCategory.ProductCategoryName,
	DimProductSubcategory.ProductSubcategoryName,
	case
		when ProductCategoryName = 'TV and Video' then 0.10
		else 0
	end
	+
	case
		when ProductSubcategoryName = 'Televisions' then 0.05
		else 0
	end
from DimProduct
	inner join DimProductSubcategory
		on DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
	inner join DimProductCategory
		on DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey

