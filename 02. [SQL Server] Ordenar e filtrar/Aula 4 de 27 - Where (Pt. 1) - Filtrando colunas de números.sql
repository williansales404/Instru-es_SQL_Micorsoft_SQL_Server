select * from DimProduct

select top(1) UnitPrice from DimProduct
order by UnitPrice desc

--quantos produtos tem pre�o maior que $1000

select
	ProductName as 'Produto',
	UnitPrice as 'Pre�o'
from
	DimProduct
where UnitPrice >= 2000