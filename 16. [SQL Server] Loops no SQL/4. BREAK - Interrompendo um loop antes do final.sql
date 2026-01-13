-- Loop While: BREAK
-- Faça um contador de 1 a 100. OBS: Se o valor do contador for igual a 15, então o loop WHILE deve ser encerrado.

declare @varContador int = 1

while @varContador <= 100
begin
	print 'O contador e :' + convert(varchar, @varContador)
	if(@varContador = 15)
	break
	set @varContador += 1
end