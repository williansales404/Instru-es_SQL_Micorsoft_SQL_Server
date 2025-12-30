-- ANY, SOME e ALL

/*CREATE TABLE funcionarios(
  id_funcionario INT,
  nome VARCHAR(50),
  idade INT,
  sexo VARCHAR(50)
);

INSERT INTO funcionarios(id_funcionario, nome, idade, sexo)
VALUES
  (1, 'Julia', 20, 'F'),
  (2, 'Daniel', 21, 'M'),
  (3, 'Amanda', 22, 'F'),
  (4, 'Pedro', 23, 'M'),
  (5, 'André', 24, 'M'),
  (6, 'Luisa', 25, 'F');
*/
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
-- Selecione os funcionários do sexo masculino
--ANY poderia ser substituido pelo SOME tem a mesma funcionalidade, o mais usado e o ANY
select * from funcionarios
where idade in (select idade from funcionarios where sexo = 'M')

--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*
= ANY(valor1, valor2, valor3) :
    Equivalente ao IN, retorna as linhas da tabela que sejam iguais ao valor1, OU valor2, OU valor3
*/
select * from funcionarios
where idade = any (select idade from funcionarios where sexo = 'M')

/*
> ANY(valor1, valor2, valor3) :
    Retorna as linhas da tabela com valores maiores que o valor1, OU valor2, OU valor3. Ou seja, maior que o mínimo
*/
select * from funcionarios
where idade > any (select idade from funcionarios where sexo = 'M')

/*
< ANY(valor1, valor2, valor3) :
    Retorna as linhas da tabela com valores menores que o valor1, OU valor2, OU valor3. Ou seja, menor que o máximo
*/
select * from funcionarios
where idade < any (select idade from funcionarios where sexo = 'M')

--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*
> ALL(valor1, valor2, valor3) :
    Retorna as linhas da tabela contendo valores maiores que valor1, E valor2, E valor3. Ou seja, maior que o máximo
*/
select * from funcionarios
where idade > all (select idade from funcionarios where sexo = 'M')

/*
< ALL(valor1, valor2, valor3) :
    Retorna as linhas da tabela contendo valores menores que valor1, E valor2, E valor3. Ou seja, menor que o mínimo
*/
select * from funcionarios
where idade < all (select idade from funcionarios where sexo = 'M')




