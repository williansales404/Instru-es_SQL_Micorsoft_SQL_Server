select * from DimProduct

select 
	BrandName as 'Marca', 
	count(BrandName) as 'Total por marca'
from DimProduct
group by BrandName
having count(BrandName) >=200
order by count(BrandName) desc