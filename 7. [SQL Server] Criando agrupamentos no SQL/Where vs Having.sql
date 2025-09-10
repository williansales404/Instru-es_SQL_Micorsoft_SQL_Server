select * from DimProduct

select 
	BrandName,
	count(BrandName)
from DimProduct
where ClassName = 'Economy' --filtra a tabela original, antes de fazer o agrupamento
group by BrandName
having count(BrandName) >= 200 -- usa para filtra a tabela apos agrupamento
