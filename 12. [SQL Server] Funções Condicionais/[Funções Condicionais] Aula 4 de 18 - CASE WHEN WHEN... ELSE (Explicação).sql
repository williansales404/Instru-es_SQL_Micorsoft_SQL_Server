--CASE: A função CASE permite tratar condições no SQL

/* CASE:
     WHEN teste_logico1 THEN 'resultado1'
     WHEN teste_logico2 THEN 'resultado2'
     ELSE 'resultado3'
END

Exemplo:

Crie um código para verificar a nota do aluno e determinar a situação:
- Aprovado: nota maior ou igual a 6
- Prova final: nota entre 4 e 6
- Reprovado: nota abaixo de 4

DECLARE @varNota FLOAT

SET @varNota = 1

SELECT
     CASE
          WHEN @varNota >= 6 THEN 'Aprovado'
          WHEN @varNota >= 4 THEN 'Prova final'
          ELSE 'Reprovado'
     END
*/

-- Classifique o produto de acordo com o seu preço:
-- Preço >= 40000: Luxo
-- Preço >= 10000 e Preço < 40000: Econômico
-- Preço < 10000: Básico

declare @preco float = 5000

select
    case
        when @preco >= 40000 then 'Luxo'
        when @preco >= 10000 then 'Econômico'
        else 'Básico'
    end