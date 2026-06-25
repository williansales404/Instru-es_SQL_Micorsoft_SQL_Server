-- Funções de Janela um conjunto de linhas
-- Funções de Agregação: SUM, COUNT, AVG, MIN, MAX  
-- Crie uma coluna contendo a soma total das vendas da tabela Lojas.
use WF

--Partition by vai dizer qual o conjunto de linhas que desejo usar
--A logica para se usar window function e a mesmo para SUM, COUNT, AVG, MIN, MAX
select
	ID_loja,
	Nome_Loja,
	Regiao,
	Qtd_Vendida,
	count(*) over() as 'Total Lojas'
from Lojas
order by ID_loja

select
	ID_loja,
	Nome_Loja,
	Regiao,
	Qtd_Vendida,
	sum(Qtd_Vendida) over(partition by Regiao) as 'Total'
from Lojas
order by ID_loja

select
	ID_loja,
	Nome_Loja,
	Regiao,
	Qtd_Vendida,
	format(avg(Qtd_Vendida) over(partition by Regiao), '0.00') as 'Total'
from Lojas
order by ID_loja