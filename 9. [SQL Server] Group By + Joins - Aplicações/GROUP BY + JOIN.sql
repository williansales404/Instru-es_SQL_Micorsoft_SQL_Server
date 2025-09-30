--GROUP BY + JOIN
--1.a) Crie um agrupamento mostrando o total de vendas (SalesQuantity) por ano (CalendarYear).
--2.b) Considere apenas o mês (CalendarMonthLabel) de 'January'.
--3.c) Na tabela resultante, mostre apenas os anos com um total de vendas maior ou igual a de 1200000..

select top(100) * from FactSales
select * from DimDate

select 
	DimDate.CalendarYear,
	sum(SalesQuantity)
from FactSales
	inner join DimDate
		on FactSales.DateKey = DimDate.Datekey
where DimDate.CalendarMonthLabel = 'January'
group by DimDate.CalendarYear
having sum(SalesQuantity) >= 1200000

select
	CalendarYear,
	SalesQuantity
from FactSales
	inner join DimDate
	 on FactSales.DateKey = DimDate.Datekey

