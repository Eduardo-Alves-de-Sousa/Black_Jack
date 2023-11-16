import 'package:jogo/exceptions/jogador_exception.dart';

import 'cartas.dart';

class Jogador {
  String nome;
  List<Cartas> mao;
  int carteira;
  int aposta;

  // Construtor da classe Jogador
  Jogador({
    required this.nome,
    required this.mao,
    required this.carteira,
    required this.aposta,
  });

  // Método para adicionar uma carta à mão do jogador
  void receberCarta(Cartas carta) {
    mao.add(carta);
  }

  // Método para limpar a mão do jogador
  void limparMao() {
    mao.clear();
  }

  // Método para ajustar a aposta do jogador
  void ajustarAposta(int novaAposta) {
    if (novaAposta < 0 || novaAposta > carteira) {
      throw JogadorException(
          'Aposta inválida. Aposta deve ser entre 0 e $carteira.');
    }
    aposta = novaAposta;
  }

  // Método para ajustar a quantidade de dinheiro na carteira do jogador
  void ajustarCarteira(int novoValor) {
    if (novoValor < 0) {
      throw JogadorException('Valor da carteira não pode ser negativo.');
    }
    carteira = novoValor;
  }

  // Método para obter a pontuação da mão do jogador
  int obterPontuacao() {
    int pontuacao = 0;
    int quantidadeAses = 0;

    for (Cartas carta in mao) {
      if (carta.rank == 'Ás') {
        pontuacao += 11; // Assume 11 pontos inicialmente
        quantidadeAses++;
      } else if (carta.rank == 'Valete' ||
          carta.rank == 'Dama' ||
          carta.rank == 'Rei') {
        pontuacao += 10;
      } else {
        pontuacao += int.tryParse(carta.rank) ?? 0;
      }
    }

    // Ajusta o valor dos Ases se necessário
    while (quantidadeAses > 0 && pontuacao > 21) {
      pontuacao -= 10; // Converte o valor do Ás de 11 para 1
      quantidadeAses--;
    }

    return pontuacao;
  }
}
