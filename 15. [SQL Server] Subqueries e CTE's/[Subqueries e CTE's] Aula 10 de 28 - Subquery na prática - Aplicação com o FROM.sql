select 
	count(*) as 'QTD. produtos'
from DimProduct
where BrandName = 'Contoso'

select 
	count(*) as 'QTD. produtos'
from (select * from DimProduct where BrandName = 'Contoso') as T 
--OBS apos criar a subconsulta no from precisa nomear a tabela