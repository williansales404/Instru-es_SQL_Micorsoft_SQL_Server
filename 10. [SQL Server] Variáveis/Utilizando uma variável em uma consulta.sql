-- Utilizando uma vari�vel em uma consulta (Exemplos)  
-- Exemplo 1: Aplique um desconto de 10% em todos os pre�os dos produtos. 
--Sua consulta final deve conter as colunas ProductKey, ProductName, UnitPrice e Pre�o com Desconto.
select * from DimProduct

declare @desconto float
set @desconto = 0.10
select 
	ProductKey as 'id',
	ProductName as 'Nome',
	UnitPrice as 'Pre�o',
	--UnitPrice - (@desconto * UnitPrice) as 'Pre�o com desconto'
	UnitPrice * (1 - @desconto) as 'Pre�o com desconto'
from DimProduct

------------------------------------------------------------------
-- Utilizando uma vari�vel em uma consulta (Exemplo 2)  
-- Crie uma vari�vel de data para otimizar a consulta abaixo.
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
    'Funcion�rio' AS 'Tipo'
FROM
    DimEmployee
WHERE BirthDate >= @data
ORDER BY Nascimento
