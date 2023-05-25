// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

class CartaoPadrao extends StatelessWidget {
  // const CartaoPadrao({super.key});
  const CartaoPadrao(
      {super.key,
      required this.cor,
      required this.filhoCartao,
      this.aoPressionar});

  final Color cor;
  final Widget filhoCartao;
  final aoPressionar;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: aoPressionar,
      child: Container(
        margin: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
            color: cor, borderRadius: BorderRadius.circular(10.0)),
        child: filhoCartao,
      ),
    );
  }
}
