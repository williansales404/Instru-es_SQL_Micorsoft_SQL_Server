/*Criando a primeira View

Quando falamos em Views, existem 3 ações envolvidas:
1. Criação de uma View
2. Alteração de uma View
3. Exclusão de uma View

Para cada uma dessas ações, temos um comando associado:
1. CREATE VIEW
2. ALTER VIEW
3. DROP VIEW*/

-- 1. CREATE VIEW
-- a) Crie uma view contendo as seguintes informações da tabela DimCustomer: FirstName, EmailAddress e BirthDate. Chame essa view de vwClientes.
create view vwClientes as
select 
	FirstName,
	EmailAddress,
	BirthDate
from DimCustomer
go

select * from vwClientes

-- b) Crie uma View contendo as seguintes informações da tabela DimProduct: ProductKey, ProductName, ProductSubcategoryKey, BrandName e UnitPrice. Chame essa view de vwProdutos.
go -- significa que o codigo pra ser executado esta dentro deste bloco go
create view vwProdutos as
select 
	ProductKey,
	ProductName,
	ProductSubcategoryKey,
	BrandName,
	UnitPrice
from DimProduct
go
select * from vwProdutos