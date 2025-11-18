-- Crie uma coluna para substituir o 'M' por 'Masculino' e 'F' por feminino. Verifique se será necessário fazer alguma correção.

SELECT
    CustomerKey,
    FirstName,
    Gender,
    CASE
        WHEN Gender = 'M' THEN 'Masculino'
        WHEN Gender = 'F' THEN 'Feminino'
        ELSE 'Empresa'
    END AS 'Sexo'
FROM
    DimCustomer
