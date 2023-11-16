import 'package:flutter/material.dart';

class HistoricoScreen extends StatelessWidget {
  const HistoricoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Substitua este exemplo com a lógica real para exibir o histórico
    List<HistoricoItem> historico = [
      HistoricoItem(nomeJogador: 'Jogador1', resultado: 'Venceu'),
      HistoricoItem(nomeJogador: 'Jogador2', resultado: 'Perdeu'),
      HistoricoItem(nomeJogador: 'Jogador3', resultado: 'Empatou'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Histórico'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Histórico de Partidas',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Column(
              children: historico
                  .map((item) => ListTile(
                        title: Text('${item.nomeJogador} - ${item.resultado}'),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class HistoricoItem {
  final String nomeJogador;
  final String resultado;

  // Adicionando um campo para indicar se a partida terminou em empate
  final bool empate;

  HistoricoItem({
    required this.nomeJogador,
    required this.resultado,
    this.empate = false,
  });
}
