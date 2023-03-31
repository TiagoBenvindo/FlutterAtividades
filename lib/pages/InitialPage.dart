import 'package:flutter/material.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);
  @override
  State<InitialPage> createState() => _InitialPageWidget();
}

class _InitialPageWidget extends State<InitialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Segunda tela"),
        backgroundColor: Colors.blueAccent,
      ),
      body: const Lister(),
    );
  }
}

class Lister extends StatefulWidget {
  const Lister({Key? key}) : super(key: key);
  @override
  State<Lister> createState() => _Lister();
}

class _Lister extends State<Lister> {
  final List<String> selecionados = <String>['Tiago', 'Vamos', 'Luis'];
  final List<bool> values = <bool>[false, false, false];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: selecionados.length,
          itemBuilder: (BuildContext context, int index) {
            return CheckboxListTile(
              tileColor: Colors.white,
              title: Text('Usuário ${selecionados[index]}'),
              value: values[index],
              onChanged: (bool? value) {
                setState(() {
                  values[index] = value!;
                });
              },
            );
          }),
    );
  }
}
