import 'package:campo_minado/components/campo_widget.dart';
import 'package:flutter/material.dart';
import '../models/tabuleiro.dart';
import '../models/campo.dart';

class TabuleiroWidget extends StatelessWidget {
  final Tabuleiro tabuleiro;

  final void Function(Campo) onAbrir;
  final void Function(Campo) onAlternarMarcacao;

  TabuleiroWidget({
    required this.tabuleiro,
    required this.onAbrir,
    required this.onAlternarMarcacao,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        // Número de elementos na horizontal
        crossAxisCount: tabuleiro.colunas,
        children: tabuleiro.campos
            .map(
              (c) => CampoWidget(
                campo: c,
                onAbrir: onAbrir,
                onAlternarMarcacao: onAlternarMarcacao,
              ),
            )
            .toList(),
      ),
    );
  }
}
