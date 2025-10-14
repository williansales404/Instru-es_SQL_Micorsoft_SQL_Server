--MÓDULO 9: EXERCÍCIOS 
--1. Declare 4 variáveis inteiras. Atribua os seguintes valores a elas: 
--valor1 = 10
declare @Valor1 int
set @Valor1 = 10
--valor2 = 5
declare @Valor2 int
set @Valor2 = 5
--valor3 = 34
declare @valor3 int
set @valor3 = 34
--valor4 = 7 
declare @valor4 int
set @valor4 = 7
--a) Crie uma nova variável para armazenar o resultado da soma entre valor1 e valor2. Chame essa variável de soma.
declare @soma1 int = @valor1 + @valor2
select 'Soma: '  + CAST(@soma1 as varchar(30)) as 'Soma'
--b) Crie uma nova variável para armazenar o resultado da subtração entre valor3 e valor 4. Chame essa variável de subtracao.
declare @subtracao2 int = @valor3 - @valor2
select 'Soma: ' + CAST(@subtracao2 as varchar(30)) as 'Soma'
--c) Crie uma nova variável para armazenar o resultado da multiplicação entre o valor 1 e o valor4. Chame essa variável de multiplicacao.
declare @multiplicacao int = @valor1 * @valor4
select 'Multiplicação: ' + CAST(@multiplicacao as varchar(30)) as 'Multiplicação'
--d) Crie uma nova variável para armazenar o resultado da divisão do valor3 pelo valor4. Chame essa variável de divisao. Obs: O resultado deverá estar em decimal, e não em inteiro.
declare @divisao float = @valor3 / cast(@valor4 as float)
select 'Divisão ' + CAST(@divisao as varchar(30)) as 'Divisão'
--e) Arredonde o resultado da letra d) para 2 casas decimais.
select round(@divisao, 2) as 'Arredondamento da divisão'
--/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

--2. Para cada declaração das variáveis abaixo, atenção em relação ao tipo de dado que deverá ser especificado.
--a) Declare uma variável chamada ‘produto’ e atribua o valor de ‘Celular’.
declare @varProduto varchar(30)
set @varProduto = 'Celular'
--b) Declare uma variável chamada ‘quantidade’ e atribua o valor de 12.
declare @varQuantidade int
set @varQuantidade = 12
--c) Declare uma variável chamada ‘preco’ e atribua o valor 9.99.
declare @varPreço float
set @varPreço = 9.99
--d) Declare uma variável chamada ‘faturamento’ e atribua o resultado da multiplicação entre ‘quantidade’ e ‘preco’.
declare @varFaturamento float = @varQuantidade * @varPreço
--e) Visualize o resultado dessas 4 variáveis em uma única consulta, por meio do SELECT.
select @varProduto +', QDT: ' + cast(@varQuantidade as varchar(30)) 
					+ ', Preço: ' + CAST(@varPreço as varchar(30)) +', total: ' + CAST(@varFaturamento as varchar(30)) as 'Tag Produto'
--/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/*3. Você é responsável por gerenciar um banco de dados onde são recebidos dados externos de usuários. Em resumo, esses dados são: - Nome do usuário - Data de nascimento - Quantidade de pets que aquele usuário possui Você precisará criar um código em SQL capaz de juntar as informações fornecidas por este usuário. Para simular estes dados, crie 3 variáveis, chamadas: nome, data_nascimento e num_pets. Você deverá armazenar os valores ‘André’, ‘10/02/1998’ e 2, respectivamente. O resultado final a ser alcançado é mostrado no print abaixo: Dica: você precisará utilizar as funções CAST e FORMAT para chegar no resultado.*/
declare @nome varchar(30), @data_nascimento datetime, @num_pets int
set @nome = 'andre'
set @data_nascimento = '10/02/1998'
set @num_pets = 2
print 'Meu nome e '+@nome+', Nascido em '+ format(@data_nascimento, 'dd/MM/yyyy')+', tenho pests ' + cast(@num_pets as varchar(30))
--/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/*4. Você acabou de ser promovido e o seu papel será realizar um controle de qualidade sobre as lojas da empresa.  
A primeira informação que é passada a você é que o ano de 2008 foi bem complicado para a empresa, pois foi quando duas das principais lojas fecharam.
O seu primeiro desafio é descobrir o nome dessas lojas que fecharam no ano de 2008, para que você possa entender o motivo e mapear planos de ação para
evitar que outras lojas importantes tomem o mesmo caminho. 
O seu resultado deverá estar estruturado em uma frase, com a seguinte estrutura: ‘As lojas fechadas no ano de 2008 foram:  ’ + nome_das_lojas  
Obs: utilize o comando PRINT (e não o SELECT!) para mostrar o resultado.*/

select StoreName, CloseDate from DimStore
where  FORMAT(CloseDate, 'yyyy') = 2008 -- solução com formatação de closedate retornado somente ano
--where CloseDate >= CAST('2008-01-01 00:00:00.000' as date) and CloseDate <= CAST('2008-12-31 00:00:00.000' as date)
--where CloseDate between CAST('2008-01-01 00:00:00.000' as date) and CAST('2008-12-31 00:00:00.000' as date)

declare @nome_das_lojas varchar(100)
set @nome_das_lojas = ''
select
	@nome_das_lojas = @nome_das_lojas + StoreName + ', ' + CHAR(10)
from DimStore
where CloseDate between CAST('2008-01-01' as date) and CAST('2008-12-31' as date)
print 'As lojas fechadas no ano de 2008 foram: '+ CHAR(10) + @nome_das_lojas
--/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/*5. Você precisa criar uma consulta para mostrar a lista de produtos da tabela DimProduct para 
uma subcategoria específica: ‘Lamps’.  
Utilize o conceito de variáveis para chegar neste resultado.*/
select * from DimProduct

declare @consulta varchar(50)
select top(1) @consulta = ProductSubcategoryName from DimProductSubcategory
where ProductSubcategoryName = 'Lamps'

select 
	distinct ProductName,
	DimProductSubcategory.ProductSubcategoryName
from DimProduct
	inner join DimProductSubcategory
		on DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
where DimProductSubcategory.ProductSubcategoryName = @consulta
group by ProductName, DimProductSubcategory.ProductSubcategoryName


--solução professor--------------------------------------------------------------------------------------------------------------------
declare @varNameSubcategoria varchar(50), @varIdSubcategoria int
set @varNameSubcategoria = 'Lamps'
set @varIdSubcategoria = (select ProductSubcategoryKey from DimProductSubcategory where ProductSubcategoryName = @varNameSubcategoria)
--select @varIdSubcategoria

select * from DimProduct
where ProductSubcategoryKey = @varIdSubcategoria