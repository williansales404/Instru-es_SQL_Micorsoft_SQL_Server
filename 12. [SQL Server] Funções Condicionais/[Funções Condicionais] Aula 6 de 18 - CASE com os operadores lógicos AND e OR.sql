-- CASE/AND e CASE/OR
-- Faça uma consulta à tabela DimProduct, e retorne as colunas ProductName, BrandName, ColorName, UnitPrice e uma coluna de preço com desconto.

--a) Caso o produto seja da marca Contoso E da cor Red, o desconto do produto será de 10%. Caso contrário, não terá nenhum desconto.
select
	ProductName,
	BrandName,
	ColorName,
	UnitPrice,
	case
		when BrandName = 'Contoso' and ColorName = 'Red' then 0.1
		else 0
	end as 'Desconto'
from DimProduct

--b) Caso o produto seja da marca Litware OU Fabrikam, ele receberá um desconto de 5%. Caso contrário, não terá nenhum desconto.
select
	ProductName,
	BrandName,
	ColorName,
	UnitPrice,
	case
		when BrandName = 'Litware' or BrandName = 'Fabrikam' then 0.05
		else 0
	end as 'Desconto'
from DimProduct
