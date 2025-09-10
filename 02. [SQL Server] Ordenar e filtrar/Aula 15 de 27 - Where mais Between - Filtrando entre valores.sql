--between interessante para usar em intervalos de valores

select * from DimProduct
where UnitPrice Between 50 and 100
order by UnitPrice desc

-- vai tirar o intervalo desse valor da tabela com not
select * from DimProduct
where UnitPrice not Between 50 and 100

select * from DimEmployee
where HireDate between '2000-01-01' and '2000-12-31'