-- Funções de Janela
-- Funções de Classificação: ROW_NUMBER, RANK, DENSE_RANK, NTILE

select
	*,
	row_number() over(order by Qtd_Vendida desc) as 'rownumber', --não reconhe empate
	RANK() over(order by Qtd_Vendida desc) as 'rank', -- reconhe empates
	DENSE_RANK() over(order by Qtd_Vendida desc) as 'dense', -- considera o empate mas continua de onde para a clasificação
	NTILE(2) over(order by Qtd_vendida desc) as 'ntile' --exige um argumento inteiro para fazer a divisão em grupos
from Lojas

--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
-- Funções de Janela
-- Usando PARTITION BY
select
	*,
	row_number() over(PARTITION BY Regiao order by Qtd_Vendida desc) as 'rownumber', --não reconhe empate
	RANK() over(PARTITION BY Regiao order by Qtd_Vendida desc) as 'rank', -- reconhe empates
	DENSE_RANK() over(PARTITION BY Regiao order by Qtd_Vendida desc) as 'dense', -- considera o empate mas continua de onde para a clasificação
	NTILE(3) over(PARTITION BY Regiao order by Qtd_vendida desc) as 'ntile' --exige um argumento inteiro para fazer a divisão em grupos
from Lojas
order by ID_loja