-- Transactions

-- 1. O que é uma transaction?
-- Uma transaction é uma ação realizada dentro do banco de dados. Essa ação pode ser uma: atualização, inserção ou exclusão de dados do banco. Precisamos de transações quando estamos alterando o banco de dados de alguma forma, seja inserindo, atualizando ou excluindo dados.

-- Normalmente, não temos muito "controle" sobre transações, a menos que a gente explicite no nosso código que queremos fazer isso. Assim, a ideia de uma transação é agrupar um conjunto de instruções a serem executadas no banco de dados, e ter a flexibilidade de:

-- a. Se algo der errado, desfazer aquela transação
-- b. Se tudo der certo, salvar aquela transação

-- O que podemos fazer com uma transaction?

-- BEGIN TRANSACTION		: iniciá-la
-- ROLLBACK TRANSACTION		: desfazê-la
-- COMMIT TRANSACTION		: salvá-la


SELECT *
INTO cliente_aux
FROM dCliente

select * from cliente_aux

-- 1. Adicionamos novas linhas (registros) na tabela
INSERT INTO cliente_aux(nome_cliente, genero, data_de_nascimento, cpf) VALUES
	('Maria Julia', 'F', '30/04/1995', '987.654.321-00')


-- 2. Atualizamos linhas (registros) da tabela
UPDATE cliente_aux
	SET nome_cliente = LOWER(nome_cliente)


-- 3. Excluimos linhas (registros) da tabela
DELETE FROM dCliente
	WHERE id_cliente = 1


-- Quando executamos as ações acima, não temos controle sobre desfazê-las ou salvá-las no banco, por exemplo. Mas, quando usamos transações, conseguimos controlar melhor essas ações, por meio de commits e rollbacks.

-- COMMIT: Comando TCL para efetivar uma transação no banco
-- ROLLBACK: Comando TCL para desfazer uma transação no banco








-- Iniciando uma transação com COMMIT:

SELECT * FROM cliente_aux

BEGIN TRANSACTION
INSERT INTO cliente_aux(nome_cliente, genero, data_de_nascimento, cpf) VALUES
	('Maria Julia', 'F', '30/04/1995', '987.654.321-00')

COMMIT TRANSACTION


BEGIN TRANSACTION
UPDATE cliente_aux
SET cpf = '999.999.999-99'
WHERE id_cliente = 1

COMMIT TRANSACTION







-- 4. Nomeando uma transação


BEGIN TRANSACTION T1
INSERT INTO cliente_aux(nome_cliente, genero, data_de_nascimento, cpf) VALUES
	('Naldo Reis', 'M', '10/02/1992', '412.889.311-90')



-- Commitando uma transação
COMMIT TRANSACTION T1







-- 5. Commit e Rollback condicionais

-- Você deve inserir a cliente Ruth Campos no banco de dados. Se esse nome já existir, desfaça a transação. Se não existir, salve a transação.

SELECT * FROM cliente_aux

DECLARE @contador INT

BEGIN TRANSACTION T1
INSERT INTO cliente_aux(nome_cliente, genero, data_de_nascimento, cpf) VALUES
	('Ruth Campos', 'F', '23/03/1992', '324.731.903-89')

SELECT @contador = COUNT(*) FROM cliente_aux WHERE nome_cliente = 'Ruth Campos'


IF @contador = 1
	BEGIN
		COMMIT TRANSACTION T1
		PRINT 'Ruth Campos cadastrada com sucesso.'
	END
ELSE
	BEGIN
		ROLLBACK TRANSACTION T1
		PRINT 'Ruth Campos já foi cadastrada na tabela. Insert abortado.'
	END












-- 6. Tratamento de Erros em Transações

BEGIN TRY
	BEGIN TRANSACTION T1

		UPDATE cliente_aux
		SET data_de_nascimento = '15/03/1992'
		WHERE id_cliente = 4

	COMMIT TRANSACTION T1
	PRINT 'Data atualizada com sucesso'
END TRY
BEGIN CATCH

	ROLLBACK TRANSACTION T1
	PRINT 'Data cadastrada inválida'

END CATCH

SELECT * FROM cliente_aux








-- 7. Transações aninhadas (Rollback e Commit)


BEGIN TRANSACTION T1

	PRINT @@TRANCOUNT

	BEGIN TRANSACTION T2
		
		PRINT @@TRANCOUNT

	COMMIT TRANSACTION T2

	PRINT @@TRANCOUNT

COMMIT TRANSACTION T1

PRINT @@TRANCOUNT

ROLLBACK








-- Transações aninhadas (Rollback e Commit)

DROP TABLE cliente_aux
SELECT *
INTO cliente_aux
FROM dCliente


SELECT * FROM cliente_aux

BEGIN TRAN T1                            -- Início transação 1

	UPDATE cliente_aux
	SET cpf = '999.999.999-99'
	WHERE id_cliente = 1

	SELECT * FROM cliente_aux

	BEGIN TRAN T2                        -- Início transação 2
		
		UPDATE cliente_aux
		SET cpf = '111.111.111-11'
		WHERE id_cliente = 2

		SELECT * FROM cliente_aux

	COMMIT TRAN T2                       -- Commit transação 2

	SELECT * FROM cliente_aux

ROLLBACK TRAN T1                           -- Rollback transação 1

SELECT * FROM cliente_aux


PRINT @@TRANCOUNT









-- 8. Savepoints

DROP TABLE cliente_aux
SELECT *
INTO cliente_aux
FROM dCliente

BEGIN TRAN T1
	SAVE TRAN SV1
	UPDATE cliente_aux
	SET cpf = '999.999.999-99'
	WHERE id_cliente = 1

	SELECT * FROM cliente_aux

	BEGIN TRAN T2
		SAVE TRAN SV2
		UPDATE cliente_aux
		SET cpf = '111.111.111-11'
		WHERE id_cliente = 2

		SELECT * FROM cliente_aux

	COMMIT TRAN T2

	SELECT * FROM cliente_aux

ROLLBACK TRAN SV1

SELECT * FROM cliente_aux

rollback



