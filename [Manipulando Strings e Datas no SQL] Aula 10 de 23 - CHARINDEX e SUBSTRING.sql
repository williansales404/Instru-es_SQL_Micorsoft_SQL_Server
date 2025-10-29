-- CHARINDEX: Descobre a posição de um determinado caractere dentro de um texto
-- SUBSTRING: Extrai alguns caracteres de dentro de um texto

--SELECT 'Raquel Moreno' AS 'Nome'
--Descubra a posição em que começa o sobrenome da Raquel utilizando a função CHARINDEX


select CHARINDEX(' ', 'Proseware 23ppm Laser Printer with Wireless and Wired Network Interfaces M680 Black',(CHARINDEX(' ', 'Proseware 23ppm Laser Printer with Wireless and Wired Network Interfaces M680 Black')+1))
--charindex acima pega o segundo posição de espaço

-- Extraia o sobrenome da Raquel utilizando a função SUBSTRING
select SUBSTRING('Raquel Moreno', 8, 6)

--Combine as funções CHARINDEX e SUBSTRING para extrair de forma automática qualquer sobrenome

declare @name varchar(50)
set @name = 'Proseware 23ppm Laser Printer with Wireless and Wired Network Interfaces M680 Black'
select SUBSTRING(@name,CHARINDEX(' ', @name) + 1,100)

