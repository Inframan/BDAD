SELECT * FROM Funcionario; --Seleciona as informacoes de todos os funcionarios


SELECT COUNT(*) FROM Jogo --Conta os jogos com idadeMin <= 18
WHERE(idadeMin <= 18);

SELECT * FROM Funcionario --Seleciona os leads das equipas
WHERE funcionarioID = (
	SELECT funcionario FROM FuncionarioEquipa
	WHERE(projectLead = 1)
	);

SELECT *, COUNT(*) --Conta as equipas em que um funcionario trabalha
FROM FuncionarioEquipa
GROUP BY funcionario;

SELECT *, COUNT(*) --Conta os jogos em que um modelo é utilizado
FROM JogoModulo
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
	SELECT equipaID FROM equipa
	WHERE Nome LIKE '%7%'
);

SELECT * FROM Jogo, JogoGenero --Obtem todos os jogos RPG cuja idade minima seja de 18 anos
WHERE generoID = (
	SELECT generoID FROM Genero
	WHERE nome = 'RPG')
AND idadeMin >= 18;

SELECT Nome, dataNasc --Obtem nome e data de nascimento de todo o funcionario que pertenca a uma equipa e a um departamento, que nao seja lider nem líder de projecto 
FROM Funcionario, FuncionarioEquipa, DepartamentoFuncionario
WHERE FuncionarioEquipa.funcionario = funcionarioID
AND DepartamentoFuncionario.departamento NOT NULL
AND equipa NOT NULL
AND projectLead = 0
AND leader = 0;