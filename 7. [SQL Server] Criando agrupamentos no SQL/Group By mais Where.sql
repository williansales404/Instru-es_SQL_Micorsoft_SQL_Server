select * from DimProduct

select 
	ColorName as 'Cor',
	count(*) as 'Total produtos'
from DimProduct
where BrandName = 'Contoso'
group by ColorName
order by count(*)