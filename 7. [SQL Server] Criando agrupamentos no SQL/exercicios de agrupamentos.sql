/*M�DULO 6: EXERC�CIOS 
Os exerc�cios abaixo est�o divididos de acordo com uma determinada tabela do Banco de Dados. 
FACTSALES 
1. a) Fa�a um resumo da quantidade vendida (SalesQuantity) de acordo com o canal de vendas 
(channelkey). 
b) Fa�a um agrupamento mostrando a quantidade total vendida (SalesQuantity) e quantidade 
total devolvida (Return Quantity) de acordo com o ID das lojas (StoreKey). 
c) Fa�a um resumo do valor total vendido (SalesAmount) para cada canal de venda, mas apenas 
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

/*2. Voc� precisa fazer uma an�lise de vendas por produtos. O objetivo final � descobrir o valor 
total vendido (SalesAmount) por produto (ProductKey). 
a) A tabela final dever� estar ordenada de acordo com a quantidade vendida e, al�m disso, 
mostrar apenas os produtos que tiveram um resultado final de vendas maior do que 
$5.000.000. 
b) Fa�a uma adapta��o no exerc�cio anterior e mostre os Top 10 produtos com mais vendas. 
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

/*3. a) Voc� deve fazer uma consulta � tabela FactOnlineSales e descobrir qual � o ID 
(CustomerKey) do cliente que mais realizou compras online (de acordo com a coluna 
SalesQuantity).
b) Feito isso, fa�a um agrupamento de total vendido (SalesQuantity) por ID do produto 
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

/*4. a) Fa�a um agrupamento e descubra a quantidade total de produtos por marca. 
b) Determine a m�dia do pre�o unit�rio (UnitPrice) para cada ClassName.
c) Fa�a um agrupamento de cores e descubra o peso total que cada cor de produto possui.*/
select * from DimProduct

select BrandName, count(*) as 'QTD total Produtos'from DimProduct
group by BrandName

select ClassName, avg(UnitPrice) as 'Pre�o Unitario' from DimProduct
group by ClassName
order by avg(UnitPrice) asc

select ColorName, sum(Weight) as 'Peso'from DimProduct
group by ColorName
order by sum(Weight)

/*5. Voc� dever� descobrir o peso total para cada tipo de produto (StockTypeName).  
A tabela final deve considerar apenas a marca �Contoso� e ter os seus valores classificados em 
ordem decrescente.*/
select StockTypeName, sum(Weight) as 'Peso' from  DimProduct
where BrandName = 'Contoso'
group by StockTypeName
order by sum(Weight) desc

/*6. Voc� seria capaz de confirmar se todas as marcas dos produtos possuem � disposi��o todas as 
16 op��es de cores? */
select * from DimProduct

--select count( distinct ColorName) from DimProduct

select BrandName, count( distinct ColorName) from DimProduct
group by BrandName

/*7. Fa�a um agrupamento para saber o total de clientes de acordo com o Sexo e tamb�m a m�dia 
salarial de acordo com o Sexo. Corrija qualquer resultado �inesperado� com os seus 
conhecimentos em SQL. */ 
select * from DimCustomer

select Gender as 'Sexo', count(Gender) as 'Total Fun por sexo', avg(YearlyIncome) from DimCustomer
where Gender is not null
group by Gender
order by avg(YearlyIncome) desc

/*8. Fa�a um agrupamento para descobrir a quantidade total de clientes e a m�dia salarial de 
acordo com o seu n�vel escolar. Utilize a coluna Education da tabela DimCustomer para fazer 
esse agrupamento.*/
select * from DimCustomer

select count(*) as 'Total clientes' from DimCustomer

select 
	Education as 'Gradua��o',
	count(Education) as 'QTD.total',
	avg(YearlyIncome) as 'media salarial'
from DimCustomer
where Education is not null
group by Education
order by count(Education)desc

/*DIMEMPLOYEE 9. Fa�a uma tabela resumo mostrando a quantidade total de funcion�rios de acordo com o 
Departamento (DepartmentName). Importante: Voc� dever� considerar apenas os 
funcion�rios ativos. */
select * from DimEmployee

select 
	DepartmentName, 
	count(DepartmentName) as 'total fun por depart' 
from DimEmployee
--where Status = 'Current'
where EndDate is null
group by DepartmentName
order by count(Status)

/*10. Fa�a uma tabela resumo mostrando o total de VacationHours para cada cargo (Title). Voc� 
deve considerar apenas as mulheres, dos departamentos de Production, Marketing, 
Engineering e Finance, para os funcion�rios contratados entre os anos de 1999 e 2000.*/

select * from DimEmployee

select 
	Title, 
	sum(VacationHours) from DimEmployee
where 
	Gender = 'F' 
	and DepartmentName in('Production', 'Marketing', 'Engineering', 'Finance')
	and HireDate between '1999-01-01' and '2000-12-31'
group by Title