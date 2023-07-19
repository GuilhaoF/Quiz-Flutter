import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() onSelect;

  Resposta(this.texto, this.onSelect);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20),
      backgroundColor: Colors.deepPurple,
      padding: const EdgeInsets.all(16.0),
    );

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: style,
        onPressed: onSelect,
        child: Text(texto),
      ),
    );
  }
}
