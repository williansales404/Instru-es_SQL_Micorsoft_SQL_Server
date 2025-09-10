/*MÓDULO 6: EXERCÍCIOS 
Os exercícios abaixo estão divididos de acordo com uma determinada tabela do Banco de Dados. 
FACTSALES 
1. a) Faça um resumo da quantidade vendida (SalesQuantity) de acordo com o canal de vendas 
(channelkey). 
b) Faça um agrupamento mostrando a quantidade total vendida (SalesQuantity) e quantidade 
total devolvida (Return Quantity) de acordo com o ID das lojas (StoreKey). 
c) Faça um resumo do valor total vendido (SalesAmount) para cada canal de venda, mas apenas 
para o ano de 2007.*/
select top(5) * from FactSales

select 
	channelKey,
	sum(SalesQuantity) as  'QDT vendidas'
from FactSales
group by channelKey

select 
	StoreKey as 'Id loja',
	sum(SalesQuantity) as 'QTD.vendido',
	sum(ReturnQuantity) as 'QTD.devolvido' 
from FactSales
group by StoreKey

select
	channelKey,
	sum(SalesAmount) as 'Valor total vendido'
from FactSales
--where DateKey like '%2007%'
where DateKey between '20070101' and '20071231'
group by channelKey

/*2. Você precisa fazer uma análise de vendas por produtos. O objetivo final é descobrir o valor 
total vendido (SalesAmount) por produto (ProductKey). 
a) A tabela final deverá estar ordenada de acordo com a quantidade vendida e, além disso, 
mostrar apenas os produtos que tiveram um resultado final de vendas maior do que 
$5.000.000. 
b) Faça uma adaptação no exercício anterior e mostre os Top 10 produtos com mais vendas. 
Desconsidere o filtro de $5.000.000 aplicado. 
FACTONLINESALES*/
select top(5) * from FactSales

select 
	ProductKey, 
	sum(SalesAmount) as 'Valor total vendido' 
from FactSales
group by ProductKey
having sum(SalesAmount) >= 5000000
order by sum(SalesAmount) desc

select TOP(10) 
	ProductKey, 
	sum(SalesAmount) as 'Valor total vendido' 
from FactSales
group by ProductKey
order by sum(SalesAmount) DESC

/*3. a) Você deve fazer uma consulta à tabela FactOnlineSales e descobrir qual é o ID 
(CustomerKey) do cliente que mais realizou compras online (de acordo com a coluna 
SalesQuantity).
b) Feito isso, faça um agrupamento de total vendido (SalesQuantity) por ID do produto 
e descubra quais foram os top 3 produtos mais comprados pelo cliente da letra a). 
DIMPRODUCT*/
select top(10) * from FactOnlineSales

select CustomerKey, 
	sum(SalesQuantity) as 'Total Vendido' 
from FactOnlineSales
group by CustomerKey
order by sum(SalesQuantity) desc

--19037
select top(3) ProductKey, 
	sum(SalesQuantity) as 'total vendido'
from FactOnlineSales
where CustomerKey = 19037
group by ProductKey
order by sum(SalesQuantity) desc

/*4. a) Faça um agrupamento e descubra a quantidade total de produtos por marca. 
b) Determine a média do preço unitário (UnitPrice) para cada ClassName.
c) Faça um agrupamento de cores e descubra o peso total que cada cor de produto possui.*/
select * from DimProduct

select BrandName, count(*) as 'QTD total Produtos'from DimProduct
group by BrandName

select ClassName, avg(UnitPrice) as 'Preço Unitario' from DimProduct
group by ClassName
order by avg(UnitPrice) asc

select ColorName, sum(Weight) as 'Peso'from DimProduct
group by ColorName
order by sum(Weight)

/*5. Você deverá descobrir o peso total para cada tipo de produto (StockTypeName).  
A tabela final deve considerar apenas a marca ‘Contoso’ e ter os seus valores classificados em 
ordem decrescente.*/
select StockTypeName, sum(Weight) as 'Peso' from  DimProduct
where BrandName = 'Contoso'
group by StockTypeName
order by sum(Weight) desc

/*6. Você seria capaz de confirmar se todas as marcas dos produtos possuem à disposição todas as 
16 opções de cores? */
select * from DimProduct

--select count( distinct ColorName) from DimProduct

select BrandName, count( distinct ColorName) from DimProduct
group by BrandName

/*7. Faça um agrupamento para saber o total de clientes de acordo com o Sexo e também a média 
salarial de acordo com o Sexo. Corrija qualquer resultado “inesperado” com os seus 
conhecimentos em SQL. */ 
select * from DimCustomer

select Gender as 'Sexo', count(Gender) as 'Total Fun por sexo', avg(YearlyIncome) from DimCustomer
where Gender is not null
group by Gender
order by avg(YearlyIncome) desc

/*8. Faça um agrupamento para descobrir a quantidade total de clientes e a média salarial de 
acordo com o seu nível escolar. Utilize a coluna Education da tabela DimCustomer para fazer 
esse agrupamento.*/
select * from DimCustomer

select count(*) as 'Total clientes' from DimCustomer

select 
	Education as 'Graduação',
	count(Education) as 'QTD.total',
	avg(YearlyIncome) as 'media salarial'
from DimCustomer
where Education is not null
group by Education
order by count(Education)desc

/*DIMEMPLOYEE 9. Faça uma tabela resumo mostrando a quantidade total de funcionários de acordo com o 
Departamento (DepartmentName). Importante: Você deverá considerar apenas os 
funcionários ativos. */
select * from DimEmployee

select 
	DepartmentName, 
	count(DepartmentName) as 'total fun por depart' 
from DimEmployee
--where Status = 'Current'
where EndDate is null
group by DepartmentName
order by count(Status)

/*10. Faça uma tabela resumo mostrando o total de VacationHours para cada cargo (Title). Você 
deve considerar apenas as mulheres, dos departamentos de Production, Marketing, 
Engineering e Finance, para os funcionários contratados entre os anos de 1999 e 2000.*/

select * from DimEmployee

select 
	Title, 
	sum(VacationHours) from DimEmployee
where 
	Gender = 'F' 
	and DepartmentName in('Production', 'Marketing', 'Engineering', 'Finance')
	and HireDate between '1999-01-01' and '2000-12-31'
group by Title