-- Subqueries aninhadas  
-- Descubra os nomes dos clientes que ganham o segundo maior salário

--Solução Professor
select
	FirstName,
	LastName,
	CustomerKey,
	YearlyIncome
from DimCustomer
where YearlyIncome =
	(select MAX(YearlyIncome) from DimCustomer where YearlyIncome < (
	select MAX(YearlyIncome) from DimCustomer where CustomerType = 'Person'))

--Minha solução
select
	*
from DimCustomer
where YearlyIncome = (select top(1)YearlyIncome from DimCustomer where YearlyIncome < 
					(select top(1)YearlyIncome from DimCustomer where CustomerType = 'Person' order by YearlyIncome desc) order by YearlyIncome desc)
order by YearlyIncome desc