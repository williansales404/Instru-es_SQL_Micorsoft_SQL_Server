-- CONCAT: Permite juntar mais de um texto em uma única palavra
-- Faça uma consulta à tabela DimCustomer onde seja possível visualizar o nome completo de cada cliente

select
	FirstName,
	LastName,
	CONCAT(FirstName,' ',LastName) as 'Nome completo',
	EmailAddress
from DimCustomer