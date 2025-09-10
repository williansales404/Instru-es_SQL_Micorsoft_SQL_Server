/*MÓDULO 5: EXERCÍCIOS 
Na resolução dos exercícios, tente usar as boas práticas de organização e comentários no código. 
1. O gerente comercial pediu a você uma análise da Quantidade Vendida e Quantidade 
Devolvida para o canal de venda mais importante da empresa:  Store. 
Utilize uma função SQL para fazer essas consultas no seu banco de dados. Obs: Faça essa 
análise considerando a tabela FactSales.*/
select * from DimChannel
select top(10) * from FactSales

select 
	sum(SalesQuantity) as 'Quantidade vendida',
	sum(ReturnQuantity) as 'Quantidade devolvida'
from FactSales
where channelKey = 1
--------------------------------------------------------------------------------------------------------------

/*2. Uma nova ação no setor de Marketing precisará avaliar a média salarial de todos os clientes 
da empresa, mas apenas de ocupação Professional.  Utilize um comando SQL para atingir esse 
resultado.*/
select * from DimCustomer

select AVG(YearlyIncome) from DimCustomer
where Occupation = 'Professional'
--------------------------------------------------------------------------------------------------------------

/*3. Você precisará fazer uma análise da quantidade de funcionários das lojas registradas na 
empresa. O seu gerente te pediu os seguintes números e informações: 
a) Quantos funcionários tem a loja com mais funcionários? 
b) Qual é o nome dessa loja? 
c) Quantos funcionários tem a loja com menos funcionários? 
d) Qual é o nome dessa loja?*/
select * from DimStore

select max(EmployeeCount) as 'Maximo funcionarios' from DimStore

select top(1) StoreName, EmployeeCount from DimStore
where EmployeeCount is not null
order by EmployeeCount desc

select min(EmployeeCount) as 'Minimo funcionarios' from DimStore

select top(1) StoreName, EmployeeCount from DimStore
where EmployeeCount is not null
order by EmployeeCount asc


--------------------------------------------------------------------------------------------------------------

/*4. A área de RH está com uma nova ação para a empresa, e para isso precisa saber a quantidade 
total de funcionários do sexo Masculino e do sexo Feminino.  
a) Descubra essas duas informações utilizando o SQL. 
b) O funcionário e a funcionária mais antigos receberão uma homenagem. Descubra as 
seguintes informações de cada um deles: Nome, E-mail, Data de Contratação.*/

select * from DimEmployee

--F = 87 
--M = 206
--F data entrada mais antiga= 1998-01-26
--M data entrada mais antiga= 1996-07-31

select count(FirstName) from DimEmployee
where  Gender = 'M'

select 
	top(1)
	FirstName,
	EmailAddress,
	StartDate
from DimEmployee
where Gender = 'F' and  EndDate is null
order by StartDate asc
--------------------------------------------------------------------------------------------------------------

/*5. Agora você precisa fazer uma análise dos produtos. Será necessário descobrir as seguintes 
informações: 
a) Quantidade distinta de cores de produtos. 
b) Quantidade distinta de marcas 
c) Quantidade distinta de classes de produto 
Para simplificar, você pode fazer isso em uma mesma consulta.*/
select * from DimProduct

select 
	count(distinct ColorName) as 'Cores', 
	count(distinct ClassName) as 'ClasseProduto', 
	count(distinct BrandName) as 'Marca'
from DimProduct
