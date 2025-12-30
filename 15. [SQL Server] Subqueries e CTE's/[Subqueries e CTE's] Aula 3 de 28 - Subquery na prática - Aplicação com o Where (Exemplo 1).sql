/*
Para entender a ideia por trás das subqueries, vamos começar fazendo 3 exemplos com a aplicação WHERE.
No Exemplo 1, imagine que você queira fazer uma consulta à tabela DimProduct e considerar apenas os produtos com custos acima da média. Como poderíamos fazer isso?*/
select
	*
from DimProduct
	where UnitCost >= (select AVG(UnitCost) from DimProduct)

