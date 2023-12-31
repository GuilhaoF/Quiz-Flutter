import 'package:flutter/material.dart';

class Questoes extends StatelessWidget {
  final String texto;

  const Questoes(this.texto, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      child: Text(
          texto,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24), textAlign: TextAlign.center ,),

    );
  }
}
