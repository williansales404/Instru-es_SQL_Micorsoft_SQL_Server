-- CHARINDEX: Descobre a posi��o de um determinado caractere dentro de um texto
-- SUBSTRING: Extrai alguns caracteres de dentro de um texto

--SELECT 'Raquel Moreno' AS 'Nome'
--Descubra a posi��o em que come�a o sobrenome da Raquel utilizando a fun��o CHARINDEX


select CHARINDEX(' ', 'Proseware 23ppm Laser Printer with Wireless and Wired Network Interfaces M680 Black',(CHARINDEX(' ', 'Proseware 23ppm Laser Printer with Wireless and Wired Network Interfaces M680 Black')+1))
--charindex acima pega o segundo posi��o de espa�o

-- Extraia o sobrenome da Raquel utilizando a fun��o SUBSTRING
select SUBSTRING('Raquel Moreno', 8, 6)

--Combine as fun��es CHARINDEX e SUBSTRING para extrair de forma autom�tica qualquer sobrenome

declare @name varchar(50)
set @name = 'Proseware 23ppm Laser Printer with Wireless and Wired Network Interfaces M680 Black'
select SUBSTRING(@name,CHARINDEX(' ', @name) + 1,100)

