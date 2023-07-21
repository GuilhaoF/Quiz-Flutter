import 'package:flutter/material.dart';
import 'package:mbol/questionario.dart';

import 'resultado.dart';

main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});
  //
  @override
  State<App> createState() => _AppState();
}

//class widget que usa os estados com widgets que atualizam o estado
class _AppState extends State<App> {
  final _perguntas = const [
    {
      "texto": "Qual Melhor Time do mundo?",
      "respostas": [
        {'texto': 'Real Madrid', 'nota': 10},
        {'texto': 'Manchester City', 'nota': 8},
        {'texto': 'Palmeiras', 'nota': 6},
        {'texto': 'Flamengo', 'nota': 7}
      ]
    },
    {
      "texto": "Qual melhor Goleiro ?",
      "respostas": [
        {'texto': 'Weverton', 'nota': 0},
        {'texto': 'Perri', 'nota': 7},
        {'texto': 'Ederson', 'nota': 10},
        {'texto': 'Matheus Cunha', 'nota': 8}
      ]
    },
    {
      "texto": " Qual cor favorita?",
      "respostas": [
        {'texto': 'Azul', 'nota': 0},
        {'texto': 'Verde', 'nota': 10},
        {'texto': 'Preto', 'nota': 6},
        {'texto': 'Rosa', 'nota': 0}
      ]
    },
    {
      "texto": " Qual campeao atual da libertadores?",
      "respostas": [
        {'texto': 'vasco', 'nota': 0},
        {'texto': 'Flamenggo', 'nota': 10},
        {'texto': 'Palmeiras', 'nota': 0},
        {'texto': 'Criciuma', 'nota': 0}
      ]
    }
  ];

  var _perguntaSelecionada = 0;
  var _notaTotal = 0;

  void _onPressed(int nota) {
    //usando setState para monitorar a variavel mudando
    temPerguntaSelecionada
        ? setState(() {
            _perguntaSelecionada++;
            _notaTotal += nota;
          })
        : null;
  }

  void _reiniciarQuestionario(){
    setState(() {
        _perguntaSelecionada = 0;
        _notaTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          title: const Text('Quiz Flutter'),
          backgroundColor: Colors.deepPurpleAccent,
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _onPressed
              )
            :  Resultado(_notaTotal,_reiniciarQuestionario),
      ),
    );
  }
}
