-- LEN e DATALENGTH: Retorna a quantidade de caracteres de uma palavra
-- Descubra a quantidade de caracteres da palavra 'SQL Hashtag'

select 
	LEN('SQL Hashtag   '), --Não considera espaço para contar o tamaho
	DATALENGTH('SQL Hashtag   ') --considera espaço para contar o tamanho

declare @x int =  LEN('SQL Hashtag   ')
select @x