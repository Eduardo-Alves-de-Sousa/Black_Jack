import 'package:flutter/material.dart';
import 'home_screen.dart';

class HistoricoScreen extends StatelessWidget {
  const HistoricoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Histórico'),
        actions: [
          IconButton(
            onPressed: () {
              // Chamar a função para apagar o histórico
              Historico.limparHistorico();
              // Atualizar a UI usando setState
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            },
            icon: const Icon(Icons.delete),
          ),
        ],
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
            // Exibir o histórico global
            Expanded(
              child: ListView.builder(
                itemCount: Historico.historico.length,
                itemBuilder: (context, index) {
                  final jogo = Historico.historico[index];
                  return ListTile(
                    title: Text(
                      '${jogo.nomeJogador} - Pontuação: ${jogo.pontuacao} - ${jogo.resultado}',
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navegar para a tela inicial
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        },
        child: const Icon(Icons.home),
      ),
    );
  }
}

class HistoricoItem {
  final String id;
  final String nomeJogador;
  final int pontuacao;
  final String resultado;
  final bool empate;

  HistoricoItem({
    required this.id,
    required this.nomeJogador,
    required this.pontuacao,
    required this.resultado,
    required this.empate,
  });
}

class Historico {
  static List<HistoricoItem> historico = [];

  static void adicionarJogo({
    required String nomeJogador,
    required int pontuacao,
    required String resultado,
    required bool empate,
  }) {
    final id = DateTime.now().millisecondsSinceEpoch.toString();
    final novoJogo = HistoricoItem(
      id: id,
      nomeJogador: nomeJogador,
      pontuacao: pontuacao,
      resultado: resultado,
      empate: empate,
    );
    historico.add(novoJogo);
    // Atualizar a UI usando setState
    notifyListeners();
  }

  // Função para limpar o histórico
  static void limparHistorico() {
    historico.clear();
    // Atualizar a UI usando setState
    notifyListeners();
  }

  // Adicionando um método estático para notificar os ouvintes (observadores)
  static void notifyListeners() {
    // Usar setState para notificar os ouvintes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      for (var listener in listeners) {
        listener();
      }
    });
  }

  // Lista de ouvintes (observadores)
  static List<VoidCallback> listeners = [];
}
