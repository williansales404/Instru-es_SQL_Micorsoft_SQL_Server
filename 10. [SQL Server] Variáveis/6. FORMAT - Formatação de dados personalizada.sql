-- 3) FORMAT: Função para formatação de valores no SQL
--Todo retorno de format e um texto

-- a) Numéricos:
-- SELECT FORMAT(valor, formato)
	select FORMAT(1000, 'n') --com separa de milhar e decimal
	select FORMAT(1000, 'g') --inteiro

-- b) Personalizados:
	select FORMAT(12345678910, '###-###-###-##')

-- c) Data
	select FORMAT(cast('2025/01/01' as datetime), 'dd/MM/yyyy')
	select FORMAT(cast('2025/01/01' as datetime), 'dd/MMM/yyyy')
	select FORMAT(cast('2025/01/01' as datetime), 'dd/MMMM/yyyy')
	select FORMAT(cast('2025/01/01' as datetime), 'ddd')
	select FORMAT(cast('2025/01/01' as datetime), 'dddd')
	select FORMAT(cast('03/06/2025' as datetime), 'dd/MMM/yyyy')

--Exercício 3: Crie uma consulta juntando o texto 'A data de validade do produto é: ' com a data 17/Abr/2022.
--Obs: Você deverá usar o CAST para garantir que a data é entendida com o tipo DATETIME.

--Não e necessario passar FORMAT(cast('01/04/2025' as datetime), 'dd/MMM/yyyy') para varchar pois data retorna como texto
select  cast('A data de validade do produto é: ' + FORMAT(cast('01/04/2025' as datetime), 'dd/MMM/yyyy') as varchar(50))

--Aqui confirma que o retorno de datetime e texto
select  'A data de validade do produto é: ' + FORMAT(cast('01/04/2025' as datetime), 'dd/MMM/yyyy')