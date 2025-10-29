-- Utilize as funções DAY, MONTH e YEAR para descobrir o dia, mês e ano da data: 18/05/2020
	
	declare @date datetime
	set @date = '18/05/2020'

	select 
		DAY(@date) as 'Dia',
		MONTH(@date) as 'Mês',
		YEAR(@date) as 'Ano'

-- Utilize a função DATEFROMPARTS para obter uma data a partir das informações de dia, mês e ano

declare @dia int , @mes int , @ano int
set @dia = 12
set @mes = 01
set @ano = 2024

select 
	DATEFROMPARTS(@ano, @mes, @dia) as 'DATEFROMPARTS',
	FORMAT(DATEFROMPARTS(@ano, @mes, @dia), 'dd/MM/yyyy') as 'Date formatada' -- testando para ver se formatava