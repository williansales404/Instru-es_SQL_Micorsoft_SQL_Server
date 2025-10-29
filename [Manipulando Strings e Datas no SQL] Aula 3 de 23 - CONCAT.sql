-- CONCAT: Permite juntar mais de um texto em uma �nica palavra
-- Fa�a uma consulta � tabela DimCustomer onde seja poss�vel visualizar o nome completo de cada cliente

select
	FirstName,
	LastName,
	CONCAT(FirstName,' ',LastName) as 'Nome completo',
	EmailAddress
from DimCustomer