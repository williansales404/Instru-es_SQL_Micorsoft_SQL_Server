--DATEADD: Adiciona ou subtrai uma determinada quantidade de dias, meses ou anos a uma data
--DATEDIFF: Calcula a diferença entre duas datas

declare @date1 datetime, @date2 datetime, @date3 datetime
set @date1 = '01/01/2018'
set @date2 = '01/02/2018'
set @date3 = '31/12/2018'

select
	DATEADD(DAY, 30, @date1) as 'DATEADD',
	DATEADD(DAY, -30, @date1) as 'DATEADD', -- soma ou subtrai as datas em dia, ano, mes entre outros
	DATEDIFF(DAY, @date1, @date2) as 'DATEDIFF', --calcula a diferença entre duas datas ano, dia, mes entre outros
	DATEDIFF(MONTH, @date1, @date3) as 'DATEDIFF'
