-- usando a função IN
select * from DimProduct
where ColorName in ('Silver','Blue','White','Red','Black')
------------------------------------------------------------------

select * from DimEmployee
where DepartmentName in('Marketing','Engineering','Production')