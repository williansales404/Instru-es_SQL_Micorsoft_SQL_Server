-- UPPER ---> Transforma um texto em mai�scula
-- LOWER ---> Transforma um texto em min�scula
-- Fa�a uma consulta � tabela DimCustomer e utilize as fun��es UPPER e LOWER na coluna de FirstName para observar o resultado
select 
	FirstName,
	UPPER(FirstName) as 'NOME',
	LOWER(FirstName) as 'nome',
	EmailAddress
from DimCustomer