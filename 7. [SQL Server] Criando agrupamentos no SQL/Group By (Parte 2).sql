
select * from DimStore

select 
	StoreType,
	sum(EmployeeCount) as 'Total funcionarios'
from DimStore
group by StoreType
------------------------------

select * from DimProduct

select 
	BrandName, 
	avg(UnitCost) as 'Media de custo'
from DimProduct
group by BrandName
------------------------------

select * from DimProduct

select 
	ClassName, 
	max(UnitPrice) 
from DimProduct
group by ClassName