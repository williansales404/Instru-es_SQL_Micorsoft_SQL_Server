--Agrupamento sql
select * from DimProduct

select BrandName as 'Marca', count(*) as 'Qtd.Produtos' from DimProduct
group by BrandName