--Exercicio
/*1. Utilize o Loop While para criar um contador que comece em um valor inicial @ValorInicial e 
termine em um valor final @ValorFinal. Você deverá printar na tela a seguinte frase: 
“O valor do contador é: “ + ___*/
declare @varContador int = 0
while @varContador < 10
begin
	set @varContador += 1
	print 'O valor do contador e: ' + convert(varchar, @varContador)
end

--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*2. Você deverá criar uma estrutura de repetição que printe na tela a quantidade de contratações 
para cada ano, desde 1996 até 2003. A informação de data de contratação encontra-se na 
coluna HireDate da tabela DimEmployee. Utilize o formato: 
X contratações em 1996 
Y contratações em 1997 
Z contratações em 1998 
N contratações em 2003 */

declare @Ano int = 1996
declare @qtd int

select count(*) as qtd, YEAR(HireDate) as data from DimEmployee group by YEAR(HireDate)

while @Ano <= 2003
begin
	select @qtd = count(*) from DimEmployee where YEAR(HireDate) = @Ano group by YEAR(HireDate)

	print convert(varchar, @qtd) +' Qtd.Contrato '+ 'Ano ' + convert(varchar, @Ano)
	
	set @Ano += 1
end

--Solução Professor
DECLARE @AnoInicial INT = 1996
DECLARE @AnoFinal INT = 2003

WHILE @AnoInicial <= @AnoFinal
BEGIN
    DECLARE @QtdFuncionarios INT = (SELECT COUNT(*) FROM DimEmployee
                                    WHERE YEAR(HireDate) = @AnoInicial)

    PRINT CONCAT(@QtdFuncionarios, ' contratações em ', @AnoInicial)
    SET @AnoInicial = @AnoInicial + 1
END


--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*3. Utilize um Loop While para criar uma tabela chamada Calendario, contendo uma coluna que 
comece com a data 01/01/2021 e vá até 31/12/2021.*/
declare @vardata int = 1
declare @dia int = 1

while @vardata <= 12
begin
		while @dia <= 31
		begin
			print convert(varchar, @dia) +'/'+ convert(varchar, @vardata) +'/'+'2021'
			set @dia += 1
		end
	set @dia = 1
	set @vardata += 1
end

--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

create table tb_data(
	DataAno date
)

declare @varDataC date = '01/01/2021'
declare @varMes int = 0
declare @varDia int = 0

while @varMes < 12
begin
		while @varDia < 31
		begin
			insert into tb_data(DataAno)
			values(DATEADD(DAY, @varDia,DATEADD(Month, @varMes, @varDataC)))
			SET @varDia += 1
		end
	SET @varMes += 1
	SET @varDia = 0
end

select * from tb_data

--Solução Professor
CREATE TABLE Calendario (
    Data DATE
)

DECLARE @DataInicio DATE = '01/01/2021'
DECLARE @DataFim DATE = '31/12/2021'

WHILE @DataInicio <= @DataFim
BEGIN
    INSERT INTO Calendario (Data) VALUES (@DataInicio)
    SET @DataInicio = DATEADD(DAY, 1, @DataInicio) --OBS o mês eo Ano vira automaticamente
END

SELECT * FROM Calendario
