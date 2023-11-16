// ignore: file_names
import 'package:flutter/material.dart';
import 'package:jogo/models/baralho.dart';
import 'package:jogo/models/cartas.dart';

class BaralhoView extends StatelessWidget {
  final Baralho baralho;

  // Construtor da classe BaralhoView
  const BaralhoView({super.key, required this.baralho});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Baralho',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        ElevatedButton(
          onPressed: () {
            embaralharBaralho();
          },
          child: const Text('Embaralhar Baralho'),
        ),
        ElevatedButton(
          onPressed: () {
            pegarCarta();
          },
          child: const Text('Pegar Carta do Topo'),
        ),
        ElevatedButton(
          onPressed: () {
            resetarBaralho();
          },
          // ignore: prefer_const_constructors
          child: Text('Resetar Baralho'),
        ),
      ],
    );
  }

  void embaralharBaralho() {
    try {
      baralho.embaralhar();
      // Atualizar a interface do usuário, se necessário
    } catch (e) {
      // Lidar com exceções, se houver
      // ignore: avoid_print
      print('Erro ao embaralhar o baralho: $e');
    }
  }

  void pegarCarta() {
    try {
      Cartas carta = baralho.pegarCarta();
      // Atualizar a interface do usuário, se necessário
      // ignore: avoid_print
      print('Carta retirada: $carta');
    } catch (e) {
      // Lidar com exceções, se houver
      // ignore: avoid_print
      print('Erro ao pegar uma carta: $e');
    }
  }

  void resetarBaralho() {
    try {
      baralho.resetar();
      // Atualizar a interface do usuário, se necessário
    } catch (e) {
      // Lidar com exceções, se houver
      // ignore: avoid_print
      print('Erro ao resetar o baralho: $e');
    }
  }
}
