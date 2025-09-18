/*1. Utilize o INNER JOIN para trazer os nomes das subcategorias dos produtos, da tabela 
DimProductSubcategory para a tabela DimProduct.*/
select * from DimProduct
select * from DimProductSubcategory

select
	ProductKey,
	ProductName,
	--DimProduct.ProductSubcategoryKey,
	ProductSubcategoryName
from DimProduct
inner join DimProductSubcategory
	on DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey

/*2. Identifique uma coluna em comum entre as tabelas DimProductSubcategory e 
DimProductCategory. Utilize essa coluna para complementar informações na tabela 
DimProductSubcategory a partir da DimProductCategory. Utilize o LEFT JOIN.*/
select * from DimProductSubcategory
select * from DimProductCategory

select
	ProductSubcategoryKey,
	ProductSubcategoryName,
	DimProductSubcategory.ProductCategoryKey,
	ProductCategoryName
from DimProductSubcategory
left join DimProductCategory
	on DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey

/*3. Para cada loja da tabela DimStore, descubra qual o Continente e o Nome do País associados 
(de acordo com DimGeography). Seu SELECT final deve conter apenas as seguintes colunas: 
StoreKey, StoreName, EmployeeCount, ContinentName e RegionCountryName. Utilize o LEFT JOIN neste exercício.*/
select * from DimStore
select * from DimGeography

select
	StoreKey,
	StoreName,
	EmployeeCount,
	--DimGeography.GeographyKey,
	DimGeography.ContinentName,
	DimGeography.RegionCountryName
from DimStore
left join DimGeography
	on DimStore.GeographyKey = DimGeography.GeographyKey

/*4. Complementa a tabela DimProduct com a informação de ProductCategoryDescription. Utilize 
o LEFT JOIN e retorne em seu SELECT apenas as 5 colunas que considerar mais relevantes. */
select * from DimProduct
select * from DimProductSubcategory
select * from DimProductCategory

select
	ProductKey,
	ProductName,
	ProductDescription as 'Descrição tabela produto',
	DimProductSubcategory.ProductCategoryKey as 'chave categoria',
	DimProductCategory.ProductCategoryKey,
	DimProductCategory.ProductCategoryDescription as 'Descrição tabela category'

from DimProduct
left join DimProductSubcategory
	on DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
		left join DimProductCategory
			on DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey

/*5. A tabela FactStrategyPlan resume o planejamento estratégico da empresa. Cada linha 
representa um montante destinado a uma determinada AccountKey.

a) Faça um SELECT das 100 primeiras linhas de FactStrategyPlan para reconhecer a tabela. 
b) Faça um INNER JOIN para criar uma tabela contendo o AccountName para cada 
AccountKey da tabela FactStrategyPlan. O seu SELECT final deve conter as colunas: 
• StrategyPlanKey 
• DateKey 
• AccountName 
• Amount */
select * from FactStrategyPlan
select * from DimAccount

select
	StrategyPlanKey,
	Datekey,
	--DimAccount.AccountKey,
	DimAccount.AccountName,
	--DimAccount.AccountType,
	Amount
from FactStrategyPlan
	inner join DimAccount
		on FactStrategyPlan.AccountKey = DimAccount.AccountKey

/*6. Vamos continuar analisando a tabela FactStrategyPlan. Além da coluna AccountKey que 
identifica o tipo de conta, há também uma outra coluna chamada ScenarioKey. Essa coluna 
possui a numeração que identifica o tipo de cenário: Real, Orçado e Previsão. 
Faça um INNER JOIN para criar uma tabela contendo o ScenarioName para cada ScenarioKey 
da tabela FactStrategyPlan. O seu SELECT final deve conter as colunas: 
• StrategyPlanKey 
• DateKey 
• ScenarioName  
• Amount */
select top (100) * from FactStrategyPlan
select * from DimScenario
select * from DimAccount

select 
	StrategyPlanKey,
	Datekey,
	DimScenario.ScenarioName,
	Amount,
	DimAccount.AccountType
from FactStrategyPlan
	inner join DimScenario
		on FactStrategyPlan.ScenarioKey = DimScenario.ScenarioKey
	inner join DimAccount
		on FactStrategyPlan.AccountKey = DimAccount.AccountKey

/*7. Algumas subcategorias não possuem nenhum exemplar de produto. Identifique que 
subcategorias são essas. */
select * from DimProduct            -->tabela esquerda principal
select * from DimProductSubcategory -->tabela direita de onde vou puchar informação

select 
	ProductKey,
	ProductName,
	DimProductSubcategory.ProductSubcategoryName
from DimProduct
	right join DimProductSubcategory
		on DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey

/*8 A tabela abaixo mostra a combinação entre Marca e Canal de Venda, para as marcas Contoso, 
Fabrikam e Litware. Crie um código SQL para chegar no mesmo resultado. */
select * from DimProduct
select * from DimChannel

select
	distinct BrandName,
	ChannelName
from 
	DimProduct cross join DimChannel
		where BrandName in ('Contoso', 'Fabrikam' ,'Litware')

/*9. Neste exercício, você deverá relacionar as tabelas FactOnlineSales com DimPromotion. 
Identifique a coluna que as duas tabelas têm em comum e utilize-a para criar esse 
relacionamento. 
Retorne uma tabela contendo as seguintes colunas: 
• OnlineSalesKey 
• DateKey 
• PromotionName 
• SalesAmount 
A sua consulta deve considerar apenas as linhas de vendas referentes a produtos com 
desconto (PromotionName <> ‘No Discount’). Além disso, você deverá ordenar essa tabela de 
acordo com a coluna DateKey, em ordem crescente.*/
select * from FactOnlineSales
select * from DimPromotion

select
	top(1000)
	OnlineSalesKey,
	DateKey,
	DimPromotion.PromotionName,
	SalesAmount
from FactOnlineSales
	inner join DimPromotion
		on FactOnlineSales.PromotionKey = DimPromotion.PromotionKey
where PromotionName <> 'No Discount'
order by DateKey asc

/*10. A tabela abaixo é resultado de um Join entre a tabela FactSales e as tabelas: DimChannel, 
DimStore e DimProduct. 
Recrie esta consulta e classifique em ordem crescente de acordo com SalesAmount.*/
select top(100) * from FactSales
select * from DimChannel
select * from DimStore
select * from DimProduct

select 
	top(10000)
	SalesKey,
	DimChannel.ChannelName,
	DimStore.StoreName,
	DimProduct.ProductName,
	FactSales.SalesAmount
from FactSales
	inner join DimChannel
		on FactSales.channelKey = DimChannel.ChannelKey
	inner join DimStore
		on FactSales.StoreKey = DimStore.StoreKey
	inner join DimProduct
		on FactSales.ProductKey = DimProduct.ProductKey
order by SalesAmount desc



