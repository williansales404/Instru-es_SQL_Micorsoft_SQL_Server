-- Fun��es para retirar espa�os adicionais dentro de um texto
-- TRIM: Retira espa�os adicionais � esquerda e � direita do texto 
-- LTRIM: Retira espa�os adicionais � esquerda do texto 
-- RTRIM: Retira espa�os adicionais � direita do texto

-- Utilize as fun��es acima no c�digo ' ABC123 '
declare @codigo varchar(50)
set @codigo = ' ABC123 '

select 
	TRIM(@codigo) as 'Trim',
	LTRIM(@codigo) as 'Ltrim',
	RTRIM(@codigo) as 'Rtrim'

select 
	DATALENGTH(TRIM(@codigo)) as 'Trim',
	DATALENGTH(LTRIM(@codigo)) as 'Ltrim',
	DATALENGTH(RTRIM(@codigo)) as 'Rtrim'