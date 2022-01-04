import 'dart:math';

import 'package:flutter/foundation.dart';
import 'campo.dart';

class Tabuleiro {
  final int linhas;
  final int colunas;
  final int qtdeBombas;
  final List<Campo> _campos = [];
  Tabuleiro({
    required this.linhas,
    required this.colunas,
    required this.qtdeBombas,
  }) {
    _criarCampos();
    _relacionarVizinhos();
    _sortearMinas();
  }

  void reiniciar() {
    _campos.forEach((campo) => campo.reiniciar());
    _sortearMinas();
  }

  void revelarBombas() {
    _campos.forEach((campo) => campo.revelarBomba());
  }

  void _criarCampos() {
    for (int l = 0; l < linhas; l++) {
      for (int c = 0; c < colunas; c++) {
        _campos.add(Campo(linha: l, coluna: c));
      }
    }
  }

  List<Campo> get campos {
    return _campos;
  }

  bool get resolvido {
    return _campos.every((campo) => campo.resolvido);
  }

  void _relacionarVizinhos() {
    for (var campo in _campos) {
      for (var vizinho in _campos) {
        campo.adicionarVizinho(vizinho);
      }
    }
  }

  void _sortearMinas() {
    int sorteadas = 0;

// Valida se o numero de bombas é menor que o número de campos
    if (qtdeBombas > linhas * colunas) return;

    while (sorteadas < qtdeBombas) {
// Sorteia um número aleatorio
      int i = Random().nextInt(_campos.length);

// Valida se o campo não está minado
      if (!_campos[i].minado) {
        sorteadas++;
        _campos[i].minar();
      }
    }
  }
}
