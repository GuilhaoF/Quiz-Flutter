import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  //tipagem
  final int nota;
  final void Function() _reiniciarQuestionario;

  const Resultado(this.nota, this._reiniciarQuestionario, {super.key});

  String get fraseResultado {
    if (nota < 7) {
      return 'Voce Foi ruim !';
    } else if (nota < 10) {
      return 'Muito Bem, Mas Cuidado';
    } else {
      return 'Nivel Rei!';
    }
  }

  @override
  Widget build(BuildContext context) {

     final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20),
      backgroundColor: Colors.deepPurple,
      padding: const EdgeInsets.all(16.0),
    );


    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: const TextStyle(fontSize: 28),
          ),
        ),
        ElevatedButton(
            onPressed: _reiniciarQuestionario,
            style: style,
            child: const Text(
              'Reiniciar ?',
              style: TextStyle(fontSize: 20),
            ),
            )
      ],
    );
  }
}
