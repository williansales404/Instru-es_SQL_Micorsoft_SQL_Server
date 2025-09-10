select * from DimStore

select 
	StoreType,
	sum(EmployeeCount)
from DimStore
group by StoreType
order by sum(EmployeeCount) desc