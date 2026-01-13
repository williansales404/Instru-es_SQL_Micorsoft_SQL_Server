Declare @varContator int = 1

while @varContator <= 10
begin
	print 'O contato e :' + convert(varchar, @varContator)
	set @varContator = @varContator + 1
end