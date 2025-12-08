-- Criando a primeira Tabela.
-- Crie uma tabela chamada 'Produtos'
-- Essa tabela deve conter 4 colunas: id_produto, nome_produto, data_validade e preco_produto.
-- Certifique-se de que o tipo das colunas está correto.

--Esse eo padrão para se criar uma tabela
use BDImpressionador

create table Produtos(
	id_produto int identity(1,1) PRIMARY KEY,
	nome_produto varchar(200),
	data_validade datetime,
	preco_produto float
)

--OBS: A orde do campo a ser preenchido de produtor não importa com tanto que siga a mesma orden no momento de preencher.
insert into Produtos(id_produto, nome_produto, data_validade, preco_produto)
values
	('Arroz', '31/12/2001', 22.50),
	('Feijão', '20/11/2022', 8.99)

--UPDATE atualizaçõa da coluna
UPDATE Produtos
set nome_produto = 'Macarrão'
where id_produto = 3

--DELETE como para excluir dados
DELETE from Produtos
where id_produto = 3

--deleta toda a tabela
drop table Produtos


/*
--Adicionando dados a minha tabela
insert into Produtos(id_produto, nome_produto, data_validade, preco_produto)
--Esta estrura faz referencia a outra tabela de outro banco de dados
--Aqui fazer uma copia da tabela DimProduct do banco de dados Contoso
select
	ProductKey,
	ProductName,
	AvailableForSaleDate,
	UnitPrice
from ContosoRetailDW.dbo.DimProduct
*/

