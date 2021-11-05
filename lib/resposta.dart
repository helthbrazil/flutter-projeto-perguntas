import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final int id;
  final void Function(int indice) onPressed;

  Resposta(this.texto, this.id, this.onPressed, {Key? key}) : super(key: key);

  final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20),
      elevation: 8,
      primary: Colors.deepPurple,
      onPrimary: Colors.white70,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))));

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: style,
      onPressed: (){onPressed(id);},
      child: Text(texto),
    );
  }
}
