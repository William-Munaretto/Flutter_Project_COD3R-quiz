import 'package:flutter/material.dart';
import 'package:flutter_project_1/questionario.dart';
import 'package:flutter_project_1/resultado.dart';
import './questao.dart';
import './resposta.dart';

main() => runApp(PerguntaApp());

//classe que gerencia o estado do componente PerguntaApp
class _PerguntaAppState extends State<PerguntaApp>{
  var _pontuacaoTotal = 0;
  var _perguntaSelecionada = 0;
  final List<Map<String, Object>> _perguntas = const [
    {
      'texto':  'Qual é a sua cor favorita?',
      'resposta': [
          { 'texto': 'preto', 'pontuacao': 10},
          {'texto': 'vermelho', 'pontuacao' : 5},
          {'texto': 'verde', 'pontuacao': 3},
          {'texto': 'branco', 'pontuacao': 1},
      ],
    },
    {
      'texto':  'Qual é o seu animal favorito?',
      'resposta': [
          {'texto': 'Coelho', 'pontuacao': 10},
          {'texto': 'Cobra', 'pontuacao': 5},
          {'texto': 'Elefante', 'pontuacao': 3},
          {'texto': 'Leão', 'pontuacao' : 1},
      ],
    },
    {
      'texto': 'Qual é o seu instrutor favorito?',
      'resposta': [
          {'texto': 'Leo', 'pontuacao': 10},
          {'texto': 'Maria', 'pontuacao': 5},
          {'texto': 'João', 'pontuacao': 3},
          {'texto': 'Pedro', 'pontuacao': 1},
      ],
    },
  ];

  void _responder(int pontuacao){
    if(temPerguntaSelecionada){
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario(){
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada{
    return _perguntaSelecionada < _perguntas.length;
  }



  @override
  Widget build(BuildContext context) {

    // List<Widget> widgets = respostas.map((t) => Resposta(t, _responder)).toList();
    // for(String textoResp in respostas){
    //   widgets.add(Resposta(textoResp, _responder));
    // }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.add),
                tooltip: 'Show Snackbar',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                   const SnackBar(content: Text('This is a snackbar')));
                },
              ),
            ]
        ),
        body: temPerguntaSelecionada ? Questionario(
            perguntas: _perguntas,
            perguntaSelecionada: _perguntaSelecionada,
            quandoResponder: _responder) : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

//Classe Componente com estado - PerguntaApp
class PerguntaApp extends StatefulWidget{
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}