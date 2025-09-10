--Exemplos de ordenação e filtros
select top(100) * from DimStore
order by EmployeeCount desc

----------------------------------------------------------------------
-- Aula 2 de 27: Order By (Parte 2)
-- Selecionando as TOP 10 linhas da tabela DimProduct, ordenando pelas colunas UnitCost (decrescente) e Weight (decrescente)
select 
	top(10) ProductName,
	UnitCost,
	weight
from DimProduct
order by UnitCost desc, Weight desc
----------------------------------------------------------------------
--filtrar numero
select * from DimProduct

select 
	ProductName as 'Produto',
	UnitPrice as 'Preço'
from DimProduct
where UnitPrice >= 3000
----------------------------------------------------------------------
--filtra texto
select * from DimProduct

select distinct
	BrandName 
from DimProduct

select * from DimProduct
where BrandName = 'Fabrikam'

select * from DimProduct
where ColorName = 'Black'
----------------------------------------------------------------------
--filtro com data
select * from DimCustomer

select * from DimCustomer
where BirthDate >= '1970-12-30'
order by BirthDate desc
----------------------------------------------------------------------
-- Seleciona todas as linhas da tabela em que a marca é Contoso E a cor é Prata.
SELECT * FROM dimProduct
WHERE BrandName = 'Contoso' AND ColorName = 'Silver'

-- Seleciona todas as linhas da tabela em que a cor é Azul OU a cor é Prata.
SELECT * FROM dimProduct
WHERE ColorName = 'Blue' OR ColorName = 'Silver'

-- Seleciona todas as linhas da tabela em que a cor NÃO é azul.
SELECT * FROM dimProduct
WHERE NOT ColorName = 'Blue'
----------------------------------------------------------------------
--filtro usando where e and
select * from DimProduct
where BrandName = 'Fabrikam' and ColorName = 'Black'
----------------------------------------------------------------------
select * from DimProduct
where BrandName = 'Contoso' or ColorName = 'White'
----------------------------------------------------------------------
select * from DimEmployee
where not DepartmentName = 'Marketing'
----------------------------------------------------------------------
-- [SQL Server] Ordenando e filtrando dados
-- Aula 11 de 27: Exercícios de Fixação - Where mais And, Or e Not
-- Podemos filtrar os dados nas nossas tabelas utilizando o comando WHERE
-- 1. Selecione todas as linhas da tabela DimEmployee de funcionários do sexo feminino E do departamento de finanças.
select * from DimEmployee
where Gender = 'F' and DepartmentName = 'Finance'

-- 2. Selecione todas as linhas da tabela DimProduct de produtos Contoso E da cor vermelha E que tenham um UnitPrice maior ou igual a $100.
select * from DimProduct
where ColorName = 'Red' and UnitPrice >= 100
order by UnitPrice desc

-- 3. Selecione todas as linhas da tabela DimProduct com produtos da marca Litware OU da marca Fabrikam OU da cor Preta.
select * from DimProduct
where BrandName = 'Litware' or BrandName = 'Fabrikam' or ColorName = 'Black'

-- 4. Selecione todas as linhas da tabela DimSalesTerritory onde o continente é a Europa mas o país NÃO é a Itália.
select * from DimSalesTerritory
where not SalesTerritoryCountry = 'Italy' and SalesTerritoryGroup = 'Europe'
--------------------------------------------------------------------------------------------------------------------
-- [SQL Server] Ordenando e filtrando dados
-- Aula 12 de 27: Cuidados ao combinar os operadores AND e OR

-- Podemos filtrar os dados nas nossas tabelas utilizando o comando WHERE

-- Exemplo: Selecione todas as linhas da tabela DimProduct onde a cor do Produto pode ser igual a Preto OU Vermelho, MAS a marca deve ser obrigatoriamente igual a Fabrikam.
select * from DimProduct
where (ColorName = 'Black' or ColorName = 'Red') and BrandName = 'Fabrikam'
-- Obs: Lembre-se de incluir parênteses para agrupar os testes lógicos que você deseja fazer ao mesmo tempo, para assim chegar no resultado que você espera.
--------------------------------------------------------------------------------------------------------------------
-- [SQL Server] Ordenando e filtrando dados
-- Aula 13 de 27: Where mais IN - Alternativa ao OR com múltiplas condições

-- Podemos utilizar o operador IN como alternativa aos múltiplos OR.

-- Exemplo: Selecione os funcionários que são de qualquer um desses 3 departamentos: Production, Marketing, Engineering.
select * from DimProduct
--where ColorName in ('Black', 'Red', 'Silver')

select * from DimEmployee
where DepartmentName in ('Production', 'Marketing', 'Engineering')
-----------------------------------------------------------------------------------------------
-- [SQL Server] Ordenando e filtrando dados
-- Aula 14 de 27: Where mais Like - Filtro especial para textos

-- 1. Selecione todos os produtos que possuem o texto 'MP3 Player' contido na nome do produto.
select * from  DimProduct
where ProductName like '%MP3 Player%'

-- 2. Selecione todos os produtos que têm a descrição do nome começando por 'Type'.
select * from DimProduct
where ProductDescription like 'Type%'

-- 3. Selecione todos os produtos que têm a descrição do nome terminando em 'WMA'.
select * from DimProduct
where ProductDescription like '%WMA'
----------------------------------------------------------------------------------
-- [SQL Server] Ordenando e filtrando dados
-- Aula 15 de 27: Where mais Between - Filtrando entre valores

-- 1. Selecione os funcionários que têm a data de contratação entre '01-01-2000' e '31-12-2000'.
select * from DimProduct
where UnitPrice not between 50 and 100

select * from DimEmployee
where HireDate between '2000-01-01' and '2000-12-31'
----------------------------------------------------------------------------------------------------
-- [SQL Server] Ordenando e filtrando dados
-- Aula 16 de 27: Where mais Is Null e Is Not Null - Filtrando valores nulos

-- 1. Selecione os clientes que são pessoa física.

SELECT * FROM DimCustomer
WHERE CompanyName IS NULL

SELECT * FROM DimCustomer
WHERE CompanyName IS NOT NULL