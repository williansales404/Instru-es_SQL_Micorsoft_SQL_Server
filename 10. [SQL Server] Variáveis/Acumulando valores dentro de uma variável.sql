-- Acumulando valores em uma variável
-- Exemplo: Printe na tela uma lista com os nomes dos funcionários do departamento de Marketing.
select 
	FirstName,
	DepartmentName
from DimEmployee
where DepartmentName = 'Marketing' and Gender = 'F'
--------------------------------------------------------------
declare @varListName varchar(50)
set @varListName = ''
select 
	@varListName = @varListName + FirstName + ', ' + CHAR(10)
from DimEmployee
where DepartmentName = 'Marketing' and Gender = 'F'
print @varListName
--------------------------------------------------------------
declare @varListName1 varchar(50)
set @varListName1 = ''
select 
	@varListName1 = @varListName1 + FirstName + ', ' + CHAR(10)
from DimEmployee
where DepartmentName = 'Marketing' and Gender = 'F'
print left(@varListName1, datalength(@varListName1) -3) 