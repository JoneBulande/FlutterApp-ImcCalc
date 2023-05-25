// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

//  CONSTS
import '../constantes.dart';

// COMPONENTS
import '../components/cartao_padrao.dart';
// import '../components/botao_inferior.dart';

class TelaResultado extends StatelessWidget {
  const TelaResultado(
      {super.key,
      required this.resultadoIMC,
      required this.resultadoTexto,
      required this.interpretacao});

  final String resultadoIMC;
  final String resultadoTexto;
  final String interpretacao;

  @override
  Widget build(BuildContext context) {
    print(resultadoIMC);
    print(resultadoTexto);
    print(interpretacao);

    return Scaffold(
      appBar: AppBar(
        title: Text('CALCULADORA IMC'),
        backgroundColor: kBackgroundColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(15, 50, 0, 20),
              child: Text('Resultado', style: kTituloTextStyle),
            ),
          ),
          Expanded(
            flex: 4,
            child: CartaoPadrao(
              cor: kCorAtivaCartaoPadrao,
              filhoCartao: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(resultadoTexto.toUpperCase(),
                      style: kResultatoTextStyle),
                  Text(resultadoIMC, style: kIMCTextStyle),
                  Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text(interpretacao,
                        textAlign: TextAlign.center, style: kCorpoTextStyle),
                  ),
                ],
              ),
            ),
          ),
          // BotaoInferior(
          //   tituloBotao: 'RECALCULAR',
          //   aoPressionar: () {
          //     Navigator.pop(context);
          //   },
          // )
        ],
      ),
    );
  }
}
