--filtrando os clientes por data de nascimento
select * from DimCustomer

select * from DimCustomer
where BirthDate >= '1970-12-31'
order by BirthDate desc