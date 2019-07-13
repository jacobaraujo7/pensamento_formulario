import 'package:pensamento_formulario/src/sentimento/pages/descrever/descrever_bloc.dart';
import 'package:pensamento_formulario/src/sentimento/pages/status/status_bloc.dart';
import 'package:pensamento_formulario/src/sentimento/sentimento_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:pensamento_formulario/src/sentimento/sentimento_page.dart';

class SentimentoModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => DescreverBloc()),
        Bloc((i) => StatusBloc()),
        Bloc((i) => SentimentoBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => SentimentoPage();

  static Inject get to => Inject<SentimentoModule>.of();
}
