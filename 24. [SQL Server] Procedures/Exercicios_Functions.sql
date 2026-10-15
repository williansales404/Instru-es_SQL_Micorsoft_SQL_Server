/*Todas as functions dos exercícios a seguir devem ser criadas para manipulação de dados do 
banco de dados ContosoRetailDW.*/
/*1. Crie uma Function que calcule o tempo (em anos) entre duas datas. Essa function deve 
receber dois argumentos: data_inicial e data_final. Caso a data_final não seja informada, a 
function deve automaticamente considerar a data atual do sistema. Essa function será usada 
para calcular o tempo de casa de cada funcionário.
Obs: a função DATEDIFF não é suficiente para resolver este problema.*/
select
	CONCAT(FirstName,' ',LastName) as 'Nome Completo',
	[dbo].[fnAniversarioDeEmpresa_v001](StartDate, EndDate) as 'Tempo De Casa'
from DimEmployee


create or alter function fnAniversarioDeEmpresa (@dataInicial as date, @dataFinal as date)
returns int
as
begin
	return(
		case
		when @dataFinal is null 
		then
			DATEDIFF(YEAR, @dataInicial, GETDATE())
				-
			case
				when DATEADD(YEAR,DATEDIFF(YEAR, @dataInicial, GETDATE()),@dataInicial) > GETDATE()
					then 1
					else 0
			end
			else
				DATEDIFF(YEAR, @dataInicial, @dataFinal)
					-
				case
					when DATEADD(YEAR,DATEDIFF(YEAR, @dataInicial, @dataFinal),@dataInicial) > @dataFinal
					then 1
					else 0
				end
	end
		)
end
go

--Mesma Função usando If
create or alter function fnAniversarioDeEmpresa_v001(@dataInicial as Date, @dataFinal as Date)
returns int
as
begin
	Declare @tempoDeCasa int
	if @dataFinal is null
		set @tempoDeCasa = (DATEDIFF(YEAR, @dataInicial, GETDATE())
								-
							case
								when DATEADD(YEAR,DATEDIFF(YEAR, @dataInicial, GETDATE()),@dataInicial) > GETDATE()
									then 1
									else 0
							end)
	else
		set @tempoDeCasa = (DATEDIFF(YEAR, @dataInicial, @dataFinal)
								-
							case
								when DATEADD(YEAR,DATEDIFF(YEAR, @dataInicial, @dataFinal),@dataInicial) > @dataFinal
								then 1
								else 0
							end)
	return @tempoDeCasa
end


--//////////////////////////////////////////////////////////////////////////////////////////////////
/*2. Crie uma function que calcula a bonificação de cada funcionário (5% a mais em relação ao 
BaseRate). Porém, tome cuidado! Nem todos os funcionários deverão receber bônus...*/
select * from DimEmployee

select
	CONCAT(FirstName,' ',LastName) as 'Nome Compelto',
	concat('R$ ',[dbo].[fnBonusFuncionarios](Status, BaseRate, 5)) as 'Bonus'
from DimEmployee

--Função criada Passar valor inteiro
create or alter function fnBonusFuncionarios(@Status varchar(50), @BaseRate decimal(18,2), @Porcentagem decimal(5,4))
returns decimal(5,4)
as
begin
	declare @bonus decimal(5,4)
	if @Status = 'Current'
		set @bonus = @BaseRate * (@Porcentagem / 100.00)
	else
		set @bonus = 0
	return @bonus
end

--//////////////////////////////////////////////////////////////////////////////////////////////////
/*3. Crie uma Function que retorna uma tabela. Esta function deve receber como parâmetro o 
gênero do cliente e retornar todos os clientes que são do gênero informado na function. 
Observe que esta function será utilizada particularmente com a tabela DimCustomer.*/
--Observação importante para retorna um select em function não usa se begin/end
select * from [dbo].[fnGeneroCliente]('m')

create or alter function fnGeneroCliente(@genero char(1))
returns table
as
	return(
		select
			CONCAT(FirstName,' ',LastName) as [Nome Completo],
			Gender as 'Genero'
		from DimCustomer
		where Gender = upper(@genero)
		)

--//////////////////////////////////////////////////////////////////////////////////////////////////
/* 4. Crie uma Function que retorna uma tabela resumo com o total de produtos por cores. Sua 
function deve receber 1 argumento, onde será possível especificar de qual marca você deseja o 
resumo.*/
select * from DimProduct
select * from [dbo].[fnTotalProdutoPorCor]('Contoso')

create or alter function fnTotalProdutoPorCor(@Marca varchar(250))
returns table
as
return(
	select
	ColorName as 'Cor',
	count(*) as [Total Por Cor]
from DimProduct
where BrandName = @Marca
group by ColorName
)

SELECT
    ColorName,
    COUNT(*) Total
FROM DimProduct
WHERE BrandName = 'Contoso'
GROUP BY ColorName
ORDER BY ColorName;
