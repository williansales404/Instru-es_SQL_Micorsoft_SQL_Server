/*Cuidados ao utilizar o AND em conjunto com o OR
Exemplo: Selecione todas as linhas da tabela dimProduct onde a cor do Produto pode ser igual a Preto OU Vermelho, MAS a marca deve ser obrigatoriamente igual a Fabrikam.*/

--OBS: aqui vai usar os parenteses para garante que primeiro verifique as cores e depois a marca.
select * from DimProduct
 where (ColorName = 'Black' or ColorName = 'Red') and BrandName = 'Fabrikam'