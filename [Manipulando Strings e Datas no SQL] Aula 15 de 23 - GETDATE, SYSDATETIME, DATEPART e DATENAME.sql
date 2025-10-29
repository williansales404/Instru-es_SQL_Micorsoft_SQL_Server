--GETDATE: Retorna a data/hora atual do sistema
--SYSDATETIME: Retorna a data/hora atual do sistema (mais preciso que o GETDATE)
--DATENAME e DATEPART: Retornam informações (dia, mês, ano, semana, etc) de uma data.

select 
	GETDATE() as 'Data hora atual',
	SYSDATETIME() as 'Data hora atual detalhada'

declare @date datetime
set @date = GETDATE()

--DATENAME
select 
	DATENAME(DAY, @date) as 'dia',
	DATENAME(MONTH, @date) as 'mes',
	DATENAME(YEAR, @date) as 'ano'

--DATEPART
select 
	DATEPART(DAY, @date) as 'dia',
	DATEPART(MONTH, @date) as 'mes',
	DATEPART(YEAR, @date) as 'ano'

select 
	SQL_VARIANT_PROPERTY(DATENAME(DAY, @date), 'BaseType') as 'Tipo de DATENAME', --retorna texto
	SQL_VARIANT_PROPERTY(DATEPART(DAY, @date), 'BaseType') as 'tipo de DATEPART' --retorna inteiro
