import 'explosao_exception.dart';

class Campo {
  final int linha;
  final int coluna;
  final List<Campo> vizinhos = [];
  bool _aberto = false;
  bool _marcado = false;
  bool _minado = false;
  bool _explodido = false;

  Campo({
    required this.linha,
    required this.coluna,
  });

  void adicionarVizinho(Campo vizinho) {
    // O método abs pega o valor absoluto
    final deltaLinha = (linha - vizinho.linha).abs();
    final deltaColuna = (coluna - vizinho.coluna).abs();
    // Valida se o campo recebido como parametro é o proprio campo
    if (deltaLinha == 0 && deltaColuna == 0) {
      return;
    }
    // Valida se os campos são vizinhos
    if (deltaLinha <= 1 && deltaColuna <= 1) {
      vizinhos.add(vizinho);
    }
  }

  void abrir() {
    // Valida se o campo já está aberto
    if (_aberto) {
      return;
    }

    _aberto = true;
    // Valida se o campo está minado
    if (_minado) {
      _explodido = true;
      throw ExplosaoException();
    }
// Valida se a vizinhança não possui bombas
    if (vizinhancaSegura) {
      // Chama os métodos abrir dos vizinhos gerando uma recursividade
      vizinhos.forEach((v) => v.abrir());
    }
  }

  void revelarBomba() {
    if (_minado) {
      _aberto = true;
    }
  }

  void minar() {
    _minado = true;
  }

  void alternarMarcacao() {
    _marcado = !_marcado;
  }

  void reiniciar() {
    _aberto = false;
    _marcado = false;
    _minado = false;
    _explodido = false;
  }

  bool get minado {
    return _minado;
  }

  bool get explodido {
    return _explodido;
  }

  bool get aberto {
    return _aberto;
  }

  bool get marcado {
    return _marcado;
  }

  bool get resolvido {
    bool minadoEMarcado = minado && marcado;
    bool seguroEAberto = !minado && aberto;

    return minadoEMarcado || seguroEAberto;
  }

// Método para retornar quantas minas estão na vizinhança
  int get qtdeMinasNaVizinhaca {
    return vizinhos.where((v) => v.minado).length;
  }

  bool get vizinhancaSegura {
    // O método every é usado para validar se todos elementos da lista de vizinhos não estão minados
    return vizinhos.every((v) => !v.minado);
  }
}
