--exercicios

--O que você precisará fazer é confirmar se: 
/*a. Existem 2.517 produtos cadastrados na base e, se não tiver, você deverá reportar ao seu 
gestor para saber se existe alguma defasagem no controle dos produtos. */
select * from DimProduct 

select
	ProductKey
from 
	DimProduct
--(2517 linhas afetadas)

/*b. Até o mês passado, a empresa tinha um total de 19.500 clientes na base de controle. 
Verifique se esse número aumentou ou reduziu. */
select * from DimCustomer

select
	CustomerKey
from
	DimCustomer
-- (18869 linhas afetadas) reduzio 
--------------------------------------------------------------------------------------------

/*Você trabalha no setor de marketing da empresa Contoso e acaba de ter uma ideia de oferecer 
descontos especiais para os clientes no dia de seus aniversários. Para isso, você vai precisar 
listar todos os clientes e as suas respectivas datas de nascimento, além de um contato. */
select * from DimCustomer

select
	CustomerKey as 'ChaveCliente',
	FirstName as 'PrimeiroNome',
	EmailAddress as 'Email',
	BirthDate as 'DataAniversario'
From
	DimCustomer
--------------------------------------------------------------------------------------------

/*A Contoso está comemorando aniversário de inauguração de 10 anos e pretende fazer uma 
ação de premiação para os clientes. A empresa quer presentear os primeiros clientes desde 
a inauguração.  
Você foi alocado para levar adiante essa ação. Para isso, você terá que fazer o seguinte: */

-- presentear os primeiros 100 clientes
select top(100) * from DimCustomer

-- presentear os primeiros 20% de clientes
select top(20) percent * from DimCustomer

----
select top(100)
	FirstName as 'PrimeiroNome',
	EmailAddress as 'Email',
	BirthDate as 'DataAniversario'
from
	DimCustomer
--------------------------------------------------------------------------------------------

/*A empresa Contoso precisa fazer contato com os fornecedores de produtos para repor o 
estoque. Você é da área de compras e precisa descobrir quem são esses fornecedores. */
select * from DimProduct

select 
	distinct
	Manufacturer
from
	DimProduct
--------------------------------------------------------------------------------------------

/*O seu trabalho de investigação não para. Você precisa descobrir se existe algum produto 
registrado na base de produtos que ainda não tenha sido vendido. Tente chegar nessa 
informação. */
select * from DimProduct

select * from FactSales

select 
	distinct ProductKey
from 
	FactSales