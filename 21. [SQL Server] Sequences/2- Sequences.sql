-- V. SEQUENCES

-- O que é?
-- Uma sequência (Sequence) é um objeto que utilizamos para criação de números 
-- sequenciais automáticos. São usados especialmente para gerar valores sequenciais
-- únicos para as chaves primárias das tabelas.

-- Dessa forma, não precisamos ficar preenchendo a sequência de ids manualmente (como fizemos
-- até então), podemos gerar automaticamente por meio de uma sequence.

/* Sintaxe
*

CREATE SEQUENCE nome_sequencia
AS tipo
START WITH n
INCREMENT BY n
MAXVALUE n | NO MAXVALUE
MINVALUE n | NO MINVALUE
CYCLE | NO CYCLE;       -- quando atinge o valor máximo, pode ou não voltar do começo

*/

--TIPOS DE INCREMENTO
/*
tinyint - intervalo de 0 a 255
smallint - intervalo de -32.768 a 32.767
int - intervalo de -2.147.483.648 a 2.147.483.647
bigint - intervalo -9.223.372.036.854.775.808 a 9.223.372.036.854.775.807 ** PADRÃO
decimal e numeric com uma escala de 0.
*/




-- Crie uma sequência para o id_cliente

CREATE SEQUENCE clientes_seq
AS INT
START WITH 1
INCREMENT BY 1
MAXVALUE 9999999
NO CYCLE


-- Próximo valor da sequência

SELECT NEXT VALUE FOR clientes_seq


-- Excluir uma sequence
DROP SEQUENCE clientes_seq

SELECT name, start_value, increment 
FROM sys.sequences;

SELECT TABLE_NAME 
FROM INFORMATION_SCHEMA.TABLES;




-- Usando a sequence na prática

-- Crie uma sequência para o id_projeto

CREATE SEQUENCE projetos_seq
AS INT
START WITH 1
INCREMENT BY 1
NO MAXVALUE
NO CYCLE


CREATE TABLE dProjeto(
	id_projeto INT,
	nome_projeto VARCHAR(100) NOT NULL,
	CONSTRAINT dareas_id_area_pk PRIMARY KEY(id_projeto)
)


INSERT INTO dProjeto(id_projeto, nome_projeto) VALUES
	(NEXT VALUE FOR projetos_seq, 'Planejamento Estratégico'),
	(NEXT VALUE FOR projetos_seq, 'Desenvolvimento de App'),
	(NEXT VALUE FOR projetos_seq, 'Plano de Negócios'),
	(NEXT VALUE FOR projetos_seq, 'Visualização 3D')

INSERT INTO dProjeto(id_projeto, nome_projeto) VALUES
	(NEXT VALUE FOR projetos_seq, 'Mapeamento de Processos')

SELECT * FROM dProjeto