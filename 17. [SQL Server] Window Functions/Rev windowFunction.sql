/*select * from DimProduct
--Usando CTE
go
with cte_product as (
	select
		Distinct BrandName as [Nome_Loja],
		count(ProductName) over(partition by BrandName) as [Qtd_Funcinarios],
		count(ProductName) over() as [total]
	from DimProduct
)
select 
	cte_product.[Nome_Loja],
	cte_product.Qtd_Funcinarios,
	FORMAT(cte_product.Qtd_Funcinarios / cast(cte_product.total as decimal(10,2)), '0.00%') as Parte_do_total
	
from cte_product
go

--Calculo da partes
select
	Distinct BrandName as Nome_Loja,
	count(ProductName) over(partition by BrandName) as Qtd_Funcinarios,
	FORMAT(cast(count(ProductName) over(partition by BrandName) as decimal(10,2)) / count(ProductName) over(), '0.00%'),
	count(ProductName) over() as total
from DimProduct*/

/*--criando tabela para estudo
create database WF
use WF

create table Lojas(
	ID_Loja int,
	Nome_Loja varchar(100),
	Regiao varchar(100),
	Qtd_Vendida float
)

insert into Lojas(ID_Loja, Nome_Loja, Regiao, Qtd_Vendida)
values
(1, 'Botafogo Praia&Mar', 'Sudeste', 1800),
(2, 'Lojas Vitoria', 'Sudeste', 800),
(3, 'Emporio Mineirinho', 'Sudeste', 2300),
(4, 'Central Paulista', 'Sudeste', 1800),
(5, 'Rio 90 graus', 'Sudeste', 700),
(6, 'Casa Flor & Anópolis', 'Sul', 2100),
(7, 'Pampas & Co', 'Sul', 990),
(8, 'Paraná Papéis', 'Sul', 2800),
(9, 'Amazonas Prime', 'Norte', 4200),
(10, 'Pará Bens', 'Norte', 3200),
(11, 'Tintas Rio Branco', 'Norte', 1500),
(12, 'Nordestemido Hall', 'Nordeste', 1910),
(13, 'Cachoeirinha Loft', 'Nordeste', 2380)*/

select * from Lojas

select
	ID_Loja,
	Nome_Loja,
	Regiao,
	Qtd_Vendida,
	FORMAT(cast(Qtd_Vendida as decimal(8, 2)) / SUM(Qtd_Vendida) over(partition by Regiao), '0.00%') as '% Por Região',
	FORMAT(Qtd_Vendida / SUM(Qtd_Vendida) over(), '0.00%') as '% Do_Total',
	max(Qtd_Vendida) over(partition by Regiao)
from Lojas
order by ID_Loja

select
	Regiao,
	sum(Qtd_Vendida) as 'Total Vendido',
	RANK() over(order by sum(Qtd_Vendida) desc) as 'Rank'
from Lojas
group by Regiao
order by [Total Vendido] desc



--criação de tabela
/*CREATE TABLE Resultado(
    Data_Fechamento DATETIME,
    Mes_Ano VARCHAR(100),
    Faturamento_MM FLOAT
);

INSERT INTO Resultado(Data_Fechamento, Mes_Ano, Faturamento_MM)
VALUES
('01/01/2020', 'JAN-20', 8),
('01/02/2020', 'FEV-20', 10),
('01/03/2020', 'MAR-20', 6),
('01/04/2020', 'ABR-20', 9),
('01/05/2020', 'MAI-20', 5),
('01/06/2020', 'JUN-20', 4),
('01/07/2020', 'JUL-20', 7),
('01/08/2020', 'AGO-20', 11),
('01/09/2020', 'SET-20', 9),
('01/10/2020', 'OUT-20', 12),
('01/11/2020', 'NOV-20', 11),
('01/12/2020', 'DEZ-20', 10);*/

-- media movel e soma movel
select 
	*,
	--considera a linha atual e 1 anterior
	sum(Faturamento_MM) over(order by Data_Fechamento rows between 1 preceding and current row) as 'Soma movel',
	--considera a linha atual e 1 anterior
	avg(Faturamento_MM) over(order by Data_Fechamento rows between 1 preceding and current row) as 'Media movel',
	--pega todas as linhas desde o início da partição até a linha atual.
	sum(Faturamento_MM) over(order by Data_fechamento rows between unbounded preceding and current row) as 'Acumulado',
	--Soma a linha atual com a proxima linha
	sum(Faturamento_MM) over(order by Data_fechamento rows between current row and 1 following) as 'Soma movel'
from Resultado

--função Offset (Deslocamento) lag e lead
select
	*,
	lag(Faturamento_MM, 1, 0) over(order by Data_Fechamento) as 'lag',
	lead(Faturamento_MM, 1, 0) over(order by Data_Fechamento) as 'lead'
from Resultado

--Calculo MoM
select 
	*,
	FORMAT(Faturamento_MM/lag(Faturamento_MM, 1)  over(order by Data_Fechamento) -1, '0.00%') as 'MoM',
	FORMAT(Faturamento_MM/ nullif(lag(Faturamento_MM, 1, 0)  over(order by Data_Fechamento), 0) -1, '0.00%') as 'MoM'
from Resultado

select
	*,
	FIRST_VALUE(Faturamento_MM) over(order by Data_Fechamento) as 'Primeiro valor',
	LAST_VALUE(Faturamento_MM) over(order by Data_Fechamento rows between unbounded preceding and unbounded following) as 'Ultimo valor'
from Resultado
