// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';

class CalculadoraIMC {
  CalculadoraIMC({required this.altura, required this.peso});

  final int altura;
  final int peso;
  double _imc = 0;

  String calcularIMC() {
    // ignore: no_leading_underscores_for_local_identifiers
    _imc = peso / pow(altura / 100, 2);
    return _imc.toStringAsFixed(1);
  }

  String obterResultado() {
    calcularIMC();
    if (_imc >= 25) {
      return 'Acima do peso';
    } else if (_imc > 18.5) {
      return 'Normal';
    } else {
      return 'Abaixo do peso';
    }
  }

  String obterInterpretacao() {
    calcularIMC();
    if (_imc >= 25) {
      return 'Voce está com o peso acima do normal. Tente se exercitar mais.';
    } else if (_imc > 18.5) {
      return 'Excelente! O seu peso está normal';
    } else {
      return 'Voce está com o peso abaixo do normal. Tente comer um pouco mais.';
    }
  }
}
