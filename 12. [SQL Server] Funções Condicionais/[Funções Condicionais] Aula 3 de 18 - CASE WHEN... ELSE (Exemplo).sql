-- Faça um SELECT das colunas CustomerKey, FirstName e Gender na tabela DimCustomer e utilize o CASE para criar uma 4ª coluna com a informação de 'Masculino' ou 'Feminino'.

select
	CustomerKey,
	FirstName,
	Gender,
	case
		when Gender = 'M' then 'Masculino'
		else 'Feminino'
	end
from
	DimCustomer