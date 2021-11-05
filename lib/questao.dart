import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Questao extends StatelessWidget {
  final String texto;

  const Questao(this.texto);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: double.infinity,
      child: Text(texto,
          style: GoogleFonts.roboto(fontSize: 18),
          textAlign: TextAlign.center),
    );
  }
}
