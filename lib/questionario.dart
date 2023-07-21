import 'package:flutter/material.dart';
import 'package:mbol/questoes.dart';
import 'package:mbol/resposta.dart';

class Questionario extends StatelessWidget {

  final List<Map<String,Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) quandoResponder;


  const Questionario({
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.quandoResponder,
    super.key
    });
  //retorna booleando
  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
     List<Map<String,Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada]['respostas'] as List<Map<String,Object>>
        : [];

    return Column(
      children: [
        Questoes(perguntas[perguntaSelecionada]['texto'] as String),
        ...respostas.map((resp){
          return Resposta(
            resp['texto'].toString(),
            () =>  quandoResponder(int.parse(resp['nota'].toString())));
          }
    )],
    );
  }
}