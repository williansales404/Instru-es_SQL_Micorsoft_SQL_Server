-- Funções de Janela
-- FUNÇÕES DE OFFSET (Deslocamento): FIRST_VALUE e LAST_VALUE
-- Cálculo MoM
select
	*,
	FIRST_VALUE(Faturamento_MM) over(order by Data_Fechamento) as 'Primeiro Valor',
	LAST_VALUE(Faturamento_MM) over(order by Data_Fechamento rows between unbounded preceding and unbounded following) as 'Ultimo valor'
from Resultado
order by Data_Fechamento