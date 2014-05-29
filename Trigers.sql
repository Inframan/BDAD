DROP TRIGGER if exists apagaDerivadosDoDepartamento;

CREATE TRIGGER apagaDerivadosDoDepartamento
 BEFORE DELETE ON Departamento
 FOR EACH ROW BEGIN
      DELETE FROM Funcionario WHERE (Funcionario.departamento = OLD.departamentoID);
      DELETE FROM Modulo WHERE (Modulo.departamento = OLD.departamentoID);
 END;



 CREATE TRIGGER apagaDerivadosDaEquipa
 BEFORE DELETE ON Equipa
 FOR EACH ROW BEGIN
      DELETE FROM Funcionario WHERE (
      	Funcionario.funcionarioID = (
      	SELECT Funcionario FROM FuncionarioEquipa WHERE(FuncionarioEquipa.equipa = OLD.equipaID))
      	      	);
      DELETE FROM Jogo WHERE (Jogo.equipa = OLD.equipaID);
 END;


--
 CREATE TRIGGER apagaDerivadosDoFuncionario
 BEFORE DELETE ON Funcionario
 FOR EACH ROW BEGIN
      DELETE FROM FuncionarioEquipa WHERE(FuncionarioEquipa.funcionario = OLD.funcionarioID);
      --caso a equipa fique com menos de que 2 funcionários
      CASE ((SELECT COUNT(*) FROM FuncionarioEquipa WHERE(FuncionarioEquipa.funcionario = OLD.funcionarioID)) < 2)
      DELETE FROM Funcionario WHERE (
      	Equipa.equipaID = (
      	SELECT Equipa FROM FuncionarioEquipa WHERE(FuncionarioEquipa.funcionario = OLD.funcionarioID))
      	      	);
 END;