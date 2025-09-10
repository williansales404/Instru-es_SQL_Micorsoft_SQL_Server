-- usando in null e is not null para verificar se da tabela e vazil e filtrar informação
--retorna as empresas PJ
select * from DimCustomer
where CompanyName is not null

-- retorna os clientes pessoa fisica
select * from DimCustomer
where CompanyName is null