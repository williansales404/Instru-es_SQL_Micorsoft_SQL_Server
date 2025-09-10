--Fun��o sum fun��o de agrega��o
select top(100) * from FactSales

select 
	sum(SalesQuantity) as 'Total Vendidio',
	sum(ReturnQuantity) as 'Devolu��o'
from FactSales

------------------------------------------------------------------
--Fun��o count
--cuidado para se ter com a fun��o count em um unica coluna pois count n�o faz contagem de NULL
select * from DimProduct

select count(Size) from DimProduct --count de linhas com erro pois ignoro NULL

select count(*) as  'Total linhas da tabela' from DimProduct

select count(ProductName) From DimProduct

------------------------------------------------------------------
--fun��o count+distinct
select * from DimProduct

--select count(distinct colorname) from DimProduct

select count(distinct BrandName) from DimProduct

------------------------------------------------------------------
--fun��o min e max
select * from DimProduct

select 
	max(UnitCost) as 'Custo Maximo', 
	min(UnitCost) as 'Custo Minimo' 
from DimProduct

------------------------------------------------------------------
--fun��o vga calcula a media de uma coluna
select * from DimCustomer

select avg(YearlyIncome) from DimCustomer