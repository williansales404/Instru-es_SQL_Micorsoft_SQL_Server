/*1. 
a) A partir da tabela DimProduct, crie uma View contendo as informações de ProductName, ColorName, UnitPrice e UnitCost, da tabela DimProduct. Chame essa View de vwProdutos. 
b) A partir da tabela DimEmployee, crie uma View mostrando FirstName, BirthDate, DepartmentName. Chame essa View de vwFuncionarios. 
c) A partir da tabela DimStore, crie uma View mostrando StoreKey, StoreName e OpenDate. Chame essa View de vwLojas.*/
go
	create view vwProduct as
	select
		ProductName,
		ColorName,
		UnitPrice,
		UnitCost
	from DimProduct
go

go
	create view vwFuncionarios as
	select 
		 FirstName,
		 BirthDate,
		 DepartmentName
	from DimEmployee
go

go
	create view vwLojas as
	select
		StoreKey,
		StoreName,
		OpenDate
	from DimStore
go

select * from vwProduct
select * from vwfuncionarios
select * from vwLojas

--///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*2. Crie uma View contendo as informações de Nome Completo (FirstName + LastName), Gênero (por extenso), E-mail e Renda Anual (formatada com R$).
Utilize a tabela DimCustomer. Chame essa View de vwClientes.*/
go
	alter view vwClientes as
	select
		CONCAT(FirstName,' ',LastName) as 'Nome Completo',
		REPLACE(REPLACE(Gender, 'M', 'Masculino'), 'F', 'Feminino') as 'Genero',
		EmailAddress as 'Email',
		FORMAT(YearlyIncome, 'C') as 'Renda Anual'
	from DimCustomer
go

select * from vwClientes

/*3.--///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
a) A partir da tabela DimStore, crie uma View que considera apenas as lojas ativas. Faça um SELECT de todas as colunas. Chame essa View de vwLojasAtivas.
b) A partir da tabela DimEmployee, crie uma View de uma tabela que considera apenas os funcionários da área de Marketing. Faça um SELECT das colunas: FirstName, EmailAddress e DepartmentName. Chame essa de vwFuncionariosMkt. 
c) Crie uma View de uma tabela que considera apenas os produtos das marcas Contoso e Litware. Além disso, a sua View deve considerar apenas os produtos de cor Silver. Faça um SELECT de todas as colunas da tabela DimProduct. Chame essa View de vwContosoLitwareSilver. */
select * from DimEmployee
go
create view vwLojasAtivas as
select * from DimStore
where CloseDate is null
go

go
create view vwFuncionariosMkt as
select 
	FirstName,
	EmailAddress,
	DepartmentName
from DimEmployee
where DepartmentName = 'Marketing'
go

go
create view vwContosoLitwareSilver as
select * from DimProduct
--where ColorName = 'Silver' and (BrandName = 'Contoso' or BrandName = 'Litware')
where BrandName in ('Contoso', 'Litware') and ColorName = 'Silver'
go

select * from vwContosoLitwareSilver
select * from vwFuncionariosMkt
select * from vwLojasAtivas

--///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*4. Crie uma View que seja o resultado de um agrupamento da tabela FactSales. Este agrupamento deve considerar o SalesQuantity (Quantidade Total Vendida) por Nome do Produto. Chame esta View de vwTotalVendidoProdutos. 
OBS: Para isso, você terá que utilizar um JOIN para relacionar as tabelas FactSales e DimProduct. */
select top(100) * from FactSales
select top(100) * from DimProduct

go
create view vwTotalVendidoProdutos as

select 
	ProductName as 'Nome Produtos',
	SUM(SalesQuantity) as 'Quantidade Total Vendida'
from FactSales
	inner join DimProduct
		on FactSales.ProductKey = DimProduct.ProductKey
group by ProductName
go

select * from vwTotalVendidoProdutos

--///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*5. Faça as seguintes alterações nas tabelas da questão 1. 
a. Na View criada na letra a da questão 1, adicione a coluna de BrandName. 
b. Na View criada na letra b da questão 1, faça um filtro e considere apenas os funcionários do sexo feminino. 
c. Na View criada na letra c da questão 1, faça uma alteração e filtre apenas as lojas ativas.  */
go
	alter view vwProduct as
	select
		ProductName,
		BrandName,
		ColorName,
		UnitPrice,
		UnitCost
	from DimProduct
go

go
	alter view vwFuncionarios as
	select 
		 FirstName,
		 BirthDate,
		 DepartmentName
	from DimEmployee
	where Gender = 'F'
go

go
	alter view vwLojas as
	select
		StoreKey,
		StoreName,
		OpenDate
	from DimStore
	--where Status = 'On'
	where CloseDate is null
go

select * from vwProduct
select * from vwFuncionarios
select * from vwLojas

--///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*6.
a) Crie uma View que seja o resultado de um agrupamento da tabela DimProduct. O resultado esperado da consulta deverá ser o total de produtos por marca. Chame essa View de vw_6a. 
b) Altere a View criada no exercício anterior, adicionando o peso total por marca. Atenção: sua View final deverá ter então 3 colunas: Nome da Marca, Total de Produtos e Peso Total. 
c) Exclua a View vw_6a.*/
select * from DimProduct

go
	create view  vw_6a as
	select 
		BrandName,
		count(*) as 'Total Produtos'
	from DimProduct
	group by BrandName
go

go
	alter view  vw_6a as
	select 
		BrandName,
		count(*) as 'Total Produtos',
		sum(Weight) as 'Peso Total'
	from DimProduct
	group by BrandName
go

select * from  vw_6a

drop view vw_6a


