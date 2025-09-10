-- order by, ao ser executado automaticamente sua ordem e do menor para o maior, para mudar do maior para o menor usa desc

-- seleciona as 100 primeiras linhas ordem decresente maior para menor
select top(100) * from DimStore  
order by EmployeeCount desc