create table carro_aux(
	id_carro int,
	placa varchar(250),
	modelo varchar(250),
	tipo varchar(250)
)

insert into carro_aux(id_carro, placa, modelo, tipo) values
	(1, 'DAS-1412', 'Hyundai HB20', 'Hatch'),
	(2, 'JHG-3902', 'Fiat Cronos', 'Sedan'),
	(3, 'IPW-9018', 'Citroen C4 Cactus', 'SUV'),
	(4, 'JKR-8891', 'Nissa Kicks', 'SUV'),
	(5, 'TRF-5904', 'Chevrolet Onix', 'Sedan');

begin transaction T1
	insert into carro_aux(id_carro, placa, modelo, tipo) values
				('6', ' CDR-0090', 'Fiat Argo', 'Hatch')
commit transaction T1

begin transaction T2
update carro_aux
set tipo = 'Sedan'
where id_carro = 1
commit transaction T2

begin transaction
delete from carro_aux
where id_carro = 6
commit transaction

 

select * from carro_aux

--//--
