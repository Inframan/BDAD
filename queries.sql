SELECT * FROM Funcionario; --Seleciona as informacoes de todos os funcionarios


SELECT COUNT(*) FROM Jogo --Conta os jogos com idadeMin <= 18
WHERE(idadeMin <= 18);

SELECT * FROM Funcionario --Seleciona os leads das equipas
WHERE funcionarioID = (
	SELECT funcionario FROM FuncionarioEquipa
	WHERE(projectLead = 1)
	);

SELECT *, COUNT(*) FROM FuncionarioEquipa --Conta as equipas em que um funcionario trabalha
GROUP BY funcionario;

SELECT *, COUNT(*) FROM JogoModulo --Conta os jogos em que um modelo é utilizado
GROUP BY moduloID;

SELECT jogo FROM JogoGenero --Obtem todos os jogos cujo genero seja FPS
WHERE generoID = 1;