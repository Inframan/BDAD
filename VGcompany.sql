. mode columns
. headers on
. nullvalue NULL
PRAGMA FOREIGN_KEY = ON;



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
	titulo text PRIMARY KEY,
	integer idadeMin
	);
insert into Jogo values('Minecraft', 6);
insert into Jogo values('CoH: MW', 16);
Select *from Jogo;

create table Equipa(
	Nome text PRIMARY KEY, 
	jogo text, 
	FOREIGN KEY (jogo) references Jogo(titulo)
	);
insert into Equipa values('Team17', 'Minecraft');
Select *from Equipa;


create table Departamento(
	nome text PRIMARY KEY
	);
insert into Departamento values('Logica');
insert into Departamento values('Grafico');
insert into Departamento values('Som');
Select *from Departamento;



create table Funcionario(
	idFuncionario integer PRIMARY KEY,
	Nome text, 
	dataNasc text, 
	departamento text, 
	FOREIGN KEY (departamento) references Departamento(nome)
	);
insert into Funcionario values(1 , 'Joao Rebelde', '15 de Marco de 1980', 'Grafico');
insert into Funcionario values(2 , 'John Carmack', '20 de Agosto de 1970', 'Logica');
Select *from Funcionario;

create table FuncionarioEquipa( 
	nome text references Equipa(nome), 
	funcionario integer references Funcionario(idFuncionario),
	projectLead boolean, 
	PRIMARY KEY (nome, funcionario)
	);
insert into FuncionarioEquipa values('Team17', 1 , 1);
Select *from FuncionarioEquipa;


create table DepartamentoFuncionario( 
	departamento text references Departamento(departamento), 
	funcionario integer references Funcionario(idFuncionario),
	leader boolean , 
	PRIMARY KEY (funcionario,departamento)
	);
insert into DepartamentoFuncionario values('Grafico', 2, 1);
Select *from DepartamentoFuncionario;




create table Modulo(
	nome text PRIMARY KEY,
	departamento text, 
	FOREIGN KEY (departamento) references Departamento(nome)
	);
insert into Modulo values('Fisica', 'Logica');
insert into Modulo values('Motor Grafico', 'Grafico');
Select *from Modulo;


create table Genero( 
	nome text PRIMARY KEY
	);	
insert into Genero values('FPS');
insert into Genero values('RPG');
Select *from Genero;

create table Tipo( 
	nome  text PRIMARY KEY
	);	
insert into Tipo values('Accao');
insert into Tipo values('Aventura');
Select *from Tipo;


create table Franchise( 
	tipoFranchise text PRIMARY KEY,
	jogo text , 
	FOREIGN KEY (jogo) references Jogo(titulo)  
	);
insert into Franchise values('Wallpaper', 'CoH: MW');
Select *from Franchise;


create table Distribuidor( 
	nome text PRIMARY KEY
	);
insert into Distribuidor values('Cega');
Select *from Distribuidor;


create table JogoModulo( 
	titulo text references Jogo(titulo),
	nome text references Modulo(nome),
	PRIMARY KEY (titulo,nome)
	);
insert into JogoModulo values('CoH: MW', 'Fisica' );
Select *from JogoModulo;




create table JogoDistribuidor( 
	titulo text references Jogo(titulo),
	nome text references Distribuidor(nome),
	PRIMARY KEY (titulo,nome)	
	);
insert into JogoDistribuidor values('CoH: MW', 'Cega' );
Select *from JogoDistribuidor;


create table JogoFranchise( 
	titulo text references Jogo(titulo),
	tipoFranchise text references Franchise(tipoFranchise),
	PRIMARY KEY (titulo,tipoFranchise)	
	);
insert into JogoFranchise values('Minecraft', 'Wallpaper' );
Select *from JogoFranchise;

create table JogoGenero( 
	titulo text references Jogo(titulo),
	nome text references Genero(nome),
	PRIMARY KEY (titulo,nome)	
	);
insert into JogoGenero values('Minecraft', 'Aventura' );
Select *from JogoGenero;

create table JogoTipo( 
	titulo text references Jogo(titulo),
	nome text references Tipo(nome),
	PRIMARY KEY (titulo,nome)	
	);
insert into JogoTipo values('CoH: MW', 'RPG' );
Select *from JogoTipo;