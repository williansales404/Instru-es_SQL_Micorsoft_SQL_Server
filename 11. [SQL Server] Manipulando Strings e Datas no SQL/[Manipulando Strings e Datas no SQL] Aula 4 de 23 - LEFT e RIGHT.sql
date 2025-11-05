-- LEFT ---> Extrai uma determinada quantidade de caracteres de um texto, da esquerda para a direita  
-- RIGHT ---> Extrai uma determinada quantidade de caracteres de um texto, da direita para a esquerda  

-- Faça uma consulta à tabela DimProduct e divida a coluna de StyleName em 2 partes.
select * from DimProduct

select 
	ProductName,
	UnitPrice,
	LEFT(StyleName, 7) as 'cod_1', --extrai o texto da esquerda para a direita left
	RIGHT(StyleName, 7) as 'cod_2' --extrai o texto da direita para a esquerda rigth
from DimProduct

select LEFT('Proseware 23ppm Laser Printer with Wireless and Wired Network Interfaces M680 Black', 16)