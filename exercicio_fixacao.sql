--MÓDULO 10: EXERCÍCIOS 
/*1. Quando estamos manipulando tabelas, é importante pensar em como os dados serão apresentados em um relatório. Imagine os nomes dos produtos da tabela DimProduct. Os textos são bem grandes e pode ser que mostrar os nomes completos dos produtos não seja a opção mais interessante, pois provavelmente não vão caber em um gráfico e a visualização ficará ruim.*/
/*a) Seu gestor te pede para listar todos os produtos para que seja criado um gráfico para ser apresentado na reunião diária de equipe. Faça uma consulta à tabela DimProduct que retorne (1) o nome do produto e (2) a quantidade de caracteres que cada produto tem, e ordene essa tabela do produto com a maior quantidade de caracteres para a menor.*/
select * from DimProduct

select
	distinct ProductName,
	DATALENGTH(ProductName) as 'QTD.caracteres'
from DimProduct
group by ProductName
order by DATALENGTH(ProductName) desc

/*b) Qual é a média de caracteres dos nomes dos produtos?*/
select
	distinct ProductName,
	DATALENGTH(ProductName) as 'QTD.caracteres',
	AVG(DATALENGTH(ProductName)) as 'Media'
from DimProduct
group by ProductName
order by DATALENGTH(ProductName) desc

/*c) Analise a estrutura dos nomes dos produtos e verifique se seria possível reduzir o tamanho
do nome dos produtos. (Dica: existem informações redundantes nos nomes dos produtos? Seria possível substituí-las?)*/

declare @index int, @SubCarater varchar(100), @novoName varchar(100)

select
	ProductName = STUFF(ProductName, 1, 100, left(ProductName, CHARINDEX(' ', ProductName, (CHARINDEX(' ', ProductName)+1)))),
	STUFF(ProductName, 1, 100, left(ProductName, CHARINDEX(' ', ProductName, (CHARINDEX(' ', ProductName)+1)))) as 'Substituição'
from DimProduct

select
	ProductName,
	STUFF(ProductName, 1, 100, @SubCarater)
from DimProduct

/*d) Qual é a média de caracteres nesse novo cenário?*/

select
	ProductName,
	STUFF(ProductName, 1, 100, @SubCarater)
from DimProduct