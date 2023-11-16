import 'package:flutter/material.dart';
import 'jogo_blackjack.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController jogador1Controller = TextEditingController();
    TextEditingController jogador2Controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Blackjack'),
      ),
      backgroundColor: const Color(0xFF2E7D32),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Informe os nomes dos jogadores:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Form(
              child: Column(
                children: [
                  TextFormField(
                    controller: jogador1Controller,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      labelText: 'Nome Jogador 1',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: jogador2Controller,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      labelText: 'Nome Jogador 2',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                ),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                textStyle: MaterialStateProperty.all<TextStyle>(
                  const TextStyle(fontSize: 20),
                ),
              ),
              onPressed: () {
                if (jogador1Controller.text.isNotEmpty &&
                    jogador2Controller.text.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => JogoBlackjack(
                        jogador1Controller.text,
                        jogador2Controller.text,
                      ),
                    ),
                  );
                } else {
                  // Exibir um snackbar ou alerta informando que ambos os nomes devem ser preenchidos.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Por favor, insira os nomes dos jogadores.',
                      ),
                    ),
                  );
                }
              },
              child: const Text('Jogar'),
            ),
          ],
        ),
      ),
    );
  }
}
