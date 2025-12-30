/*Para entender a ideia por trás das subqueries, vamos começar fazendo 3 exemplos com a aplicação WHERE.
No exemplo 3, queremos filtrar nossa tabela FactSales e mostrar apenas as vendas referentes às lojas com 100 ou mais funcionários.*/
select * from FactSales
where StoreKey in 
	(select StoreKey from DimStore
	where EmployeeCount >= 100)