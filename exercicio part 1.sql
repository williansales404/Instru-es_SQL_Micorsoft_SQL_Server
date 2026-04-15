/*Para resolver os exercícios 1 a 4, crie uma View chamada vwProdutos, que contenha o 
agrupamento das colunas BrandName, ColorName e os totais de quantidade vendida por 
marca/cor e também o total de receita por marca/cor.*/
/*go
create view vwProdutos as
select
	BrandName,
	ColorName,
	count(*) as 'QTD.vendido',
	round(sum(SalesAmount), 2) as 'ReceitaTotal'
from DimProduct
	inner join FactSales
		on DimProduct.ProductKey = FactSales.ProductKey
group by BrandName, ColorName
go*/

--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*1. Utilize a View vwProdutos para criar uma coluna extra calculando a quantidade total vendida dos produtos.*/
select
	*,
	count(*) over() as 'Tota_UN_Vendido'
from vwProdutos
order by BrandName

/*2. Crie mais uma coluna na consulta anterior, incluindo o total de produtos vendidos para cada marca.*/
select
	*,
	count(*) over() as 'Tota_UN_Vendido',
	count(*) over(partition by BrandName order by BrandName) as 'TotalUN_Por_Marca'
from vwProdutos
order by BrandName

--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*3. Calcule o % de participação do total de vendas de produtos por marca.  
Ex: A marca A. Datum teve uma quantidade total de vendas de 199.041 de um total de 3.406.089 
de vendas. Isso significa que a da marca A. Datum é 199.041/3.406.089 = 5,84%.*/
select
	*,
	sum([QTD.vendido]) over(partition by BrandName) as 'Total_Vendas_Por_Marca',
	sum([QTD.vendido]) over() as 'Total_Venda',
	format(cast(sum([QTD.vendido]) over(partition by BrandName)as float) / cast(sum([QTD.vendido]) over() as float) ,'0.00%') as '%Por_Marca'
from vwProdutos
order by BrandName

--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*4. Crie uma consulta à View vwProdutos, selecionando as colunas Marca, Cor, 
Quantidade_Vendida e também criando uma coluna extra de Rank para descobrir a posição de 
cada Marca/Cor. Você deve obter o resultado abaixo. Obs: Sua consulta deve ser filtrada para 
que seja mostrada apenas a marca Contoso.*/
select
	BrandName,
	ColorName,
	[QTD.vendido],
	rank() over(order by [QTD.vendido] desc) as 'Filtro'
from vwProdutos
where BrandName = 'Contoso'

--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*A sua view deve se chamar vwHistoricoLojas e deve conter um histórico com a quantidade de lojas abertas a cada Ano/Mês. Os desafios são: 
(1) Criar uma coluna de ID para essa View 
(2) Relacionar as tabelas DimDate e DimStore 
Dicas: 
1- A coluna de ID será criada a partir de uma função de janela. Você deverá se atentar a forma como essa coluna deverá ser ordenada, pensando que queremos visualizar uma ordem de Ano/Mês que seja: 2005/january, 2005/February... e não 2005/April, 2005/August... 
2- As colunas Ano, Mês e Qtd_Lojas correspondem, respectivamente, às seguintes colunas: CalendarYear e CalendarMonthLabel da tabela DimDate e uma contagem da coluna OpenDate da tabela DimStore. */
go
create view vwHistoricoLojas as
	with Mes as(
select
	distinct
	CalendarYear,
	CalendarMonth,
	CalendarMonthLabel
from DimDate )

select
	ROW_NUMBER() over(order by m.CalendarYear, m.CalendarMonth) as ID,
	m.CalendarYear as Ano,
	m.CalendarMonthLabel as Mes,
	count(s.StoreKey) as QTD_loja
from Mes m
	left join DimDate d
		on d.CalendarYear = m.CalendarYear and d.CalendarMonth = m.CalendarMonth
	left join DimStore s
		on cast(s.OpenDate as Date) = cast(d.FullDateLabel as Date)
	group by m.CalendarYear, m.CalendarMonth, m.CalendarMonthLabel
	--order by m.CalendarYear asc, m.CalendarMonth asc
go

--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*5. A partir da view criada no exercício anterior, você deverá fazer uma soma móvel considerando sempre o mês atual + 2 meses para trás.*/
select * from vwHistoricoLojas

select
	*,
	sum(QTD_loja) over(order by Ano rows between 2 preceding and current row) as 'Soma_Movel'
from vwHistoricoLojas

--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*6. Utilize a vwHistoricoLojas para calcular o acumulado de lojas abertas a cada ano/mês. Exercício Desafio 2*/
select 
	*,
	sum(QTD_loja) over(order by Ano rows between unbounded preceding and current row) as Acumalado
from vwHistoricoLojas

--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
select * from DimCustomer

select
DateFirstPurchase,
case
	when MONTH(DateFirstPurchase) = 1 then 'Janeiro'
end as T,
case
	when MONTH(DateFirstPurchase) = 1 then cast(DateFirstPurchase as date)
end as D
from DimCustomer
where CustomerType = 'Person'
order by MONTH(DateFirstPurchase), DAY(DateFirstPurchase)





