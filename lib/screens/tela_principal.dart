// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

// COMPONENTS
import '../components/cartao_padrao.dart';
import '../components/conteudo_icone.dart';
import '../components/botao_inferior.dart';

//  CONSTS
import '../constantes.dart';

// Controller
import '../controllers/calculadora_imc.dart';

// SCREENS
import 'tela_resultado.dart';

enum Sexo { masculono, feminino }

class TelaPrincipal extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  Sexo sexoSelecionado = Sexo.masculono;
  int altura = 180;
  int peso = 60;
  int idade = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CALCULADORA IMC'),
        backgroundColor: kBackgroundColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CartaoPadrao(
                      aoPressionar: () {
                        setState(() {
                          sexoSelecionado = Sexo.masculono;
                        });
                      },
                      cor: sexoSelecionado == Sexo.masculono
                          ? kCorAtivaCartaoPadrao
                          : kCorInativaCartaoPadrao,
                      filhoCartao:
                          ConteudoIcone(icone: Icons.male, sexo: 'Masculino')),
                ),
                Expanded(
                    child: CartaoPadrao(
                        aoPressionar: () {
                          setState(() {
                            sexoSelecionado = Sexo.feminino;
                          });
                        },
                        cor: sexoSelecionado == Sexo.feminino
                            ? kCorAtivaCartaoPadrao
                            : kCorInativaCartaoPadrao,
                        filhoCartao: ConteudoIcone(
                            icone: Icons.female, sexo: 'Feminino'))),
              ],
            ),
          ),
          Expanded(
            child: CartaoPadrao(
                aoPressionar: () {
                  setState(() {
                    sexoSelecionado = Sexo.feminino;
                  });
                },
                cor: kCorAtivaCartaoPadrao,
                filhoCartao: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Altura', style: kDescricaoTextStyle),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(altura.toString(), style: kNumeroTextStyle),
                          Text('cm', style: kDescricaoTextStyle)
                        ]),
                    Slider(
                      activeColor: kCorContainerInferior,
                      inactiveColor: kBackgroundColor,
                      onChanged: (double novoValor) {
                        setState(() {
                          altura = novoValor.round();
                        });
                      },
                      value: altura.toDouble(),
                      min: 120,
                      max: 220,
                    ),
                  ],
                )),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CartaoPadrao(
                      cor: kCorAtivaCartaoPadrao,
                      filhoCartao: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Peso', style: kDescricaoTextStyle),
                          Text(peso.toString(), style: kNumeroTextStyle),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                BotaoAredondado(
                                    icone: Icons.remove,
                                    aoPressionar: () {
                                      setState(() {
                                        if (peso > 0) {
                                          peso--;
                                        } else {
                                          peso = 0;
                                        }
                                      });
                                    }),
                                SizedBox(width: 10.0),
                                BotaoAredondado(
                                    icone: Icons.add,
                                    aoPressionar: () {
                                      setState(() {
                                        peso++;
                                      });
                                    }),
                              ])
                        ],
                      )),
                ),
                Expanded(
                  child: CartaoPadrao(
                    cor: kCorAtivaCartaoPadrao,
                    filhoCartao: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Idade', style: kDescricaoTextStyle),
                        Text(idade.toString(), style: kNumeroTextStyle),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BotaoAredondado(
                                  icone: Icons.remove,
                                  aoPressionar: () {
                                    setState(() {
                                      if (idade > 0) {
                                        idade--;
                                      } else {
                                        idade = 0;
                                      }
                                    });
                                  }),
                              SizedBox(width: 10.0),
                              BotaoAredondado(
                                  icone: Icons.add,
                                  aoPressionar: () {
                                    setState(() {
                                      idade++;
                                    });
                                  }),
                            ])
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BotaoInferior(
            tituloBotao: 'CALCULAR',
            aoPressionar: () {
              print(altura);
              print(peso);
              CalculadoraIMC calc = CalculadoraIMC(altura: altura, peso: peso);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TelaResultado(
                    resultadoIMC: calc.calcularIMC(),
                    resultadoTexto: calc.obterResultado(),
                    interpretacao: calc.obterInterpretacao(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class BotaoAredondado extends StatelessWidget {
  const BotaoAredondado(
      {super.key, required this.icone, required this.aoPressionar});

  final IconData icone;
  final aoPressionar;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icone),
      onPressed: aoPressionar,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: kBackgroundColor,
    );
  }
}
