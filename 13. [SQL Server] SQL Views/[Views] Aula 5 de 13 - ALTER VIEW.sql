--2. ALTER VIEW 
--a) Altere a View criada no exemplo 1a para incluir apenas os clientes do sexo Feminino.
select * from vwClientes

go
alter view vwClientes as
select
	FirstName,
	EmailAddress,
	BirthDate,
	Gender
from DimCustomer
where Gender = 'F'
go


-- b) Altere a View criada no exemplo 1b para incluir apenas os produtos da subcategoria 'Televisions'
select * from vwProdutos

go
alter view vwProdutos as
select 
	ProductKey,
	ProductName,
	DimProductSubcategory.ProductSubcategoryKey,
	BrandName,
	UnitPrice
from DimProduct
	inner join DimProductSubcategory
		on DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
	where ProductSubcategoryName = 'Televisions'
go