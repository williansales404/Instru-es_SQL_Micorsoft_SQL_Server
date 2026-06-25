-- Funções de Janela
-- FUNÇÕES DE OFFSET (Deslocamento): LAG e LEAD
-- Cálculo MoM
select
	*,
	lag(Faturamento_MM, 1, 0) over(order by Data_Fechamento) as 'Lag',
	--Calcular Crescimento ou decrecimento mensal
	format(Faturamento_MM/lag(Faturamento_MM, 1) over(order by Data_Fechamento) -1, '0.00%') as 'MoM'
from Resultado

--solução alternativa
select
	*,
	lag(Faturamento_MM, 1, 0) over(order by Data_Fechamento) as 'Lag',
	--Calcular Crescimento ou decrecimento mensal
	format(Faturamento_MM/NULLIF(lag(Faturamento_MM, 1, 0) over(order by Data_Fechamento), 0) -1, '0.00%') as 'MoM'
from Resultado

--Se nullif retor dois valores diferentes retorna primeiro valor, caso contrario os dois valores for iguais retorna Null
select nullif(4, 0)