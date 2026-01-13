-- Loop While: CONTINUE
-- Faça um contador de 1 a 10. OBS: Os números 3 ou 6 não podem ser printados na tela
declare @varContador int = 0

while @varContador < 10
begin
	set @varContador += 1
	if(@varContador = 3 or @varContador = 6)
	continue
	print 'Conatador e :' + convert(varchar, @varContador)
end