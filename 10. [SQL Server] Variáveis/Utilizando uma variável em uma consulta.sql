-- Utilizando uma variável em uma consulta (Exemplos)  
-- Exemplo 1: Aplique um desconto de 10% em todos os preços dos produtos. 
--Sua consulta final deve conter as colunas ProductKey, ProductName, UnitPrice e Preço com Desconto.
select * from DimProduct

declare @desconto float
set @desconto = 0.10
select 
	ProductKey as 'id',
	ProductName as 'Nome',
	UnitPrice as 'Preço',
	--UnitPrice - (@desconto * UnitPrice) as 'Preço com desconto'
	UnitPrice * (1 - @desconto) as 'Preço com desconto'
from DimProduct

------------------------------------------------------------------
-- Utilizando uma variável em uma consulta (Exemplo 2)  
-- Crie uma variável de data para otimizar a consulta abaixo.
select * from DimCustomer
select * from DimEmployee

declare @data datetime
set @data = '01/01/1980'

SELECT
    FirstName AS 'Nome',
    LastName AS 'Sobrenome',
    BirthDate AS 'Nascimento',
    'Cliente' AS 'Tipo'
FROM
    DimCustomer
WHERE BirthDate >= @data

UNION

SELECT
    FirstName AS 'Nome',
    LastName AS 'Sobrenome',
    BirthDate AS 'Nascimento',
    'Funcionário' AS 'Tipo'
FROM
    DimEmployee
WHERE BirthDate >= @data
ORDER BY Nascimento
