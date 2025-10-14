-- Utilizando o PRINT para mostrar o resultado de uma consulta
SELECT * FROM DimProduct
SELECT COUNT(*) FROM DimProduct

-- Exemplo 1: Printe na tela a quantidade de lojas On e a quantidade de lojas Off da tabela DimStore. Utilize variáveis para isso.
set nocount on

declare @varTotalOn int, @varTotalOff int
set @varTotalOn = (SELECT COUNT(*) FROM DimStore where Status = 'On')
print 'total lojas abertas ' + cast(@varTotalOn as varchar(50))

set @varTotalOff = (SELECT COUNT(*) FROM DimStore where Status = 'Off')
print 'total lojas fechadas ' + cast(@varTotalOff as varchar(50))

select  @varTotalOn as 'lojas on' , @varTotalOff as 'lojas off'