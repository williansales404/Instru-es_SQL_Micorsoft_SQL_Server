--MÓDULO 10: EXERCÍCIOS 
/*1. Quando estamos manipulando tabelas, é importante pensar em como os dados serão apresentados em um relatório. Imagine os nomes dos produtos da tabela DimProduct. Os textos são bem grandes e pode ser que mostrar os nomes completos dos produtos não seja a opção mais interessante, pois provavelmente não vão caber em um gráfico e a visualização ficará ruim.*/
/*a) Seu gestor te pede para listar todos os produtos para que seja criado um gráfico para ser apresentado na reunião diária de equipe. Faça uma consulta à tabela DimProduct que retorne (1) o nome do produto e (2) a quantidade de caracteres que cada produto tem, e ordene essa tabela do produto com a maior quantidade de caracteres para a menor.*/
select * from DimProduct

select
	ProductName,
	DATALENGTH(ProductName) as 'QTD.caracteres + Espaço',
	LEN(ProductName) as 'QTD.caracteres Sem Espaço'
from DimProduct
order by DATALENGTH(ProductName) desc

/*b) Qual é a média de caracteres dos nomes dos produtos?*/
select
	AVG(DATALENGTH(ProductName)) as 'Media + Espaço',
	AVG(LEN(ProductName)) as 'Media Sem Espaço'
from DimProduct

/*c) Analise a estrutura dos nomes dos produtos e verifique se seria possível reduzir o tamanho
do nome dos produtos. (Dica: existem informações redundantes nos nomes dos produtos? Seria possível substituí-las?)*/

--STUFF(ProductName, 1, 100, left(ProductName, CHARINDEX(' ', ProductName, CHARINDEX(' ', ProductName, CHARINDEX(' ', ProductName)+1)+1)))
/*Usei o CHARINDEX encadeado para encontra o terceiro espaço dentro da string extrei o texto com left e formatei o novo texto com Stuff sem para para variaveis */
select
	ProductName,
	ProductName = STUFF(ProductName, 1, 200, left(ProductName, CHARINDEX(' ', ProductName, CHARINDEX(' ', ProductName, CHARINDEX(' ', ProductName)+1)+1)))
from DimProduct

--solução professor c)
select
	ProductName,
	REPLACE(REPLACE(ProductName,BrandName,''),ColorName,'')
from DimProduct

/*d) Qual é a média de caracteres nesse novo cenário?*/
select
	AVG(DATALENGTH(REPLACE(REPLACE(ProductName,BrandName,''),ColorName,''))) as 'Nova media + espaço',
	AVG(LEN(REPLACE(REPLACE(ProductName,BrandName,''),ColorName,''))) as 'Media sem espaço'
from DimProduct

--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*2.  A coluna StyleName da tabela DimProduct possui alguns códigos identificados por números distintos, que vão de 0 até 9, como pode ser visto no exemplo abaixo. Porém, o setor de controle decidiu alterar a identificação do StyleName, e em vez de usar números, a ideia agora é passar a usar letras para substituir os números, conforme exemplo abaixo: 
0 -> A, 1 -> B, 2 -> C, 3 -> D, 4 -> E, 5 -> F, 6 -> G, 7 -> H, 8 -> I, 9 - J 
É de sua responsabilidade alterar os números por letras na coluna StyleName da tabela DimProduct. Utilize uma função que permita fazer essas substituições de forma prática e rápida.*/
select * from DimProduct

declare @cod varchar(50), @newCod varchar(50)
set @cod = '0123456789'
set @newCod = 'ABCDEFGHIJ'
select 
	ProductName,
	StyleName,
	TRANSLATE(StyleName, @cod, @newCod) as 'Novo cod'
from DimProduct

--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*3. O setor de TI está criando um sistema para acompanhamento individual de cada funcionário da empresa Contoso. Cada funcionário receberá um login e senha. O login de cada funcionário será o ID do e-mail, como no exemplo abaixo: Já a senha será o FirtName + o dia do ano em que o funcionário nasceu, em MAIÚSCULA. Por exemplo, o funcionário com E-mail: mark0@contoso.com e data de nascimento 15/01/1990 deverá ter a seguinte senha: 
Login: mark0 
Senha: MARK15 
O responsável pelo TI pediu a sua ajuda para retornar uma tabela contendo as seguintes colunas da tabela DimEmployee: Nome completo (FirstName + LastName), E-mail, ID do e-mail e Senha. Portanto, faça uma consulta à tabela DimProduct e retorne esse resultado.*/
select * from DimEmployee

declare @index varchar(50) = '@'
select
	TRIM(CONCAT(FirstName,' ',LastName)) as 'Nome Completo',
	left(EmailAddress,CHARINDEX(@index,EmailAddress)-1) as 'Login',
	TRIM(CONCAT(UPPER(FirstName),DAY(BirthDate))) as 'Password'
from DimEmployee

--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*4. A tabela DimCustomer possui o primeiro registro de vendas no ano de 2001. Como forma de reconhecer os clientes que compraram nesse ano, o setor de Marketing solicitou a você que retornasse uma tabela com todos os clientes que fizeram a sua primeira compra neste ano para que seja enviado uma encomenda com um presente para cada um. Para fazer esse filtro, você pode utilizar a coluna DateFirstPurchase, que contém a informação da data da primeira compra de cada cliente na tabela DimCustomer. Você deverá retornar as colunas de FirstName, EmailAddress, AddressLine1 e DateFirstPurchase da tabela DimCustomer, considerando apenas os clientes que fizeram a primeira compra no ano de 2001.*/
select * from DimCustomer

declare @anoPriCompra date = '2001'
select 
	FirstName,
	EmailAddress,
	AddressLine1,
	DateFirstPurchase
from DimCustomer
where YEAR(DateFirstPurchase) = YEAR(@anoPriCompra)
order by MONTH(DateFirstPurchase)

--solução professor
SELECT
    FirstName,
    EmailAddress,
    AddressLine1,
    DateFirstPurchase
FROM
    DimCustomer
WHERE YEAR(DateFirstPurchase) = 2001

--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*5. A tabela DimEmployee possui uma informação de data de contratação (HireDate). A área de RH, no entanto, precisa das informações dessas datas de forma separada em dia, mês e ano, pois será feita uma automatização para criação de um relatório de RH, e facilitaria muito se essas informações estivessem separadas em uma tabela. Você deverá realizar uma consulta à tabela DimEmployee e retornar uma tabela contendo as seguintes informações: FirstName, EmailAddress, HireDate, além das colunas de Dia, Mês e Ano de contratação.  
Obs1: A coluna de Mês deve conter o nome do mês por extenso, e não o número do mês. 
Obs2: Lembre-se de nomear cada uma dessas colunas em sua consulta para garantir que o 
entendimento de cada informação ficará 100% claro.  */
select * from DimEmployee

select 
	FirstName,
	EmailAddress,
	HireDate,
	DAY(HireDate) as 'Dia',
	FORMAT(HireDate, 'MMMM', 'pt-br') as 'Mês',
	YEAR(HireDate) as 'Ano'
from DimEmployee
order by MONTH(HireDate)

--solução professor
SELECT
    FirstName AS 'Nome',
    EmailAddress AS 'E-mail',
    HireDate AS 'Data de contratação',
    DAY(HireDate) AS 'Dia da contratação',
    DATENAME(MONTH, HireDate) AS 'Mês da contratação',
    YEAR(HireDate) AS 'Ano da contratação'
FROM
    DimEmployee


--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*6. Descubra qual é a loja que possui o maior tempo de atividade (em dias). Você deverá fazer essa consulta na tabela DimStore, e considerar a coluna OpenDate como referência para esse cálculo. */
select * from DimStore 

select
	StoreName,
	OpenDate,
	DATEDIFF(DAY, OpenDate, GETDATE()) as 'QTD.dias'
from DimStore
where CloseDate is null
order by DATEDIFF(DAY, OpenDate, GETDATE()) desc

