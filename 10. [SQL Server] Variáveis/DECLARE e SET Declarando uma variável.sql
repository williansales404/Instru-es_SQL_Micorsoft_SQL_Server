--DECLARE e SET Declarando uma variável
--1) O que é uma variável?
--Uma variável é um objeto que armazena o valor de um dado.

--2) Estrutura
--DECLARE @var tipo
--SET @var = valor
--SELECT @var
declare @quantidade int
set @quantidade = 12
select @quantidade as 'QTD'

/*3) Exemplo:
Em vez de...
SELECT 1000
SELECT 1000 * 1000
SELECT FORMAT(1000 * 1000, 'N')*/

--Seria melhor...
DECLARE @numero FLOAT
SET @numero = 10

SELECT @numero
SELECT @numero * @numero
SELECT FORMAT(@numero * @numero, 'N')

-- Exemplo 1: Declare uma variável chamada 'idade' e armazene o valor 30

declare @idade int
set @idade = 30
select @idade  as 'idade'

-- Exemplo 2: Declare uma variável chamada preco e armazene o valor 10.89
declare @price float
set @price = 10.89
select @price as 'UnitPrice'

-- Exemplo 3: Declare uma variável chamada nome e armazene o valor 'Mateus'
declare @name varchar(50)
set @name = 'Mateus'
select @name as 'Name'

-- Exemplo 4: Declare uma variável chamada 'data' e armazene a data de hoje.
declare @data datetime
set @data = '20/07/2018'
select format(@data, 'dd/MMM/yyy') as 'data'