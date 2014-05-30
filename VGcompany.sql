. mode columns
. headers on
. nullvalue NULL
PRAGMA FOREIGN_KEYS = ON;


DROP TABLE if exists JogoTipo;
DROP TABLE if exists JogoGenero;
DROP TABLE if exists FranchiseDistribuidor;
DROP TABLE if exists JogoDistribuidor;
DROP TABLE if exists JogoModulo;
DROP TABLE if exists FuncionarioEquipa;
DROP TABLE if exists DepartamentoFuncionario;
DROP TABLE if exists Distribuidor;
DROP TABLE if exists Franchise;
DROP TABLE if exists Tipo;
DROP TABLE if exists Genero;
DROP TABLE if exists Modulo;
DROP TABLE if exists Funcionario;
DROP TABLE if exists Equipa;
DROP TABLE if exists Departamento;
DROP TABLE if exists Jogo;




create TABLE Equipa(
	equipaID INTEGER PRIMARY KEY AUTOINCREMENT ,
	Nome TEXT
	);
INSERT INTO Equipa VALUES(NULL,'Team17');
INSERT INTO Equipa VALUES(NULL,'734W');	
SELECT *FROM Equipa;

create TABLE Jogo(
	jogoID INTEGER  PRIMARY KEY AUTOINCREMENT,
	titulo TEXT,
	rating REAL,
	idadeMin INTEGER ,
	equipa INTEGER  REFERENCES Equipa(equipaID)  ON DELETE SET NULL
	);
INSERT INTO Jogo VALUES(NULL,'Minecraft',7.1, 6, 1);
INSERT INTO Jogo VALUES(NULL,'CoH: MW', 6.9,16, 2);
SELECT *FROM Jogo;



create TABLE Departamento(
	departamentoID INTEGER PRIMARY KEY AUTOINCREMENT,
	nome TEXT 
	);
INSERT INTO Departamento VALUES(NULL,'Logica');
INSERT INTO Departamento VALUES(NULL,'Grafico');
INSERT INTO Departamento VALUES(NULL,'Som');
SELECT *FROM Departamento;



create TABLE Funcionario(
	funcionarioID INTEGER PRIMARY KEY  AUTOINCREMENT,
	Nome TEXT, 
	dataNasc TEXT, 
	departamento INTEGER, 
	FOREIGN KEY (departamento) REFERENCES Departamento(departamentoID) ON DELETE CASCADE
	);
INSERT INTO Funcionario VALUES(NULL,'Joao Santos', '15 de Marco de 1980', 1);
INSERT INTO Funcionario VALUES(NULL,'John Carmack', '20 de Agosto de 1970', 2);
INSERT INTO Funcionario VALUES(NULL,'Steve McConnor', '7 de Novembro de 1983', 3);
SELECT *FROM Funcionario;

create TABLE FuncionarioEquipa( 
	equipa INTEGER REFERENCES Equipa(equipaID), 
	funcionario INTEGER REFERENCES Funcionario(funcionarioID),
	projectLead BOOLEAN, 
	PRIMARY KEY (equipa, funcionario)
	);
INSERT INTO FuncionarioEquipa VALUES(1, 1 , 0);
INSERT INTO FuncionarioEquipa VALUES(1, 2 , 1);
INSERT INTO FuncionarioEquipa VALUES(2, 3 , 0);
SELECT *FROM FuncionarioEquipa;


create TABLE DepartamentoFuncionario( 
	departamento INTEGER REFERENCES Departamento(departamentoID), 
	funcionario INTEGER REFERENCES Funcionario(funcionarioID),
	leader BOOLEAN , 
	PRIMARY KEY (funcionario,departamento)
	);
INSERT INTO DepartamentoFuncionario VALUES(1, 2, 1);
SELECT *FROM DepartamentoFuncionario;




create TABLE Modulo(
	moduloID INTEGER PRIMARY KEY  AUTOINCREMENT,
	nome TEXT,
	departamento INTEGER, 
	FOREIGN KEY (departamento) REFERENCES Departamento(departamentoID)
	);
INSERT INTO Modulo VALUES(NULL,'Fisica', 1);
INSERT INTO Modulo VALUES(NULL,'Motor Grafico', 2);
SELECT *FROM Modulo;


create TABLE Genero( 
	generoID INTEGER PRIMARY KEY AUTOINCREMENT ,
	nome TEXT
	);	
INSERT INTO Genero VALUES(NULL,'FPS');
INSERT INTO Genero VALUES(NULL,'RPG');
SELECT *FROM Genero;

create TABLE Tipo( 
	tipoID INTEGER PRIMARY KEY AUTOINCREMENT ,
	nome  TEXT
	);	
INSERT INTO Tipo VALUES(NULL,'Accao');
INSERT INTO Tipo VALUES(NULL,'Aventura');
SELECT *FROM Tipo;


create TABLE Franchise( 
	franchiseID INTEGER PRIMARY KEY  AUTOINCREMENT,
	tipoFranchise TEXT,
	jogo INTEGER , 
	FOREIGN KEY (jogo) REFERENCES Jogo(jogoID)  
	);
	INSERT INTO Franchise VALUES(NULL,'Wallpaper', 2);
	INSERT INTO Franchise VALUES(NULL,'Wallpaper', 1);
SELECT *FROM Franchise;


create TABLE Distribuidor( 
	distribuidorID INTEGER PRIMARY KEY AUTOINCREMENT ,
	nome TEXT 
	);
INSERT INTO Distribuidor VALUES(NULL,'Cega');
INSERT INTO Distribuidor VALUES(NULL,'AEGames');
SELECT *FROM Distribuidor;


create TABLE JogoModulo( 
	jogoID INTEGER REFERENCES Jogo(jogoID),
	moduloID INTEGER REFERENCES Modulo(moduloID),
	PRIMARY KEY (jogoID,moduloID)
	);
INSERT INTO JogoModulo VALUES(1, 1);
INSERT INTO JogoModulo VALUES(1, 2);
INSERT INTO JogoModulo VALUES(2, 1);
INSERT INTO JogoModulo VALUES(2, 2);
SELECT *FROM JogoModulo;




create TABLE JogoDistribuidor( 
	jogoID INTEGER REFERENCES Jogo(jogoID),
	distribuidorID INTEGER REFERENCES Distribuidor(distribuidorID),
	PRIMARY KEY (jogoID,distribuidorID)	
	);
INSERT INTO JogoDistribuidor VALUES(1, 1);
INSERT INTO JogoDistribuidor VALUES(1, 2);
INSERT INTO JogoDistribuidor VALUES(2, 1);
SELECT *FROM JogoDistribuidor;


create TABLE FranchiseDistribuidor( 
	franchiseID INTEGER REFERENCES Franchise(franchiseID),
	distribuidorID INTEGER REFERENCES Distribuidor(distribuidorID),
	PRIMARY KEY (jogoID,distribuidorID)	
	);
INSERT INTO FranchiseDistribuidor VALUES(1, 1 );
INSERT INTO FranchiseDistribuidor VALUES(1, 2 );
INSERT INTO FranchiseDistribuidor VALUES(2, 2 );
SELECT *FROM FranchiseDistribuidor;

create TABLE JogoGenero( 
	jogoID INTEGER REFERENCES Jogo(jogoID),
	generoID INTEGER REFERENCES Genero(generoID),
	PRIMARY KEY (jogoID,generoID)	
	);
INSERT INTO JogoGenero VALUES(1, 2 );
INSERT INTO JogoGenero VALUES(2, 1);
SELECT *FROM JogoGenero;

create TABLE JogoTipo( 
	jogoID INTEGER REFERENCES Jogo(jogoID),
	tipoID INTEGER REFERENCES Tipo(tipoID),
	PRIMARY KEY (jogoID,tipoID)	
	);
INSERT INTO JogoTipo VALUES(2, 1);
SELECT *FROM JogoTipo;