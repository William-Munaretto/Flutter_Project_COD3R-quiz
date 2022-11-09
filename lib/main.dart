import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

main() => runApp(PerguntaApp());

//classe que gerencia o estado do componente PerguntaApp
class _PerguntaAppState extends State<PerguntaApp>{
  var _perguntaSelecionada = 0;
  final List<Map<String, Object>> _perguntas = const [
    {
      'texto':  'Qual é a sua cor favorita?',
      'resposta': ['preto', 'vermelho', 'verde', 'branco'],
    },
    {
      'texto':  'Qual é o seu animal favorito?',
      'resposta': ['Coelho', 'Cobra','Elefante','Leão'],
    },
    {
      'texto': 'Qual é o seu instrutor favorito?',
      'resposta': ['Maria','João','Leo','Pedro'],
    },
  ];

  void _responder(){
    if(temPerguntaSelecionada){
      setState(() {
        _perguntaSelecionada++;
      });
    }
  }

  bool get temPerguntaSelecionada{
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {

    List<String> respostas = temPerguntaSelecionada ? _perguntas[_perguntaSelecionada].cast()['resposta'] : [];

    // List<Widget> widgets = respostas.map((t) => Resposta(t, _responder)).toList();
    // for(String textoResp in respostas){
    //   widgets.add(Resposta(textoResp, _responder));
    // }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: temPerguntaSelecionada ? Column(
          children: <Widget>[
            Questao(_perguntas[_perguntaSelecionada]['texto'].toString()),
            ...respostas.map((t) => Resposta(t, _responder)).toList(),
          ],
        ) : Container(
          width: double.infinity,
          margin: EdgeInsets.all(20),
          alignment: Alignment.center,
          child: Text('Parabéns! Você Terminou!',
            style: TextStyle(
              fontSize: 28,
              color: Colors.purple
            ),
          ),
        ),
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