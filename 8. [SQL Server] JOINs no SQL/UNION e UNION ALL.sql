--UNION e UNION ALL
select * from DimCustomer
where Gender = 'F'
union
select * from DimCustomer
where Gender = 'M'

--------------------------------------------------------------
--o union uni as tabelas mas exclui as dublicadas, o union all tras todas as informações incluindo as dublicadas

select FirstName, BirthDate from DimCustomer
where Gender = 'F'
union all
select FirstName, BirthDate from DimCustomer
where Gender = 'M'
