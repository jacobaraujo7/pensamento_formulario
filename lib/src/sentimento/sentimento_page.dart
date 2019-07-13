import 'package:flutter/material.dart';
import 'package:pensamento_formulario/src/sentimento/pages/descrever/descrever_page.dart';
import 'package:pensamento_formulario/src/sentimento/pages/status/status_page.dart';
import 'package:pensamento_formulario/src/sentimento/sentimento_bloc.dart';
import 'package:pensamento_formulario/src/sentimento/sentimento_module.dart';

class SentimentoPage extends StatefulWidget {
  @override
  _SentimentoPageState createState() => _SentimentoPageState();
}

class _SentimentoPageState extends State<SentimentoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Novo"),
        ),
        body: PageView(
          controller: SentimentoModule.
                          to.bloc<SentimentoBloc>().pageController,
          children: <Widget>[
            StatusPage(),
            DescreverPage(),
          ],
        ));
  }
}
