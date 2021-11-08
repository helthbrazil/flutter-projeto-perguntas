import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class Resultado extends StatelessWidget {
  final List<String> imagens = [
    'https://c.tenor.com/mEckUDEzO0IAAAAM/brain-trash.gif',
    'https://c.tenor.com/qO2OKSdAvvsAAAAM/sad-face.gif',
    'https://c.tenor.com/Fx6pMTet6noAAAAM/matrix-neo.gif',
    'https://c.tenor.com/2d-8MSwhY1kAAAAM/sherlock-holmes-conclusion-inevitable.gif',
  ];

  final void Function() onPressed;
  final int dataCorte = 2;
  /* final String uriName = 'https://www.svgrepo.com/show/7910/happy.svg';
  final String uriNameSad = 'https://www.svgrepo.com/show/209032/angry.svg'; */

  final String uriName =
      'https://c.tenor.com/fc1ghmjo6uIAAAAM/rick-y-morty-cantando.gif';
  final String uriNameSad = 'https://www.svgrepo.com/show/209032/angry.svg';

  final String imgSrc = 'assets/images/ripple.svg';
  int somaNota;

  Resultado(this.onPressed, this.somaNota, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            const Divider(
              height: 100,
              color: Colors.white,
            ),
            ...getResultado(),
            const Divider(
              height: 30,
              color: Colors.white,
            ),
            FloatingActionButton(
              onPressed: onPressed,
              tooltip: 'Voltar',
              child: const Icon(Icons.arrow_back, color: Colors.white70),
              backgroundColor: Colors.deepPurpleAccent,
            )
          ],
        ));
  }

  List<Widget> getResultado() {
    List<Widget> lista = [];

    lista.add(getImagem());

    lista.add(const Divider(
      height: 30,
      color: Colors.white,
    ));

    lista.add(Text(
      somaNota >= dataCorte ? 'Parabéns!!!' : 'Que pena',
      style: GoogleFonts.roboto(fontSize: 20, color: Colors.blueGrey),
    ));

    lista.add(Text(
      getTextoResultado(),
      style: GoogleFonts.roboto(fontSize: 15, color: Colors.blueGrey),
    ));

    return lista;
  }

  Widget getImagem() {
    String teste = imagens[somaNota];
    return Container(
      alignment: Alignment.center,
      child: Container(
        width: 300.0,
        height: 300.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            image: DecorationImage(
                image: NetworkImage(
                  teste,
                ),
                fit: BoxFit.cover)),
      ),
    );
  }

  String getTextoResultado() {
    if (somaNota == 0) return 'Errou tudo seu burro';
    if (somaNota == 1) return 'Poxa vida acertou só uma';
    if (somaNota == 2) return 'Passou raspando';
    return 'Temos um Sherock Holmes aqui';
  }
}
