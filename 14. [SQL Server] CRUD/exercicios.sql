use Exercicios
/*1.
a) Crie um banco de dados chamado BD_Teste. 
b) Exclua o banco de dados criado no item anterior. 
c) Crie um banco de dados chamado Exercicios.*/

--create database BD_Teste
--drop database BD_Teste

--create database Exercicios

--///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*2.
No banco de dados criado no exercício anterior, crie 3 tabelas, cada uma contendo as seguintes 
colunas: 
Tabela 1: dCliente - ID_Cliente - Nome_Cliente - Data_de _Nascimento 
Tabela 2: dGerente - ID_Gerente - Nome_Gerente - Data_de_Contratacao - Salario 
Tabela 3: fContratos - ID_Contrato - Data_de_Assinatura - ID_Cliente - ID_Gerente - Valor_do_Contrato

Lembre-se dos seguintes pontos: 
a) Garantir que o Banco de Dados Exercicios está selecionado. 
b) Definir qual será o tipo de dados mais adequado para cada coluna das tabelas. Lembrando que 
os tipos de dados mais comuns são: INT, FLOAT, VARCHAR e DATETIME. 
Por fim, faça um SELECT para visualizar cada tabela.*/
create table dCliente(
	ID_Cliente int identity(1,1) primary key,
	Nome_Cliente varchar(100),
	Data_de_Nascimento datetime
)

--alter table dCliente
--alter column Data_de_Nascimento date
insert into dCliente(Nome_Cliente, Data_de_Nascimento)
values
	('André Martins', '1989-02-12'),
	('Bárbara Campos', '1992-05-07'),
	('Carol Freitas', '1985-04-23'),
	('Diego Cardoso', '1994-10-11'),
	('Eduardo Pereira', '1988-11-09'),
	('Fabiana Silva', '1989-09-02'),
	('Gustavo Barb', '1993-06-27'),
	('Helen Viana', '1990-02-11')

create table dGerente(
	ID_Gerente int identity(1,1) primary key,
	Nome_Gerente varchar(100),
	Data_de_Contratacao datetime,
	Salario float
)

insert into dGerente(Nome_Gerente, Data_de_Contratacao, Salario)
values
	('Lucas Sampaio', cast('2015-03-21' as date), 6700),
	('Mariana Padilha', cast('2011-01-10' as date), 9900),
	('Nathália Santos', cast('2018-10-03' as date), 7200),
	('Otávio Costa', cast('2017-04-18' as date), 11000)

create table fContratos(
	ID_Contrato int identity(1,1) primary key,
	Data_de_Assinatura date,
	ID_Cliente int not null,
	ID_Gerente int not null,
	Valor_do_Contrato float
)

insert into fContratos(Data_de_Assinatura, ID_Cliente, ID_Gerente, Valor_do_Contrato)
values
	('2019-01-12', 8, 1, 2300),
	('2019-02-10', 3, 2, 15500),
	('2019-03-07', 7, 2, 6500),
	('2019-03-15', 3, 3, 33000),
	('2019-03-21', 5, 4, 11100),
	('2019-03-23', 4, 2, 5500),
	('2019-03-28', 9, 3, 55000),
	('2019-04-04', 2, 1, 31000),
	('2019-04-05', 10, 4, 3400),
	('2019-04-05', 6, 2, 9200)

/*--///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
4. Novos dados deverão ser adicionados nas tabelas dCliente, dGerente e fContratos. Fique livre para adicionar uma nova linha em cada tabela contendo, respectivamente.
(1) um novo cliente (id cliente, nome e data de nascimento) 
(2) um novo gerente (id gerente, nome, data de contratação e salário) 
(3) um novo contrato (id, data assinatura, id cliente, id gerente, valor do contrato)*/

--novos dados dCliente
insert into dCliente(Nome_Cliente, Data_de_Nascimento)
values
	('Moriate Blue', '1999-01-01')

--novos dados dGerente
insert into dGerente(Nome_Gerente, Data_de_Contratacao, Salario)
values
	('Sam Black', cast('2010-01-01' as date), 9700)

--novos dados fContratos
insert into fContratos(Data_de_Assinatura, ID_Cliente, ID_Gerente, Valor_do_Contrato)
values
	('2020-01-01', 8, 1, 1000)

/*5. O contrato de ID igual a 4 foi registrado com alguns erros na tabela fContratos. Faça uma 
alteração na tabela atualizando os seguintes valores: 
Data_de_Assinatura: 17/03/2019 
ID_Gerente: 2 
Valor_do_Contrato: 33500 */
update fContratos 
set Data_de_Assinatura = '17/03/2019',
	ID_Gerente = 2,
	Valor_do_Contrato = 33500
where ID_Contrato = 4

/*6. Delete a linha da tabela fContratos que você criou na questão 4.*/
delete from fContratos
where ID_Contrato = 11

select * from fContratos

select
	fContratos.*,
	dCliente.Nome_Cliente,
	dGerente.Nome_Gerente
from fContratos
	inner join dCliente
		on fContratos.ID_Cliente = dCliente.ID_Cliente
	inner join dGerente
		on fContratos.ID_Gerente = dGerente.ID_Gerente