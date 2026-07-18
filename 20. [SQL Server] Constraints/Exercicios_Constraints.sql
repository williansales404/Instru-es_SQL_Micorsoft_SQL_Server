use AlugaFacil

create table DimCliente(
	id_cliente int identity(1,1),
	nome_cliente varchar(250) not null,
	cnh varchar(100) not null,
	cartao varchar(100) not null,
	constraint DimCliente_id_cliente_pk primary key(id_cliente),
	constraint DimCleinte_cnh_un unique(cnh)
)

create table DimCarro(
	id_carro int identity(1,1),
	placa varchar(100) not null,
	modelo varchar(100) not null,
	tipo varchar(100) not null,
	constraint DimCarro_id_carro_pk primary key(id_carro),
	constraint DimCarro_tipo_ck check(tipo in('Hatch', 'Sedan', 'SUV')),
	constraint DimCarro_placa_un unique(placa)
)

create table FactLocacoes(
	id_locacao int identity(1,1),
	data_locacao date not null,
	data_devolucao date not null,
	id_carro int not null,
	id_cliente int not null,
	constraint FactLocacoes_id_carro_fk foreign key(id_carro) references DimCarro(id_carro),
	constraint FactLocacoes_id_cliente_fk foreign key(id_cliente) references DimCliente(id_cliente)
)

select * from DimCliente
select * from DimCarro
select * from FactLocacoes

insert into DimCliente
values
	('Blue Silva', '12345678901', '4539 1488 0343 6467'),
	('Ana Costa', '98765432109', '5500 1234 5678 9012'),
	('Carlos Mendes', '45678912345', '6011 4321 8765 2109')

insert into DimCarro
values
	('JBL3C40', 'Polo','Hatch'),
	('FRT9X21', 'Golf', 'Sedan'),
	('PLM7K88', 'Civic', 'SUV')

insert into FactLocacoes
values
	('2026-01-01', '2026-01-30', '1', '3'),
	('2026-02-15', '2026-02-16', '2', '1')
