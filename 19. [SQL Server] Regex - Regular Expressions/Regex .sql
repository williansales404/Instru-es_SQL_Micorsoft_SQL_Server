use ContosoRetailDW

select * from DimProduct

select ProductName from DimProduct
where ProductName like '%[M-m][P-p][0-9]%'

select ProductName, BrandName from DimProduct
where BrandName like '[CW]%'
