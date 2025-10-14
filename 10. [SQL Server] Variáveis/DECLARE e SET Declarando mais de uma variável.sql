-- Declarando mais de uma variável
--Opção 1
/*declare @var1 int
declare @var2 float
declare @texto varchar(50)
declare @data datetime

set @var1 = 10
set @var2 = 11.01
set @texto = 'Um texto qualquer'
set @data = '18/02/2021'

select @var1, @var2, @texto, @data*/

--opção 2
declare @vari1 int, @vari2 float, @text varchar(50), @datas datetime

set @vari1 = 10
set @vari2 = 11.01
set @text = 'Um texto qualquer'
set @datas = '18/02/2021'

select @vari1, @vari2, @text, @datas

--opção 3

declare 
	@var1 int = 10, 
	@var2 float = 11.01, 
	@texto varchar(50) = 'um texto qualquer', 
	@data datetime = '18/02/2021'

select @var1, @var2, @texto, @data

--Exercício 1:  
--A sua loja fez uma venda de 100 camisas, cada uma custando 89.99. 
--Faça um SELECT para obter o resultado do faturamento (multiplicação da quantidade vezes o preço).
select 100 * 89.99 as 'total'

--Exercício 2:  
--Refaça o exercício anterior utilizando variáveis para deixar o cálculo mais otimizado.
declare @vendas int = 100
declare @priceUnitario float = 89.99 

select @vendas * @priceUnitario as 'total vendas'
