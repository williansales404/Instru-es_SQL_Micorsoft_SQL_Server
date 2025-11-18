/*1. O setor de vendas decidiu aplicar um desconto aos produtos de acordo com a sua classe. O percentual aplicado deverá ser de: 
Economy -> 5% 
Regular -> 7% 
Deluxe -> 9%*/
--a) Faça uma consulta à tabela DimProduct que retorne as seguintes colunas: ProductKey, ProductName, e outras duas colunas que deverão retornar o % de Desconto e UnitPrice com desconto.

--b) Faça uma adaptação no código para que os % de desconto de 5%, 7% e 9% sejam facilmente modificados (dica: utilize variáveis).
select * from DimProduct

declare @economy float, @regular float, @deluxe float
set @economy = 0.05
set @regular = 0.07
set @deluxe = 0.09
select 
	ProductKey as 'ID',
	ProductName as 'Nome',
	ClassName as 'Classe',
	UnitPrice as 'Valor Original',
	case
		when ClassName = 'Economy' then @economy
		when ClassName = 'Regular' then @regular
		else @deluxe
	end as 'Tab_deconto',
	case
		when ClassName = 'Economy' then UnitPrice - (UnitPrice * @economy)
		when ClassName = 'Regular' then UnitPrice - (UnitPrice * @regular)
		else UnitPrice - (UnitPrice * @deluxe)
	end as 'Apli_deconto'
from DimProduct

--solução professor
SELECT
    ProductKey AS 'ID Produto',
    ProductName AS 'Nome Produto',
    ClassName AS 'Classe',
    UnitPrice AS 'Preço',
    CASE
        WHEN ClassName = 'Economy' THEN (1 - @economy) * UnitPrice
        WHEN ClassName = 'Regular' THEN (1 - @regular) * UnitPrice
        ELSE (1 - @deluxe) * UnitPrice
    END AS '% Desconto'
FROM
    DimProduct

--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*2. Você ficou responsável pelo controle de produtos da empresa e deverá fazer uma análise da 
quantidade de produtos por Marca. 
A divisão das marcas em categorias deverá ser a seguinte: 
CATEGORIA A: Mais de 500 produtos  
CATEGORIA B: Entre 100 e 500 produtos  
CATEGORIA C: Menos de 100 produtos  
Faça uma consulta à tabela DimProduct e retorne uma tabela com um agrupamento de Total de 
Produtos por Marca, além da coluna de Categoria, conforme a regra acima.*/
select * from DimProduct

select
	BrandName as 'Marca',
	COUNT(*) as 'QTD.produto',
	case
		when COUNT(*) > 500 then 'CATEGORIA A'
		when COUNT(*) > 100 then 'CATEGORIA B'
		else 'CATEGORIA C'
	end as 'Categoria'
from DimProduct
group by BrandName

--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*3. Será necessário criar uma categorização de cada loja da empresa considerando a quantidade de 
funcionários de cada uma. A lógica a ser seguida será a lógica abaixo: 
EmployeeCount >= 50; 'Acima de 50 funcionários' 
EmployeeCount >= 40; 'Entre 40 e 50 funcionários' 
EmployeeCount >= 30; 'Entre 30 e 40 funcionários' 
EmployeeCount >= 20; 'Entre 20 e 30 funcionários' 
EmployeeCount >= 10; 'Entre 10 e 20 funcionários' 
Caso contrário: 'Abaixo de 10 funcionários' 
Faça uma consulta à tabela DimStore que retorne as seguintes informações: StoreName, 
EmployeeCount e a coluna de categoria, seguindo a regra acima.*/
select * from DimStore

select 
	distinct StoreName,
	EmployeeCount,
	case
		when EmployeeCount >= 50 then 'Acima de 50 funcionários'
		when EmployeeCount >= 40 then 'Entre 40 e 50 funcionários'
		when EmployeeCount >= 30 then 'Entre 30 e 40 funcionários'
		when EmployeeCount >= 20 then 'Entre 20 e 30 funcionários'
		when EmployeeCount >= 10 then 'Entre 10 e 20 funcionários'
		else 'Abaixo de 10 funcionários'
	end as 'Categoria'
from DimStore
where CloseDate is null

--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*4. O setor de logística deverá realizar um transporte de carga dos produtos que estão no depósito de Seattle para o depósito de Sunnyside.  
Não se tem muitas informações sobre os produtos que estão no depósito, apenas se sabe que existem 100 exemplares de cada Subcategoria. Ou seja, 100 laptops, 100 câmeras digitais, 100 
ventiladores, e assim vai. O gerente de logística definiu que os produtos serão transportados por duas rotas distintas. Além 
disso, a divisão dos produtos em cada uma das rotas será feita de acordo com as subcategorias (ou seja, todos os produtos de uma mesma subcategoria serão transportados pela mesma rota):
Rota 1: As subcategorias que tiverem uma soma total menor que 1000 kg deverão ser 
transportados pela Rota 1. 
Rota 2: As subcategorias que tiverem uma soma total maior ou igual a 1000 kg deverão ser 
transportados pela Rota 2. 
Você deverá realizar uma consulta à tabela DimProduct e fazer essa divisão das subcategorias por 
cada rota. Algumas dicas: - Dica 1: A sua consulta deverá ter um total de 3 colunas: Nome da Subcategoria, Peso Total e Rota. - Dica 2: Como não se sabe quais produtos existem no depósito, apenas que existem 100 
exemplares de cada subcategoria, você deverá descobrir o peso médio de cada subcategoria e 
multiplicar essa média por 100, de forma que você descubra aproximadamente qual é o peso total 
dos produtos por subcategoria. - Dica 3: Sua resposta final deverá ter um JOIN e um GROUP BY.*/
select * from DimProduct

select 
	DimProductSubcategory.ProductSubcategoryName,
	AVG(Weight) * 100 as 'Base Peso Total',
	case
		when AVG(Weight) * 100 < 1000 then 'ROTA 1'
		else 'ROTA 2'
	end as 'ROTA'
from DimProduct
inner join DimProductSubcategory
	on DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
where Weight is not null
group by DimProductSubcategory.ProductSubcategoryName

--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*5. O setor de marketing está com algumas ideias de ações para alavancar as vendas em 2021. Uma delas consiste em realizar sorteios entre os clientes da empresa.  
Este sorteio será dividido em categorias: 
‘Sorteio Mãe do Ano’: Nessa categoria vão participar todas as mulheres com filhos. 
‘Sorteio Pai do Ano’: Nessa categoria vão participar todos os pais com filhos. 
‘Caminhão de Prêmios’: Nessa categoria vão participar todas os demais clientes (homens e mulheres sem filhos). 
Seu papel será realizar uma consulta à tabela DimCustomer e retornar 3 colunas:
- FirstName AS ‘Nome’ - Gender AS ‘Sexo’ 
- TotalChildren AS ‘Qtd. Filhos’ - EmailAdress AS ‘E-mail’ 
- Ação de Marketing: nessa coluna você deverá dividir os clientes de acordo com as categorias ‘Sorteio Mãe do Ano’, ‘Sorteio Pai do Ano’ e ‘Caminhão de Prêmios’. */
select * from DimCustomer

select 
	FirstName,
	Gender,
	TotalChildren,
	EmailAddress,
	case
		when TotalChildren > 0 
		    then case
				when Gender = 'F' then 'Sorteio Mãe do Ano'
				else 'Sorteio Pai do Ano'
			end
		else 'Caminhão de Prêmios'
	end as 'Ação de Marketing'
from DimCustomer
where CustomerType = 'Person'

--solução professor
SELECT
    FirstName AS 'Nome',
    Gender AS 'Sexo',
    TotalChildren AS 'Qtd. Filhos',
    EmailAddress AS 'E-mail',
    CASE
        WHEN Gender = 'F' AND TotalChildren > 0 THEN 'Sorteio Mãe do Ano'
        WHEN Gender = 'M' AND TotalChildren > 0 THEN 'Sorteio Pai do Ano'
        ELSE 'Sorteio Caminhão de Prêmios'
    END AS 'Ação de Marketing'
FROM
    DimCustomer

--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*6. Descubra qual é a loja que possui o maior tempo de atividade (em dias). Você deverá fazer essa 
consulta na tabela DimStore, e considerar a coluna OpenDate como referência para esse cálculo. 
Atenção: lembre-se que existem lojas que foram fechadas.*/
select * from DimStore
	
select
	StoreName,
	DATEDIFF(DAY,OpenDate,GETDATE()) as 'Total dias aberta',
	case
		when CloseDate is null then 'Aberto'
		else 'Fechado desconsirar'
	end as 'Status'
from DimStore

--solução professor
SELECT
    StoreName,
    OpenDate,
    CloseDate,
    CASE
        WHEN CloseDate IS NULL THEN DATEDIFF(DAY, OpenDate, GETDATE())
        ELSE DATEDIFF(DAY, OpenDate, CloseDate)
    END AS 'Dias de atividade'
FROM DimStore

