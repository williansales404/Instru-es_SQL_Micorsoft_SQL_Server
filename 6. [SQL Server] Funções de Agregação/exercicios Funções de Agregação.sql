/*M�DULO 5: EXERC�CIOS 
Na resolu��o dos exerc�cios, tente usar as boas pr�ticas de organiza��o e coment�rios no c�digo. 
1. O gerente comercial pediu a voc� uma an�lise da Quantidade Vendida e Quantidade 
Devolvida para o canal de venda mais importante da empresa:  Store. 
Utilize uma fun��o SQL para fazer essas consultas no seu banco de dados. Obs: Fa�a essa 
an�lise considerando a tabela FactSales.*/
select * from DimChannel
select top(10) * from FactSales

select 
	sum(SalesQuantity) as 'Quantidade vendida',
	sum(ReturnQuantity) as 'Quantidade devolvida'
from FactSales
where channelKey = 1
--------------------------------------------------------------------------------------------------------------

/*2. Uma nova a��o no setor de Marketing precisar� avaliar a m�dia salarial de todos os clientes 
da empresa, mas apenas de ocupa��o Professional.  Utilize um comando SQL para atingir esse 
resultado.*/
select * from DimCustomer

select AVG(YearlyIncome) from DimCustomer
where Occupation = 'Professional'
--------------------------------------------------------------------------------------------------------------

/*3. Voc� precisar� fazer uma an�lise da quantidade de funcion�rios das lojas registradas na 
empresa. O seu gerente te pediu os seguintes n�meros e informa��es: 
a) Quantos funcion�rios tem a loja com mais funcion�rios? 
b) Qual � o nome dessa loja? 
c) Quantos funcion�rios tem a loja com menos funcion�rios? 
d) Qual � o nome dessa loja?*/
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

/*4. A �rea de RH est� com uma nova a��o para a empresa, e para isso precisa saber a quantidade 
total de funcion�rios do sexo Masculino e do sexo Feminino.  
a) Descubra essas duas informa��es utilizando o SQL. 
b) O funcion�rio e a funcion�ria mais antigos receber�o uma homenagem. Descubra as 
seguintes informa��es de cada um deles: Nome, E-mail, Data de Contrata��o.*/

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

/*5. Agora voc� precisa fazer uma an�lise dos produtos. Ser� necess�rio descobrir as seguintes 
informa��es: 
a) Quantidade distinta de cores de produtos. 
b) Quantidade distinta de marcas 
c) Quantidade distinta de classes de produto 
Para simplificar, voc� pode fazer isso em uma mesma consulta.*/
select * from DimProduct

select 
	count(distinct ColorName) as 'Cores', 
	count(distinct ClassName) as 'ClasseProduto', 
	count(distinct BrandName) as 'Marca'
from DimProduct
