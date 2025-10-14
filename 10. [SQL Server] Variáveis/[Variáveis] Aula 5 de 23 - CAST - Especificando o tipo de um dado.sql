--Especificando o tipo de dado da variavel
-- CAST: Fun��o para especificar o tipo dos dados.
-- int: inteiro, float: decimal, varchar: string/texto, datetime: data e hora
-- CAST: usada para converter um tipo de dados para outro.


select cast(2.50 as float)
select SQL_VARIANT_PROPERTY( cast(2.0 as float),'baseType')

select cast(20.15 as int) --retorna somente o inteiro
select SQL_VARIANT_PROPERTY( CAST(20.15 as int),'basetype')

select cast('2025/01/01' as datetime) --converte string do tipo data para datetime
select SQL_VARIANT_PROPERTY(cast('2025/01/01' as datetime),'basetype')

--Exerc�cio 1: Crie uma consulta juntando o texto 'O pre�o do PASTEL �:' com o valor 30.99
select 'O pre�o do PASTEL �: ' + cast(30.99 as varchar(50))

--Exerc�cio 2: Adicione 1 � data '20/06/2021'.
select cast('20/06/2021' as datetime) + 1
 