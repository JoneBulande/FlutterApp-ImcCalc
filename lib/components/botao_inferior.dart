// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

//  CONSTS
import '../constantes.dart';

class BotaoInferior extends StatelessWidget {
  const BotaoInferior(
      {super.key, this.aoPressionar, required this.tituloBotao});

  final aoPressionar;
  final String tituloBotao;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: aoPressionar,
      child: Container(
        color: kCorContainerInferior,
        width: double.infinity,
        height: kAlturaContainerInferior,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 20.0),
        child: Center(
          child: Text(tituloBotao, style: kBotaoGrandeTextStye),
        ),
      ),
    );
  }
}
