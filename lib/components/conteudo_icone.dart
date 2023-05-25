// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

import '../constantes.dart';

class ConteudoIcone extends StatelessWidget {
  // const CartaoPadrao({super.key});
  const ConteudoIcone({super.key, required this.icone, required this.sexo});

  final IconData icone;
  final String sexo;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icone, size: kTamanhoDoicone),
        SizedBox(height: 10.0),
        Text(sexo, style: kDescricaoTextStyle)
      ],
    );
  }
}
