import 'package:flutter/material.dart';

class palindromo extends StatefulWidget {
  const palindromo({super.key});

  @override
  State<palindromo> createState() => _palindromoState();
}

class _palindromoState extends State<palindromo> {
  final TextEditingController _controlador = TextEditingController();

  bool _espalindromo = false;

  @override
  void dispose() {
    _controlador.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verificador de Palíndromos'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        alignment: FractionalOffset.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _controlador,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Ingrese un texto',
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                setState(() {
                  _espalindromo = _verificar_texto(_controlador.text);
                });
              },
              child: Container(
                color: Colors.lightBlue,
                padding: const EdgeInsets.all(10),
                child: const Text('VERIFICAR'),
              ),
            ),
            const SizedBox(height: 20),
            _espalindromo
                ? const Icon(Icons.check_circle, color: Colors.green)
                : const Icon(Icons.error_rounded, color: Colors.red),
          ],
        ),
      ),
    );
  }
}

bool _verificar_texto(String? texto) {
  String? sinEspacios = texto?.replaceAll(RegExp(r'\s+'), '').toLowerCase();
  String? palindromo = sinEspacios?.split('').reversed.join('');

  return sinEspacios == palindromo;
}
