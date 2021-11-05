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
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'id': 1, 'texto': 'Preto', 'nota': '2'},
        {'id': 2, 'texto': 'Vermelho', 'nota': '8'},
        {'id': 3, 'texto': 'Verde', 'nota': '10'},
        {'id': 4, 'texto': 'Branco', 'nota': '5'},
      ]
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'id': 1, 'texto': 'Coelho', 'nota': '3'},
        {'id': 2, 'texto': 'Cobra', 'nota': '6'},
        {'id': 3, 'texto': 'Elefante', 'nota': '9'},
        {'id': 4, 'texto': 'Leão', 'nota': '10'},
      ]
    },
    {
      'texto': 'Qual é o seu instrutor favorito?',
      'respostas': [
        {'id': 1, 'texto': 'Maria', 'nota': '10'},
        {'id': 2, 'texto': 'João', 'nota': '10'},
        {'id': 3, 'texto': 'Leo', 'nota': '8'},
        {'id': 4, 'texto': 'Pedro', 'nota': '2'},
      ]
    }
  ];

  void _responder(int index) {
    var aux = _perguntaSelecionada;
    if (temPerguntaSelecionada) {
      int notaResposta = int.parse(_perguntas[aux]['respostas'][index - 1]['nota']);
      somaNotas +=  notaResposta;
      ToastUtil.toast(
          'Você escolheu ${_perguntas[aux]['respostas'][index - 1]['texto']}. Somatório ($somaNotas)');
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
