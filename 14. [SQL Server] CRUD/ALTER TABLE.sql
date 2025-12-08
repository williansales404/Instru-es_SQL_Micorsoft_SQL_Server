-- ALTER TABLE: Adicionar colunas, Alterar tipo de dados de uma coluna e Deletar coluna
-- Utilize a tabela Funcionarios mostrada na aula anterior.
use BDImpressionador
go

SELECT * FROM Funcionarios

-- Adicionar coluna:
alter table Funcionarios
add cargo varchar(100), bonus float

update Funcionarios
set cargo = 'Anlista', bonus = 0.15
where id_funcionario = 1

-- Alterar o dipo de dados de uma coluna
alter table funcionarios
alter column salario int

-- Deletar uma coluna
alter table funcionarios
drop column cargo, bonus