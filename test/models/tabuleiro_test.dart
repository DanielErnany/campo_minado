import 'package:campo_minado/models/tabuleiro.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Ganhar jogo', () {
    // Foi criado um tabuleiro com 0 bombas para que as bombas não sejam sorteadas
    // e os campos possam ser minados manualmente
    Tabuleiro tabuleiro = Tabuleiro(
      linhas: 2,
      colunas: 2,
      qtdeBombas: 0,
    );

    // Minando os campos manualmente
    tabuleiro.campos[0].minar();
    tabuleiro.campos[3].minar();

    // Simulando o jogo
    // Marca o campos que possuem bomba como minados
    tabuleiro.campos[0].alternarMarcacao();
    tabuleiro.campos[3].alternarMarcacao();
    // Abre os campos pois eles não possuem mina
    tabuleiro.campos[1].abrir();
    tabuleiro.campos[2].abrir();

// O esperado é que resolvido retorne true pois os campos com bomba foram marcados
// e os campos sem foram abertos
    expect(tabuleiro.resolvido, isTrue);
  });
}
