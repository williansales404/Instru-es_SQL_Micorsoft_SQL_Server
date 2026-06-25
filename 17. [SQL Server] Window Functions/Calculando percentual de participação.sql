-- Funções de Janela  
-- CÁLCULO DE PERCENTUAL DO TOTAL  
-- a) Calcule o % de participação de cada loja em relação ao total de vendas de todas as lojas.
select
	* ,
	sum(Qtd_Vendida) over(partition by Regiao) as 'Total por regiao',
	format(Qtd_Vendida / sum(Qtd_Vendida) over(),'0.00%') as '% Por loja'
from Lojas
order by ID_loja

--OBS verificando valor mas não a necessidade
select 4200.00/26480.00 * 100

-- b) Calcule o % de participação de cada loja em relação ao total de vendas de cada região.
select
	ID_loja,
	Nome_Loja,
	Regiao,
	Qtd_Vendida,
	sum(Qtd_Vendida) over() as 'Total',
	format(Qtd_Vendida / sum(Qtd_Vendida) over(partition by Regiao), '0.00%') as '% Por Regiao'
from Lojas
order by ID_loja