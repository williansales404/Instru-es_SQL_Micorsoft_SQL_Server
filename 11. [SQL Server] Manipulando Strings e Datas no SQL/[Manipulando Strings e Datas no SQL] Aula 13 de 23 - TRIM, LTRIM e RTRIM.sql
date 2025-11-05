-- Funções para retirar espaços adicionais dentro de um texto
-- TRIM: Retira espaços adicionais à esquerda e à direita do texto 
-- LTRIM: Retira espaços adicionais à esquerda do texto 
-- RTRIM: Retira espaços adicionais à direita do texto

-- Utilize as funções acima no código ' ABC123 '
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