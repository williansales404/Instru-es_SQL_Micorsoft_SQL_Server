--Identificando o tipo de variavel  SQL_VARIANT_PROPERTY

select SQL_VARIANT_PROPERTY(10, 'Basetype') as 'Inteiro'
select SQL_VARIANT_PROPERTY(10.00, 'Basetype') as 'Decimal'
select SQL_VARIANT_PROPERTY('Alex Qrean', 'basetype') as 'Texto'
select SQL_VARIANT_PROPERTY('2025/10/01', 'basetype') as 'texto' --precisa colocar em uma variavl do tipo date para ser data