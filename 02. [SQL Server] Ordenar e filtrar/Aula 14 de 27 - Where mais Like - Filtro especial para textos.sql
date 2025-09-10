--usando a função like, para que o like verifique em um texto se contem determinado trecho de texto usase '%texto%' no incio e no final
select * from DimProduct
where ProductName like '%MP3 Player%'

select * from DimProduct
where ProductDescription like 'Type%'

select * from DimProduct
where ProductDescription like '%WMA'

