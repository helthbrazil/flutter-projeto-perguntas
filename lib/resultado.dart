import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Resultado extends StatelessWidget {
  final void Function() onPressed;
  final int dataCorte = 20;
  /* final String uriName = 'https://www.svgrepo.com/show/7910/happy.svg';
  final String uriNameSad = 'https://www.svgrepo.com/show/209032/angry.svg'; */

  final String uriName = 'https://www.svgrepo.com/show/7910/happy.svg';
  final String uriNameSad = 'https://www.svgrepo.com/show/209032/angry.svg';

  final String imgSrc = 'assets/images/ripple.svg';
  int somaNota;

  Resultado(this.onPressed, this.somaNota);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Column(
          children: [
            const Divider(
              height: 180,
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
    if (somaNota >= dataCorte) {
      lista.add(const Image(
          height: 200,
          image: NetworkImage(
              'https://c.tenor.com/eSyi8jwqfSUAAAAM/yes-nod.gif')));

      /* lista.add(
        SvgPicture.network(
          uriName,
          height: 150,
          placeholderBuilder: (BuildContext context) => Container(
              padding: const EdgeInsets.all(30.0),
              child: const CircularProgressIndicator()),
        ),
      ); */

      lista.add(const Divider(
        height: 30,
        color: Colors.white,
      ));

      lista.add(Text(
        'Parabéns!!!',
        style: GoogleFonts.roboto(fontSize: 20, color: Colors.blueGrey),
      ));

      lista.add(Text(
        'Sua nota foi $somaNota maior que a nota de corte ($dataCorte)',
        style: GoogleFonts.roboto(fontSize: 15, color: Colors.blueGrey),
      ));
    } else {
      lista.add(const Image(
          height: 200,
          image: NetworkImage(
              'https://c.tenor.com/PHhFkOY9l9UAAAAM/sad-baby.gif')));

      /* SvgPicture.network(
          uriNameSad,
          height: 150,
          placeholderBuilder: (BuildContext context) => Container(
              padding: const EdgeInsets.all(30.0),
              child: const CircularProgressIndicator()),
        ),
      ); */

      lista.add(const Divider(
        height: 30,
        color: Colors.white,
      ));

      lista.add(Text(
        'Que pena',
        style: GoogleFonts.roboto(fontSize: 20, color: Colors.blueGrey),
      ));

      lista.add(Text(
        'A sua nota $somaNota foi menor que $dataCorte',
        style: GoogleFonts.roboto(fontSize: 15, color: Colors.blueGrey),
      ));
    }

    return lista;
  }
}
