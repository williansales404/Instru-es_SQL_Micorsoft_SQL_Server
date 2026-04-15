-- Funções de Janela
-- Cálculo de soma móvel e média móvel

--soma móvel
select
	*,
	SUM(Faturamento_MM) over(order by Data_Fechamento rows between 2 preceding and current row) as 'Soma movel'
from Resultado

