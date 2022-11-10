import 'package:flutter/material.dart';
import 'package:flutter_project_1/questao.dart';
import 'package:flutter_project_1/resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  bool get temPerguntaSelecionada{
    return perguntaSelecionada < perguntas.length;
  }
  final void Function(int) quandoResponder;

  Questionario({required this.perguntas, required this.perguntaSelecionada, required this.quandoResponder});

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada ? perguntas[perguntaSelecionada].cast()['resposta']  : null;

    return Column(
      children: <Widget>[
        Questao(perguntas[perguntaSelecionada]['texto'].toString()),
        ...respostas.map((resp) {
           return Resposta(
         resp['texto'].toString(),
           () => quandoResponder(int.parse(resp['pontuacao'].toString())),
        );
        }).toList(),
      ],
    );
  }
}


// return Resposta(
// resp['texto'].toString(),
// () => quandoResponder(int.parse(resp['pontuacao'].toString())),
// // );