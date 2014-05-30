DROP TRIGGER if exists apagaDerivadosDoDepartamento;
DROP TRIGGER if exists apagaDerivadosDaEquipa;
DROP TRIGGER if exists apagaDerivadosDoFuncionario;
DROP TRIGGER if exists apagaDerivadosDoJogo;


CREATE TRIGGER apagaDerivadosDoDepartamento
 BEFORE DELETE ON Departamento
 FOR EACH ROW BEGIN
      DELETE FROM Funcionario WHERE (Funcionario.departamento = OLD.departamentoID);
      DELETE FROM Modulo WHERE (Modulo.departamento = OLD.departamentoID);
 END;

 CREATE TRIGGER apagaDerivadosDaEquipa
 BEFORE DELETE ON Equipa
 FOR EACH ROW BEGIN
      DELETE FROM FuncionarioEquipa WHERE(FuncionarioEquipa.equipa = OLD.equipaID);
      UPDATE Jogo SET equipa = NULL WHERE(Jogo.equipa = OLD.equipaID);
   --   UPDATE Jogo SET equipa = NULL WHERE (Jogo.equipa = OLD.equipaID);
 END;


 CREATE TRIGGER apagaDerivadosDoFuncionario
 BEFORE DELETE ON Funcionario
 FOR EACH ROW BEGIN
      DELETE FROM FuncionarioEquipa WHERE(FuncionarioEquipa.funcionario = OLD.funcionarioID);
      DELETE FROM DepartamentoFuncionario WHERE (DepartamentoFuncionario.departamento = OLD.departamento);
      --caso a equipa fique com menos de que 2 funcionários
 END;


CREATE TRIGGER apagaDerivadosDoFuncionario
 BEFORE DELETE ON Funcionario
 FOR EACH ROW BEGIN
      DELETE FROM FuncionarioEquipa WHERE(FuncionarioEquipa.funcionario = OLD.funcionarioID);
      DELETE FROM DepartamentoFuncionario WHERE (DepartamentoFuncionario.departamento = OLD.departamento);
      
 END;
--CREATE TRIGGER db


CREATE TRIGGER apagaDerivadosDoJogo
 BEFORE DELETE ON Jogo
 FOR EACH ROW BEGIN
      DELETE FROM JogoGenero WHERE(JogoGenero.jogoID = OLD.jogoID);
      DELETE FROM JogoTipo WHERE(JogoTipo.jogoID = OLD.jogoID);
      DELETE FROM JogoDistribuidor WHERE(JogoDistribuidor.jogoID = OLD.jogoID);
      DELETE FROM JogoModulo WHERE(JogoModulo.jogoID = OLD.jogoID);
      DELETE FROM Franchise WHERE(Franchise.jogo = OLD.jogoID);
    
 END;
