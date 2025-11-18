-- CASE: A função CASE permite tratar condições no SQL

/* CASE
     WHEN teste_logico THEN 'resultado1'
     ELSE 'resultado2'
   END
*/

-- Determine a situação do aluno. Média >= 6: aprovado. Caso contrário: reprovado.
 declare @nota float
 set @nota = 4

 select
    case
        when @nota >= 6 then 'Aprovado'
        else 'Reprovado'
    end

-- A data de vencimento de um produto é no dia 18/08/2022. Faça um teste lógico para verificar se um produto passou da validade ou não.
 declare @a_Vencer datetime,  @dataAtual datetime
 set @a_Vencer = '18/08/2022'
 set @dataAtual = '30/04/2020'

 select
    case
        when @a_Vencer > @dataAtual then 'Na validade'
        else 'Vencido'
    end
