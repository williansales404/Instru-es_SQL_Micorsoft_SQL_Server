-- CTE: Calculando agregações
-- Crie uma CTE que seja o resultado do agrupamento de total de produtos por marca.
-- Faça uma média de produtos por marca.

with cte (Marca, Total) as ( --OBS posso nomear as colunas ao criar o cte
	select
		BrandName,
		count(*)
	from DimProduct
	group by BrandName
)

select * from cte