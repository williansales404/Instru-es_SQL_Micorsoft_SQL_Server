-- UPPER ---> Transforma um texto em maiúscula
-- LOWER ---> Transforma um texto em minúscula
-- Faça uma consulta à tabela DimCustomer e utilize as funções UPPER e LOWER na coluna de FirstName para observar o resultado
select 
	FirstName,
	UPPER(FirstName) as 'NOME',
	LOWER(FirstName) as 'nome',
	EmailAddress
from DimCustomer