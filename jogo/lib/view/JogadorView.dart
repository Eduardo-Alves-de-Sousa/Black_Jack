import 'package:flutter/material.dart';
import 'package:jogo/models/cartas.dart';
import 'package:jogo/models/jogador.dart';

class JogadorWidget extends StatelessWidget {
  final Jogador jogador;

  const JogadorWidget({super.key, required this.jogador});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Nome: ${jogador.nome}',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Carteira: ${jogador.carteira}',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Aposta: ${jogador.aposta}',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Pontuação: ${jogador.obterPontuacao()}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Mão:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
                  jogador.mao.map((carta) => _buildCartaWidget(carta)).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCartaWidget(Cartas carta) {
    return Text(
      carta.toString(),
      style: TextStyle(fontSize: 16),
    );
  }
}
