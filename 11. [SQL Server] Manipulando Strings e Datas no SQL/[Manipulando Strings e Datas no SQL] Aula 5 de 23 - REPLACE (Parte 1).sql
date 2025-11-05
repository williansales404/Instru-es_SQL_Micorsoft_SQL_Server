-- REPLACE: Substitui um determinado texto por outro texto
-- No texto 'O Excel é o melhor', substitua 'Excel' por 'SQL'
select REPLACE('O Excel é o melhor', 'Excel', 'SQL')


-- Crie uma consulta a partir de DimCustomer onde você retorna o Nome Completo dos Clientes, 
-- a coluna de Sexo (Abrev) e uma outra coluna de Sexo substituindo M por Masculino e F por Feminino
SELECT
	CONCAT(FirstName,' ',LastName) as 'Nome Completo',
	Gender,
	REPLACE(REPLACE(Gender,'M','Masculino'),'F','Feminino')
FROM DimCustomer
/*REPLACE aninhado observar se o texto a ser substituido não tem menção dele no anterio
pois se Feminino fosse substituido primeiro o texto a ser substituido por 'M' iria ser incrementado tambem em Feminino pois nessa frase tem a letra 'm'*/
