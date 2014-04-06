. mode columns
. headers on
. nullvalue NULL
PRAGMA FOREIGN_KEY = ON;


drop table if exists JogoTipo;
drop table if exists JogoGenero;
drop table if exists JogoFranchise;
drop table if exists JogoDistribuidor;
drop table if exists JogoModulo;
drop table if exists FuncionarioEquipa;
drop table if exists DepartamentoFuncionario;
drop table if exists Distribuidor;
drop table if exists Franchise;
drop table if exists Tipo;
drop table if exists Genero;
drop table if exists Modulo;
drop table if exists Funcionario;
drop table if exists Equipa;
drop table if exists Departamento;
drop table if exists Jogo;

create table Jogo(
	jogoID INTEGER PRIMARY KEY  ,
	titulo text,
	INTEGER idadeMin
	);
insert into Jogo values(1,'Minecraft', 6);
insert into Jogo values(2,'CoH: MW', 16);
Select *from Jogo;

create table Equipa(
	equipaID INTEGER PRIMARY KEY  ,
	Nome text , 
	jogo INTEGER, 
	FOREIGN KEY (jogo) references Jogo(jogoID)
	);
insert into Equipa values(1,'Team17', 1);
insert into Equipa values(2,'734W', 2);	
Select *from Equipa;


create table Departamento(
	departamentoID INTEGER PRIMARY KEY  ,
	nome text 
	);
insert into Departamento values(1,'Logica');
insert into Departamento values(2,'Grafico');
insert into Departamento values(3,'Som');
Select *from Departamento;



create table Funcionario(
	idFuncionario INTEGER PRIMARY KEY  ,
	Nome text, 
	dataNasc text, 
	departamento INTEGER, 
	FOREIGN KEY (departamento) references Departamento(nome)
	);
insert into Funcionario values(1, 'Joao Santos', '15 de Marco de 1980', 1);
insert into Funcionario values(2,'John Carmack', '20 de Agosto de 1970', 2);
insert into Funcionario values(3,'Steve McConnor', '7 de Novembro de 1983', 3);
Select *from Funcionario;

create table FuncionarioEquipa( 
	equipa INTEGER references Equipa(equipa), 
	funcionario INTEGER references Funcionario(idFuncionario),
	projectLead boolean, 
	PRIMARY KEY (equipa, funcionario)
	);
insert into FuncionarioEquipa values(1, 1 , 0);
insert into FuncionarioEquipa values(1, 2 , 1);
insert into FuncionarioEquipa values(1, 3 , 0);
Select *from FuncionarioEquipa;


create table DepartamentoFuncionario( 
	departamento INTEGER references Departamento(departamento), 
	funcionario INTEGER references Funcionario(idFuncionario),
	leader boolean , 
	PRIMARY KEY (funcionario,departamento)
	);
insert into DepartamentoFuncionario values(1, 2, 1);
Select *from DepartamentoFuncionario;




create table Modulo(
	moduloID INTEGER PRIMARY KEY  ,
	nome text,
	departamento INTEGER, 
	FOREIGN KEY (departamento) references Departamento(nome)
	);
insert into Modulo values(1,'Fisica', 1);
insert into Modulo values(2,'Motor Grafico', 2);
Select *from Modulo;


create table Genero( 
	generoID INTEGER PRIMARY KEY  ,
	nome text
	);	
insert into Genero values(1,'FPS');
insert into Genero values(2,'RPG');
Select *from Genero;

create table Tipo( 
	tipoID INTEGER PRIMARY KEY  ,
	nome  text
	);	
insert into Tipo values(1,'Accao');
insert into Tipo values(2,'Aventura');
Select *from Tipo;


create table Franchise( 
	franchiseID INTEGER PRIMARY KEY  ,
	tipoFranchise text,
	jogo INTEGER , 
	FOREIGN KEY (jogo) references Jogo(titulo)  
	);
insert into Franchise values(1,'Wallpaper', 2);
Select *from Franchise;


create table Distribuidor( 
	distribuidorID INTEGER PRIMARY KEY  ,
	nome text 
	);
insert into Distribuidor values(2,'Cega');
Select *from Distribuidor;


create table JogoModulo( 
	titulo INTEGER references Jogo(titulo),
	nome INTEGER references Modulo(nome),
	PRIMARY KEY (titulo,nome)
	);
insert into JogoModulo values(2, 1);
Select *from JogoModulo;




create table JogoDistribuidor( 
	titulo INTEGER references Jogo(titulo),
	nome INTEGER references Distribuidor(nome),
	PRIMARY KEY (titulo,nome)	
	);
insert into JogoDistribuidor values(2, 1);
Select *from JogoDistribuidor;


create table JogoFranchise( 
	titulo INTEGER references Jogo(titulo),
	tipoFranchise INTEGER references Franchise(tipoFranchise),
	PRIMARY KEY (titulo,tipoFranchise)	
	);
insert into JogoFranchise values(1, 1 );
Select *from JogoFranchise;

create table JogoGenero( 
	titulo INTEGER references Jogo(titulo),
	nome INTEGER references Genero(nome),
	PRIMARY KEY (titulo,nome)	
	);
insert into JogoGenero values(1, 2 );
Select *from JogoGenero;

create table JogoTipo( 
	titulo INTEGER references Jogo(titulo),
	nome INTEGER references Tipo(nome),
	PRIMARY KEY (titulo,nome)	
	);
insert into JogoTipo values(2, 1);
Select *from JogoTipo;