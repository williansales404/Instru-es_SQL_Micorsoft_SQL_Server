--TIPOS DE INCREMENTO
/*
tinyint - intervalo de 0 a 255
smallint - intervalo de -32.768 a 32.767
int - intervalo de -2.147.483.648 a 2.147.483.647
bigint - intervalo -9.223.372.036.854.775.808 a 9.223.372.036.854.775.807 ** PADRÃO
decimal e numeric com uma escala de 0.
*/








create sequence cliente_seq
as int
start with 1
increment by 1
no maxvalue
no cycle

create sequence carro_seq
as int
start with 1
increment by 1
no maxvalue
no cycle

create sequence locacoes_seq
as int
start with 1
increment by 1
no maxvalue
no cycle

create table DimCliente(
	id_cliente int default next value for cliente_seq,
	nome_cliente varchar(250) not null,
	cnh varchar(100) not null,
	cartao varchar(100) not null,
	constraint DimCliente_id_cliente_pk primary key(id_cliente),
	constraint DimCliente_cnh_un unique(cnh)
)

create table DimCarro(
	id_carro int default next value for carro_seq,
	placa varchar(100) not null,
	modelo varchar(250) not null,
	tipo varchar(250) not null,
	constraint DimCarro_id_carro_pk primary key(id_carro),
	constraint DimCarro_modelo_ck check(tipo in('Hatch', 'Sedan', 'SUV')),
	constraint DimCarro_placa_un unique(placa)
)

create table FactLocacoes(
	id_locacao int default next value for locacoes_seq,
	data_locacao date default getdate(),
	data_devolucao date default getdate(),
	id_carro int,
	id_cliente  int,
	constraint FactLocacoes_id_locacao_pk primary key(id_locacao),
	constraint FactLocacoes_id_carro_fk foreign key(id_carro) references DimCarro(id_carro),
	constraint FactLocacoes_id_cliente_fk foreign key(id_cliente) references DimCliente(id_cliente)
)

select * from DimCliente
select * from DimCarro
select * from FactLocacoes

insert into DimCliente(nome_cliente, cnh, cartao)
values
	('Blue Silva', '12345678901', '4539 1488 0343 6467'),
	('Ana Costa', '98765432109', '5500 1234 5678 9012'),
	('Carlos Mendes', '45678912345', '6011 4321 8765 2109')

INSERT INTO DimCarro (placa, modelo, tipo)
VALUES
    ('JBL3C40', 'Polo','Hatch'),
    ('FRT9X21', 'Golf', 'Sedan'),
    ('PLM7K88', 'Civic', 'SUV');


INSERT INTO FactLocacoes (data_locacao, data_devolucao, id_carro, id_cliente)
VALUES
    ('2026-01-01', '2026-01-30', 3, 7),  -- Civic alugado pelo Carlos Mendes
    ('2026-02-15', '2026-02-16', 4, 5);  -- Golf alugado pelo Blue Silva

