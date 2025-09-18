-- COMO ESCOLHER QUE É A TABELA DA ESQUERDA E A TABELA DA DIREITA?
-- 1. LEF Join para complementar informações da tabela produtos (LEFT) de acordo com a tabela de categoria (RIGHT)
-- este modelo abaxio e o mais comumente usado.
select * from DimProduct
select * from DimProductSubcategory

select 
	ProductKey,
	ProductName,
	DimProduct.ProductSubcategoryKey,
	ProductSubcategoryName
from DimProduct
left join DimProductSubcategory
on DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey


-- 2. Obtendo o LEFT Join do caso 1 usando um RIGHT Join e invertendo as tabelas de lado
-- Aqui mudamos a posição das tabelas e usamos o right join para complementar a tabela principal pois mudo de lado 
select 
	ProductKey,
	ProductName,
	DimProduct.ProductSubcategoryKey,
	ProductSubcategoryName
from DimProductSubcategory
right join DimProduct
on DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey


