import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/resposta.dart';

class Questionario extends StatelessWidget {
  final int perguntaSelecionada;
  final List<Map<String, dynamic>> perguntas;
  final void Function(int id) responder;

  // ignore: use_key_in_widget_constructors
  const Questionario({
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.responder,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Questao(perguntas[perguntaSelecionada]['texto'].toString()),
          ...getRespostasTesteMap()
        ],
      ),
    );
  }

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  getRespostasTesteMap() {
    return List.from(perguntas[perguntaSelecionada]['respostas'])
        .map((e) => Resposta(
              '${e['texto'].toString()}',
              e['id'],
              (id) => {
                responder(id),
              },
            ))
        .toList();
  }
}
