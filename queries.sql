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

SELECT * from Jogo
WHERE jogoID = (
	SELECT jogoID FROM JogoGenero --Obtem todos os jogos cujo genero seja FPS
	WHERE generoID = 1
	);

SELECT * FROM Jogo --Obtem todos os jogos com rating maior que 8
WHERE rating >= 8.0;

SELECT AVG(rating) FROM Jogo; --Obtem o rating medio de todos jogos

SELECT * from Jogo --Obtem todos os jogos que tenham sido feitos por uma equipa que nao tenha o numero 7 no nome
WHERE equipa NOT IN (
	SELECT equipaID from equipa
	WHERE Nome NOT LIKE '%7%'
)