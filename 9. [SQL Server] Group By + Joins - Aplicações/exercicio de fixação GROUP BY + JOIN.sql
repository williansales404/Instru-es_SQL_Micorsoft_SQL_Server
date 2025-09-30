/*1.
a) Faça um resumo da quantidade vendida (SalesQuantity) de acordo com o nome do canal de vendas (ChannelName).
➡️ Ordene a tabela final de acordo com SalesQuantity, em ordem decrescente.
b) Faça um agrupamento mostrando a quantidade total vendida (SalesQuantity) e quantidade total devolvida (ReturnQuantity) de acordo com o nome das lojas (StoreName).
c) Faça um resumo do valor total vendido (SalesAmount) para cada mês (CalendarMonthLabel) e ano (CalendarYear).*/

select top(100) * from FactSales
select * from DimDate
select * from DimStore
select * from DimChannel

select 
	DimChannel.ChannelName,
	sum(SalesQuantity)
from FactSales
	inner join DimChannel
		on FactSales.channelKey = DimChannel.ChannelKey
group by DimChannel.ChannelName
order by sum(SalesQuantity) desc

select 
	DimStore.StoreName,
	sum(SalesQuantity) as 'Total vendido',
	sum(ReturnQuantity) as 'Total devolvido'
from FactSales
	inner join DimStore
	 on FactSales.StoreKey = DimStore.StoreKey
group by StoreName
order by StoreName

select 
	DimDate.CalendarYear,
	DimDate.CalendarMonthLabel,
	sum(SalesAmount) as 'faturamento total'
from FactSales
	inner join DimDate
	 on FactSales.DateKey = DimDate.Datekey
group by CalendarYear, CalendarMonthLabel, CalendarMonth
order by CalendarMonth asc -- colona com formato ano mes, ordena o mes de acordo com sua posição no celendario.

/*2. Você precisa fazer uma análise de vendas por produtos. O objetivo final é descobrir o valor total vendido (SalesAmount) por produto.
a) Descubra qual é a cor de produto que mais é vendida (de acordo com SalesQuantity).
b) Quantas cores tiveram uma quantidade vendida acima de 3.000.000?*/

select * from DimProduct
select distinct ProductKey from FactSales

select 
	DimProduct.ColorName,
	sum(SalesQuantity)
from FactSales
	inner join DimProduct
		on FactSales.ProductKey = DimProduct.ProductKey
group by DimProduct.ColorName
order by sum(SalesQuantity) desc

select 
	DimProduct.ColorName,
	sum(SalesQuantity)
from FactSales
	inner join DimProduct
		on FactSales.ProductKey = DimProduct.ProductKey
group by DimProduct.ColorName
having sum(SalesQuantity) > 3000000
order by sum(SalesQuantity)

/*3. Observe a imagem abaixo: se trata de um agrupamento de quantidade vendida (SalesQuantity) agrupada por ProductCategoryName. 
Crie o mesmo agrupamento do zero. Obs: você precisará fazer mais do que 1 INNER JOIN, da*/
select top(2) * from DimProduct
select top(2) * from FactSales
select top(2) * from DimProductCategory

select 
	DimProductCategory.ProductCategoryName,
	sum(SalesQuantity) as 'Total vendido'
from FactSales
	inner join DimProduct
		on FactSales.ProductKey = DimProduct.ProductKey
	inner join DimProductSubcategory
		on DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
	inner join DimProductCategory
		on DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey
group by DimProductCategory.ProductCategoryName
order by sum(SalesQuantity) desc

/* 4. FACTONLINESALES
a) Você deve fazer uma consulta à tabela FactOnlineSales e descobrir qual é o nome completo do cliente que mais realizou compras online (de acordo com a coluna SalesQuantity).
b) Feito isso, faça um agrupamento de produtos e descubra quais foram os top 10 produtos mais comprados pelo cliente da letra a), considerando o nome do produto.*/
select top(2) * from FactOnlineSales
select top(2) * from DimProduct
select * from DimCustomer

select
	DimCustomer.CustomerKey, -- em consulta de nome sempre usar id cliente
	DimCustomer.FirstName,
	DimCustomer.LastName,
	sum(SalesQuantity) as 'Total de compras'
from FactOnlineSales
	inner join DimCustomer
		on FactOnlineSales.CustomerKey = DimCustomer.CustomerKey
--where DimCustomer.FirstName is not null
where CustomerType = 'Person'
group by DimCustomer.CustomerKey, DimCustomer.FirstName, DimCustomer.LastName
order by sum(SalesQuantity) desc

select
	top(10)
	DimCustomer.FirstName,
	DimProduct.ProductName,
	count(SalesQuantity) as 'total compras'
from FactOnlineSales
	inner join DimProduct
		on FactOnlineSales.ProductKey = DimProduct.ProductKey
	inner join DimCustomer
		on FactOnlineSales.CustomerKey = DimCustomer.CustomerKey
where  DimCustomer.CustomerKey = 7665
group by DimCustomer.FirstName, DimProduct.ProductName
order by count(SalesQuantity) desc

/*5. Faça um resumo mostrando o total de produtos comprados (SalesQuantity) de acordo com o sexo dos clientes.*/
select top(2) * from FactOnlineSales
select top(2) * from DimCustomer

select 
	DimCustomer.Gender,
	sum(SalesQuantity)
from FactOnlineSales
	inner join DimCustomer
		on FactOnlineSales.CustomerKey = DimCustomer.CustomerKey
where DimCustomer.Gender is not null
group by DimCustomer.Gender
order by sum(SalesQuantity) desc

/*6. Faça uma tabela resumo mostrando a taxa de câmbio média de acordo com cada CurrencyDescription. A tabela final deve conter apenas taxas entre 10 e 100.*/
select * from DimCurrency
select * from FactExchangeRate

select 
	DimCurrency.CurrencyDescription,
	AVG(AverageRate) as 'Taxa de câmbio média'
from FactExchangeRate
	inner join DimCurrency
		on FactExchangeRate.CurrencyKey = DimCurrency.CurrencyKey
group by DimCurrency.CurrencyDescription
--having AVG(AverageRate) >= 10 and AVG(AverageRate)<= 100
having AVG(AverageRate) between 10 and 100

/*7. Descubra o valor total na tabela FactStragePlan destinado para os cenários: Actual e Budget.*/
select top(2)* from FactStrategyPlan
select * from DimScenario
select * from DimDate

select 
	DimScenario.ScenarioName,
	sum(FactStrategyPlan.Amount) as 'Totoal'
from FactStrategyPlan
	inner join DimScenario
		on FactStrategyPlan.ScenarioKey = DimScenario.ScenarioKey
group by DimScenario.ScenarioName
having ScenarioName <> 'Forecast' -- sinal de diferente

/*8. Faça uma tabela resumo mostrando o resultado do planejamento estratégico agrupado por ano.*/
select top(2) * from DimDate
select top(2) * from FactStrategyPlan

select 
	DimDate.CalendarYear,
	sum(Amount)
from FactStrategyPlan
	inner join DimDate
		on FactStrategyPlan.Datekey = DimDate.Datekey
group by DimDate.CalendarYear

/*9. Faça um agrupamento da quantidade de produtos por ProductSubcategoryName. Leve em consideração em sua análise apenas a marca Contoso e a cor Silver.*/
select * from DimProduct
select * from DimProductSubcategory

select
	DimProductSubcategory.ProductSubcategoryName,
	count(DimProduct.ProductSubcategoryKey) as 'QTD.total product'
from DimProduct
	inner join DimProductSubcategory
		on DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
where BrandName = 'Contoso' and ColorName = 'Silver'
group by DimProductSubcategory.ProductSubcategoryName
order by count(DimProduct.ProductSubcategoryKey) desc

/*10. Faça um agrupamento duplo de quantidade de produtos por BrandName e ProductSubcategoryName. A tabela final deverá ser ordenada de acordo com a coluna BrandName.*/
select * from DimProduct
select * from DimProductSubcategory

select 
	BrandName,
	DimProductSubcategory.ProductSubcategoryName,
	count(ProductName) as 'QTD.total Product'
from DimProduct
	inner join DimProductSubcategory
		on DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
group by BrandName, DimProductSubcategory.ProductSubcategoryName
order by BrandName asc