// ignore: file_names
import 'package:flutter/material.dart';
import 'package:jogo/models/naipe.dart';

class NaipeWidget extends StatelessWidget {
  final Naipe naipe;

  const NaipeWidget({super.key, required this.naipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Naipe'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Nome do Naipe: ${naipe.nome}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Alguma lógica aqui, se necessário
              },
              child: const Text('Ação do Botão'),
            ),
          ],
        ),
      ),
    );
  }
}
