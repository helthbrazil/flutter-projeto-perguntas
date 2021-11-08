import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Questao extends StatelessWidget {
  final String texto;

  // ignore: use_key_in_widget_constructors
  const Questao(this.texto);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: double.infinity,
      child: Text(texto,
          style: GoogleFonts.roboto(fontSize: 18),
          textAlign: TextAlign.center),
    );
  }
}
