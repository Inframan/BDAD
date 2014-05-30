SELECT * FROM Funcionario; --Seleciona as informacoes de todos os funcionarios


SELECT COUNT(*)  FROM Jogo --Conta os jogos com idadeMin <= 18
WHERE(idadeMin <= 18);

SELECT * FROM Funcionario
WHERE funcionarioID = (
	SELECT funcionario FROM FuncionarioEquipa
	WHERE(projectLead = 1)
	);