-- FORMAT: Formata um valor de acordo com uma formatação
--1. Formatação de número
-- 5123
-- Geral
	select FORMAT(5123, 'G')
-- Número
	select FORMAT(5123, 'N')
-- Moeda
	select FORMAT(5123, 'C')

--2. Formatação de Data
-- 23/04/2020
-- dd/MM/yyyy
select format(cast('23/04/2020' as datetime), 'dd/MMMM/yyyy', 'pt-BR') --Terceiro argumento opicional de format muda o idioma
-- dia
select format(cast('23/04/2020' as datetime), 'dddd')

--Mês
select format(CAST('23/04/2025' as datetime), 'MMM')

--Ano
select format(CAST('23/04/2025' as datetime), 'yyyy')
select format(CAST('23/04/2025' as datetime), 'yy')

--3. Formatação Personalizada
--1234567 --> 12-34-567
select FORMAT(1234567, '##-##-###') -- O '#' para o format ele identifica como numero