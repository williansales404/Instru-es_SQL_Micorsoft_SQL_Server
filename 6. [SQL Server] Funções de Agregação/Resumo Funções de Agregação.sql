--Função sum função de agregação
select top(100) * from FactSales

select 
	sum(SalesQuantity) as 'Total Vendidio',
	sum(ReturnQuantity) as 'Devolução'
from FactSales

------------------------------------------------------------------
--Função count
--cuidado para se ter com a função count em um unica coluna pois count não faz contagem de NULL
select * from DimProduct

select count(Size) from DimProduct --count de linhas com erro pois ignoro NULL

select count(*) as  'Total linhas da tabela' from DimProduct

select count(ProductName) From DimProduct

------------------------------------------------------------------
--função count+distinct
select * from DimProduct

--select count(distinct colorname) from DimProduct

select count(distinct BrandName) from DimProduct

------------------------------------------------------------------
--função min e max
select * from DimProduct

select 
	max(UnitCost) as 'Custo Maximo', 
	min(UnitCost) as 'Custo Minimo' 
from DimProduct

------------------------------------------------------------------
--função vga calcula a media de uma coluna
select * from DimCustomer

select avg(YearlyIncome) from DimCustomer