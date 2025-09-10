--exercicios

--O que voc� precisar� fazer � confirmar se: 
/*a. Existem 2.517 produtos cadastrados na base e, se n�o tiver, voc� dever� reportar ao seu 
gestor para saber se existe alguma defasagem no controle dos produtos. */
select * from DimProduct 

select
	ProductKey
from 
	DimProduct
--(2517 linhas afetadas)

/*b. At� o m�s passado, a empresa tinha um total de 19.500 clientes na base de controle. 
Verifique se esse n�mero aumentou ou reduziu. */
select * from DimCustomer

select
	CustomerKey
from
	DimCustomer
-- (18869 linhas afetadas) reduzio 
--------------------------------------------------------------------------------------------

/*Voc� trabalha no setor de marketing da empresa Contoso e acaba de ter uma ideia de oferecer 
descontos especiais para os clientes no dia de seus anivers�rios. Para isso, voc� vai precisar 
listar todos os clientes e as suas respectivas datas de nascimento, al�m de um contato. */
select * from DimCustomer

select
	CustomerKey as 'ChaveCliente',
	FirstName as 'PrimeiroNome',
	EmailAddress as 'Email',
	BirthDate as 'DataAniversario'
From
	DimCustomer
--------------------------------------------------------------------------------------------

/*A Contoso est� comemorando anivers�rio de inaugura��o de 10 anos e pretende fazer uma 
a��o de premia��o para os clientes. A empresa quer presentear os primeiros clientes desde 
a inaugura��o.  
Voc� foi alocado para levar adiante essa a��o. Para isso, voc� ter� que fazer o seguinte: */

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
estoque. Voc� � da �rea de compras e precisa descobrir quem s�o esses fornecedores. */
select * from DimProduct

select 
	distinct
	Manufacturer
from
	DimProduct
--------------------------------------------------------------------------------------------

/*O seu trabalho de investiga��o n�o para. Voc� precisa descobrir se existe algum produto 
registrado na base de produtos que ainda n�o tenha sido vendido. Tente chegar nessa 
informa��o. */
select * from DimProduct

select * from FactSales

select 
	distinct ProductKey
from 
	FactSales