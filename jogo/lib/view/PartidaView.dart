import 'package:flutter/material.dart';
import 'package:jogo/models/partida.dart';
import 'package:jogo/view/JogadorView.dart';

class PartidaWidget extends StatelessWidget {
  final Partida partida;

  const PartidaWidget({super.key, required this.partida});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Partida de Blackjack'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            JogadorWidget(jogador: partida.jogador),
            SizedBox(height: 16),
            JogadorWidget(jogador: partida.dealer),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Lógica para o jogador receber uma carta
                partida.jogadorReceberCarta();
              },
              child: Text('Receber Carta'),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                // Lógica para encerrar a rodada
                partida.dealerJogar();
                partida.encerrarRodada();
              },
              child: Text('Encerrar Rodada'),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                // Lógica para iniciar uma nova rodada
                partida.iniciarRodada();
              },
              child: Text('Nova Rodada'),
            ),
          ],
        ),
      ),
    );
  }
}
