import 'package:flutter/material.dart';
import '../components/resultado_widget.dart';
import '../components/tabuleiro_widget.dart';
import '../models/tabuleiro.dart';
import '../models/campo.dart';

import '../models/explosao_exception.dart';

class CampoMinadoApp extends StatelessWidget {
  const CampoMinadoApp({Key? key}) : super(key: key);

  void _reiniciar() {
    print('reiniciar ...');
  }

  void _abrir(Campo campo) {
    print('abrir...');
  }

  void _alternarMarcacao(Campo campo) {
    print('alternar marcação ...');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: ResultadoWidget(
          venceu: null,
          onReiniciar: _reiniciar,
        ),
        body: Container(
          child: TabuleiroWidget(
            tabuleiro: Tabuleiro(
              linhas: 15,
              colunas: 15,
              qtdeBombas: 10,
            ),
            onAbrir: _abrir,
            onAlternarMarcacao: _alternarMarcacao,
          ),
        ),
      ),
    );
  }
}
