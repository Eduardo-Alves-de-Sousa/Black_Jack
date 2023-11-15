import 'baralho.dart';
import 'jogador.dart';

class Partida {
  Jogador dealer;
  Jogador jogador;
  Baralho baralho;

  // Construtor da classe Partida
  Partida({
    required this.dealer,
    required this.jogador,
    required this.baralho,
  });

  // Método para iniciar uma nova rodada
  void iniciarRodada() {
    // Limpa as mãos dos jogadores
    jogador.limparMao();
    dealer.limparMao();

    // Distribui duas cartas para cada jogador
    for (int i = 0; i < 2; i++) {
      jogador.receberCarta(baralho.pegarCarta());
      dealer.receberCarta(baralho.pegarCarta());
    }
  }

  // Método para o jogador receber uma carta
  void jogadorReceberCarta() {
    jogador.receberCarta(baralho.pegarCarta());
  }

  // Método para realizar a jogada do dealer
  void dealerJogar() {
    while (dealer.obterPontuacao() < 17) {
      dealer.receberCarta(baralho.pegarCarta());
    }
  }

  // Método para encerrar a rodada e determinar o vencedor
  void encerrarRodada() {
    // Lógica para determinar o vencedor, calcular pontuações, etc.
    // (Esta parte depende das regras específicas do seu jogo)
  }
}
