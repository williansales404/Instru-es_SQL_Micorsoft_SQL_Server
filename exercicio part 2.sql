
select
DateFirstPurchase,
case
	when MONTH(DateFirstPurchase) = 1 then 'Janeiro'

end as T,
case
	when MONTH(DateFirstPurchase) = 1 then cast(DateFirstPurchase as date)
end as D
from ContosoRetailDW.dbo.DimCustomer
where CustomerType = 'Person'
order by MONTH(DateFirstPurchase), DAY(DateFirstPurchase)




