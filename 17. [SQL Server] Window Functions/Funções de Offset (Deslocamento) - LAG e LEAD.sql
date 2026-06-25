-- Funções de Janela
-- FUNÇÕES DE OFFSET (Deslocamento): LAG e LEAD
select
	*,
	lag(Faturamento_MM, 4, 0) over(order by Data_Fechamento) as 'Lag',
	lead(Faturamento_MM, 1, 0) over(order by Data_Fechamento) as 'Lead'
from Resultado

