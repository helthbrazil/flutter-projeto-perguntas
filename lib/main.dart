import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projeto_perguntas/resultado.dart';
import 'package:projeto_perguntas/questionario.dart';
import 'package:projeto_perguntas/toast-util.dart';

main() => runApp(const PerguntaApp());

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({Key? key}) : super(key: key);

  @override
  _PerguntaAppState createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  int somaNotas = 0;
  bool mostrarResultadoFinal = true;

  final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  final List<Map<String, dynamic>> _perguntas = const [
    {
      'texto': 'Qual fruta é ressecada para se fabricar ameixa seca?',
      'respostas': [
        {'id': 1, 'texto': 'Pera', 'nota': '0'},
        {'id': 2, 'texto': 'Ameixa', 'nota': '1'},
        {'id': 3, 'texto': 'Uva', 'nota': '0'},
        {'id': 4, 'texto': 'Chuchu', 'nota': '0'},
      ]
    },
    {
      'texto': 'Que animal da fauna brasileira está retratado na nota de dez reis?',
      'respostas': [
        {'id': 1, 'texto': 'Jabuti', 'nota': '0'},
        {'id': 2, 'texto': 'Onça', 'nota': '0'},
        {'id': 3, 'texto': 'Arara', 'nota': '1'},
        {'id': 4, 'texto': 'Tucano', 'nota': '0'},
      ]
    },
    {
      'texto': 'Qual profissional usa uma ferramenta chamada formão?',
      'respostas': [
        {'id': 1, 'texto': 'Carpinteiro', 'nota': '1'},
        {'id': 2, 'texto': 'Relojoeiro', 'nota': '0'},
        {'id': 3, 'texto': 'Confeiteiro', 'nota': '0'},
        {'id': 4, 'texto': 'Bombeiro', 'nota': '0'},
      ]
    }
  ];

  void _responder(int index) {
    var aux = _perguntaSelecionada;
    if (temPerguntaSelecionada) {
      int notaResposta = int.parse(_perguntas[aux]['respostas'][index - 1]['nota']);
      somaNotas +=  notaResposta;
      /* ToastUtil.toast(
          'Você escolheu ${_perguntas[aux]['respostas'][index - 1]['texto']}. Somatório ($somaNotas)'); */
      setState(() {
        _perguntaSelecionada++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teste',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          centerTitle: true,
          title: Text('Projeto Flutter',
              style: GoogleFonts.pacifico(
                  fontStyle: FontStyle.italic, fontSize: 26)),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                responder: _responder,
              )
            : Center(
                child: FadeIn(
                  child: Resultado(() => {reiniciarQuestionario()}, somaNotas),
                ),
              ),
      ),
    );
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  reiniciarQuestionario() {
    setState(() {
      somaNotas = 0;
      _perguntaSelecionada = 0;
      mostrarResultadoFinal = false;
    });
  }
}
