-- TRANSLATE e STUFF: Outras funções de substituição
-- TRANSLATE: Substitui cada caractere na ordem encontrada no texto

select TRANSLATE('10.241/444.124k23/1', './k', '---')

select TRANSLATE('ABCD-490123', 'ABCD', 'WXYZ')
/*A sequencia de caracteres do segundo argumento de translate
sera substituido pelo terceiro argumento,
obs este tem que ter a mesma quantidade de caracter do segundo*/
--EX: W = A, X = B, Y = C, Z = D
--////////////////////////////////////////////////////////////////////////

-- STUFF: Substitui qualquer texto com uma quantidade de caracteres limitados, por um outro texto
 select STUFF('VBA Impressionador',1, 3, 'Excel')

 select STUFF('VBA Impressionador', 5, 14, 'Excel')
 /*stuff tem 3 argumento,
 1 o texto principal, 
 2 posição de onde vai começar a substituição,
 3 quantidade de caracter do texto a ser substituido incluindo espaço se houver,
 4 texto novo para substituir o anteior*/

 --EX: com codigo
 SELECT
    STUFF('MT98-Moto G', 1, 2, 'CEL'),
    STUFF('AP01-IPhone', 1, 2, 'CEL'),
    STUFF('SS61-Samsung Galaxy', 1, 2, 'CEL')

select * from DimProduct

select
	STUFF(StyleName, 1, 7, 'Product_USA')
from DimProduct

select 
	ProductName,
	TRANSLATE(ProductDescription, ' ', '_')
from DimProduct
