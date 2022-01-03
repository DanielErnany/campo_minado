import 'package:campo_minado/models/campo.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('Teste campo', () {
    test('Abrir campo COM Explosão', () {
      Campo c = Campo(linha: 0, coluna: 0);
      // Mina o campo para que ao abrir ele tenha uma explosão
      c.minar();
// O método expect chama o método para abrir o campo e experado que ele receba uma ExplosaoException
      expect(c.abrir, throwsException);
    });

    test('Abrir campo SEM Explosão', () {
      Campo c = Campo(linha: 0, coluna: 0);
      //Abre o campo
      c.abrir();
//Verifica se o campo está aberto é esperado que o método aberto retorne true(pode ser usado isTrue ou somente true)
      expect(c.aberto, isTrue);
    });
    test('Adicionar NÃO Vizinho', () {
      Campo c1 = Campo(linha: 0, coluna: 0);
      Campo c2 = Campo(linha: 1, coluna: 3);
      //Adiciona o campo que não é vizinho
      c1.adicionarVizinho(c2);
//Verifica se campo não possui vizinhos é esperado que retorne true(pode ser usado isTrue ou somente true)
      expect(c1.vizinhos.isEmpty, true);
    });
    test('Adicionar Vizinho', () {
      Campo c1 = Campo(linha: 3, coluna: 3);
      Campo c2 = Campo(linha: 3, coluna: 4);
      Campo c3 = Campo(linha: 2, coluna: 2);
      Campo c4 = Campo(linha: 4, coluna: 4);
      //Adicionar campos vizinhos
      c1.adicionarVizinho(c2);
      c1.adicionarVizinho(c3);
      c1.adicionarVizinho(c4);
      //Verifica se campo o campo possui vizinhos o esperado é que ele tenha 3 vizinhos
      expect(c1.vizinhos.length, 3);
    });
    test('Minas na vizinhança', () {
      Campo c1 = Campo(linha: 3, coluna: 3);

      Campo c2 = Campo(linha: 3, coluna: 4);
      c2.minar();

      Campo c3 = Campo(linha: 2, coluna: 2);

      Campo c4 = Campo(linha: 4, coluna: 4);
      c4.minar();

      c1.adicionarVizinho(c2);
      c1.adicionarVizinho(c3);
      c1.adicionarVizinho(c4);
      //Verifica quantas minas ha na vizinhança
      expect(c1.qtdeMinasNaVizinhaca, 2);
    });
  });
}
