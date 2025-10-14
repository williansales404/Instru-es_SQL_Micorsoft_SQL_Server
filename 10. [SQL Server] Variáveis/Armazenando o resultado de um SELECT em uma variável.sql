/*Armazenando o resultado de um SELECT em uma vari�vel  
Exemplo 1: Crie uma vari�vel para armazenar a quantidade total de funcion�rios da tabela DimEmployee.*/
select * from DimEmployee

declare @totalFun int
select 
	@totalFun = Count(*)
from DimEmployee
where Status = 'Current'
select @totalFun as 'total funcionario'

------------------Solu��o professor
declare @varTotalFun int
set @varTotalFun = (select count(*) from DimEmployee)
select @varTotalFun

----------------------------------------------------------------------
/*Exemplo 2: Crie uma vari�vel para armazenar a quantidade total de lojas com o Status Off.*/

declare @totalLoja int
select 
	@totalLoja = COUNT(*)
from DimStore
where Status = 'Off'
select @totalLoja as 'total loja Off'

---------------------Solu��o Professor
declare @varTotalLoja int
set @varTotalLoja = (select count(*) from DimStore where Status = 'Off')
select @varTotalLoja as 'Total Loja'