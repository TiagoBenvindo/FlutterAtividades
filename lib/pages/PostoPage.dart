import 'dart:html';

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class PostoPage extends StatefulWidget {
  const PostoPage({Key? key}) : super(key: key);
  @override
  State<PostoPage> createState() => _PostoPageWidget();
}

class _PostoPageWidget extends State<PostoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posto'),
        backgroundColor: Colors.blueAccent,
      ),
      body: const Posto(),
    );
  }
}

class Posto extends StatefulWidget {
  const Posto({Key? key}) : super(key: key);
  @override
  State<Posto> createState() => _Posto();
}

class _Posto extends State<Posto> {
  double valorGasolina = 0.0;
  double valorEtanol = 0.0;
  String valorCalculado = "";

  void _calculaMelhorOpcao() {
    double resultado = valorEtanol / valorGasolina * 100;
    if (resultado >= 70) {
      setState(() {
        valorCalculado = "Resultado: $resultado, \nMelhor abastecer com alcool";
      });
    } else {
      setState(() {
        valorCalculado =
            "Resultado: $resultado, \nMelhor abastecer com gasolina";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      // ignore: prefer_const_literals_to_create_immutables
      child: Column(children: [
        TextField(
          keyboardType: TextInputType.number,
          autofocus: true,
          decoration: const InputDecoration(label: Text("Valor da gasolina")),
          onChanged: (text) {
            valorGasolina = double.parse(text);
          },
        ),
        TextField(
          keyboardType: TextInputType.number,
          autofocus: true,
          decoration: const InputDecoration(label: Text("Valor do alcool")),
          onChanged: (text) {
            valorEtanol = double.parse(text);
          },
        ),
        ElevatedButton(
            onPressed: _calculaMelhorOpcao, child: const Text("Calcular")),
        Text(valorCalculado),
      ]),
    ));
  }
}
