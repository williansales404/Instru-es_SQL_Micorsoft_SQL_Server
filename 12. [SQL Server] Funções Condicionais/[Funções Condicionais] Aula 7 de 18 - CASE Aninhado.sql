-- CASE Aninhado
-- DimEmployee
SELECT * FROM DimEmployee

-- 4 Cargos (Title):
-- Sales Group Manager
-- Sales Region Manager
-- Sales State Manager
-- Sales Store Manager

-- Assalariado (SalariedFlag)?
-- SalariedFlag = 0: não é assalariado
-- SalariedFlag = 1: é assalariado

-- Situação: Cálculo do bônus
-- Sales Group Manager: Se for assalariado, 30%; Se não, 20%.
-- Sales Region Manager: 15%
-- Sales State Manager: 7%
-- Sales Store Manager: 2%

select 
	FirstName,
	Title,
	SalariedFlag,
	case
		when Title = 'Sales Group Manager' then
			case
				when SalariedFlag = 1 then 0.30
				else 0.20
			end
		when Title = 'Sales Region Manager' then 0.15
		when Title = 'Sales State Manager' then 0.07
		else 0.02
	end as 'Bonus'
from DimEmployee
