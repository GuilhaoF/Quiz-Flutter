import 'package:flutter/material.dart';
import 'package:mbol/resposta.dart';

//widgets
import './questoes.dart';

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
  final List<Map> _perguntas = const [
    {
      "texto": "Qual Melhor Time do mundo?",
      "respostas": ["Flamengo", "Vasco", "Palmeiras"]
    },
    {
      "texto": "Qual melhor Goleiro ?",
      "respostas": ["Eder", "Cassio", "Weverton"]
    },
    {
      "texto": " Qual cor favorita?",
      "respostas": ["Azul", "Preto", "Vermelho"]
    },
    {
      "texto": " Qual campeao atual da libertadores?",
      "respostas": ["BotaFogo", "Flamengo", "Corinthias"]
    }
  ];

  var _perguntaSelecionada = 0;

  void _onPressed() {
    //usando setState para monitorar a variavel mudando
    temPerguntaSelecionada
        ? setState(() {
            _perguntaSelecionada++;
          })
        : null;
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> respostas = temPerguntaSelecionada
        ? _perguntas[_perguntaSelecionada]['respostas']
        : [];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          title: const Text('Quiz Flutter'),
          backgroundColor: Colors.deepPurpleAccent,
        ),
        body: temPerguntaSelecionada
            ? Column(
                mainAxisAlignment: MainAxisAlignment
                    .center, // Alinha os elementos verticalmente ao centro
                crossAxisAlignment: CrossAxisAlignment
                    .center, // Alinha os elementos horizontalmente ao centro
                children: <Widget>[
                  Questoes(
                      _perguntas[_perguntaSelecionada]['texto'].toString()),
                  ...respostas.map((t) => Resposta(t, _onPressed)).toList()
                ],
              )
            : const Center(
                child: Text(
                  'Parabens!',
                  style: TextStyle(fontSize: 30),
                ),
              ),
      ),
    );
  }
}
