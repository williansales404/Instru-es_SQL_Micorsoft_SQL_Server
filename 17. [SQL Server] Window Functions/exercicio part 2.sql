
declare @anoInicial int = year((select MIN(DateFirstPurchase) from ContosoRetailDW.dbo.DimCustomer))
declare @anoFinal int = year((select MAX(DateFirstPurchase) from ContosoRetailDW.dbo.DimCustomer))

declare @dataInicial date = DATEFROMPARTS(@anoInicial, 1, 1)
declare @datafinal date = DATEFROMPARTS(@anoFinal, 12, 31)


/*create table Calendario (
	data Date
)*/

while @dataInicial <= @datafinal
	begin
		insert into Calendario(data) values(@dataInicial)
		set @dataInicial = dateadd(day, 1, @dataInicial)
	end

alter table Calendario
add
	Ano int,
	Mes int,
	Dia int,
	AnoMes int,
	NomeMes varchar(20)

--sem o filtro where o comando update atualiza todas as linhas,  linha por linha internamente
update Calendario SET Ano = YEAR(data)
update Calendario set Mes = MONTH(data)
update Calendario set Dia = DAY(data)
update Calendario set AnoMes = CONCAT(YEAR(data), FORMAT(Month(data), '00'))
update Calendario set NomeMes = 
	case
		when MONTH(data) = 1 then 'Janeiro'
		when MONTH(data) = 2 then 'Fevereiro'
		when MONTH(data) = 3 then 'Março'
		when MONTH(data) = 4 then 'Abril'
		when MONTH(data) = 5 then 'Maio'
		when MONTH(data) = 6 then 'Junho'
		when MONTH(data) = 7 then 'Julho'
		when MONTH(data) = 8 then 'Agosto'
		when MONTH(data) = 9 then 'Setembro'
		when MONTH(data) = 10 then 'Outubro'
		when MONTH(data) = 11 then 'Novembro'
		when MONTH(data) = 12 then 'Dezembro'
	end

select * from Calendario
select * from ContosoRetailDW.dbo.DimCustomer

/*go
create view  vwNovosClientes as
select
	 ROW_NUMBER() over(order by AnoMes) as 'ID',
	 Ano,
	 NomeMes,
	 COUNT(DateFirstPurchase) as 'Novos Clientes'
from Calendario
	left join ContosoRetailDW.dbo.DimCustomer
	on Calendario.data = DimCustomer.DateFirstPurchase
group by Ano, NomeMes, AnoMes
go*/

select * from vwNovosClientes

select
	*,
	SUM([Novos Clientes]) over(order by ID rows between 1 preceding and current row) as 'Soma Movel',
	AVG([Novos Clientes]) over(order by ID rows between 1 preceding and current row) as 'Media Movel',
	SUM([Novos Clientes]) over(order by ID rows between unbounded preceding and current row) as 'Acumulado',
	SUM([Novos Clientes]) over(partition by Ano order by ID rows between unbounded preceding and current row) as 'Acumulado Por Ano'
from vwNovosClientes]

select
	*,
	FORMAT(1.0 * [Novos Clientes]/nullif(LAG([Novos Clientes], 1) over(order by ID), 0)  -1, '0.00%') as 'MoM',
	FORMAT(1.0 * [Novos Clientes] / nullif(LAG([Novos Clientes], 12) over(order by ID), 0)  -1, '0.00%') as 'YoY'
from vwNovosClientes