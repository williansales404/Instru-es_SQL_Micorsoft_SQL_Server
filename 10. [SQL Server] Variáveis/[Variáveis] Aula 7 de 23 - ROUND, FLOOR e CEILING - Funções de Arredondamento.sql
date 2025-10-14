--Funções de arredondamento

-- ROUND 
	select ROUND(18.739130, 2) -- arredondamento o 2 e a quantidade de casas decimal
-- ROUND(Truncar) 
	select ROUND(18.739130, 2, 1) --passando o valor 1 a função entende que não e pra arredondar
-- FLOOR 
	select FLOOR(18.739130) -- arredonda para baixo
-- CEILING
	select CEILING(18.739130) -- arredonda para cima
