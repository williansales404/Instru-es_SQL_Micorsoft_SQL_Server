-- Funções de Janela
-- Funções de Classificação: Ranking com GROUP BY
-- Crie uma tabela com o total de vendas por região e adicione uma coluna de ranking a essa tabela
select
	Regiao,
	sum(Qtd_Vendida) as 'Total Por Regiao',
	RANK() OVER(order by sum(Qtd_Vendida) desc) as 'Ranking'
from Lojas
group by Regiao
order by [Total Por Regiao] desc