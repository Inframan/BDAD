DROP TRIGGER if exists apagaDerivadosDoDepartamento;
DROP TRIGGER if exists apagaDerivadosDaEquipa;
DROP TRIGGER if exists apagaDerivadosDoFuncionario;
DROP TRIGGER if exists apagaDerivadosDoJogo;
DROP TRIGGER if exists apagaDerivadosDoModulo;


CREATE TRIGGER apagaDerivadosDoDepartamento --apaga classes que apontam para Departamento
 BEFORE DELETE ON Departamento
 FOR EACH ROW BEGIN
      DELETE FROM Funcionario WHERE (Funcionario.departamento = OLD.departamentoID); --apaga Funcionario
      DELETE FROM Modulo WHERE (Modulo.departamento = OLD.departamentoID); --apaga modulo
 END;

 CREATE TRIGGER apagaDerivadosDaEquipa --apaga classes que apontam para Equipa
 BEFORE DELETE ON Equipa
 FOR EACH ROW BEGIN
      DELETE FROM FuncionarioEquipa WHERE(FuncionarioEquipa.equipa = OLD.equipaID); --Apaga FuncionarioEquipa
      UPDATE Jogo SET equipa = NULL WHERE(Jogo.equipa = OLD.equipaID);-- Muda o apontador do jogo para NULL
   --   UPDATE Jogo SET equipa = NULL WHERE (Jogo.equipa = OLD.equipaID);
 END;


CREATE TRIGGER apagaDerivadosDoFuncionario --apaga classes que apontam para o funcionario
 BEFORE DELETE ON Funcionario
 FOR EACH ROW BEGIN
      DELETE FROM FuncionarioEquipa WHERE(FuncionarioEquipa.funcionario = OLD.funcionarioID); 
      DELETE FROM DepartamentoFuncionario WHERE (DepartamentoFuncionario.departamento = OLD.departamento);
      
 END;
--CREATE TRIGGER db


CREATE TRIGGER apagaDerivadosDoJogo --apaga classes que apontam para jogo
 BEFORE DELETE ON Jogo
 FOR EACH ROW BEGIN
      DELETE FROM JogoGenero WHERE(JogoGenero.jogoID = OLD.jogoID); 
      DELETE FROM JogoTipo WHERE(JogoTipo.jogoID = OLD.jogoID);
      DELETE FROM JogoDistribuidor WHERE(JogoDistribuidor.jogoID = OLD.jogoID);
      DELETE FROM JogoModulo WHERE(JogoModulo.jogoID = OLD.jogoID);
      DELETE FROM Franchise WHERE(Franchise.jogo = OLD.jogoID);
 END;


 CREATE TRIGGER apagaDerivadosDoModulo -- apaga classes que apontam para modulo
 BEFORE DELETE ON Modulo
 FOR EACH ROW BEGIN
       DELETE FROM JogoModulo WHERE(JogoModulo.moduloID = OLD.moduloID);
 END;


