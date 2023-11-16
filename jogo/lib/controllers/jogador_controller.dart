import 'package:jogo/models/cartas.dart';
import 'package:jogo/models/jogador.dart';

class JogadorController {
  // Método para criar um jogador com valores padrão
  static Jogador criarJogadorPadrao(String nome, int carteiraInicial) {
    return Jogador(
      nome: nome,
      mao: [],
      carteira: carteiraInicial,
      aposta: 0,
    );
  }

  // Método para adicionar uma carta à mão do jogador
  static void receberCarta(Jogador jogador, Cartas carta) {
    jogador.receberCarta(carta);
  }

  // Método para limpar a mão do jogador
  static void limparMao(Jogador jogador) {
    jogador.limparMao();
  }

  // Método para ajustar a aposta do jogador
  static void ajustarAposta(Jogador jogador, int novaAposta) {
    jogador.ajustarAposta(novaAposta);
  }

  // Método para ajustar a quantidade de dinheiro na carteira do jogador
  static void ajustarCarteira(Jogador jogador, int novoValor) {
    jogador.ajustarCarteira(novoValor);
  }

  // Método para obter a pontuação da mão do jogador
  static int obterPontuacao(Jogador jogador) {
    return jogador.obterPontuacao();
  }
}
