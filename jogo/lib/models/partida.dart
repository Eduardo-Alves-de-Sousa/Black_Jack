import 'package:jogo/models/baralho.dart';
import 'package:jogo/models/jogador.dart';

class PartidaException implements Exception {
  final String mensagem;

  PartidaException(this.mensagem);

  @override
  String toString() => 'PartidaException: $mensagem';
}

// Interface para os observadores
abstract class PartidaObserver {
  void onRodadaIniciada();
  void onJogadorRecebeuCarta();
  void onDealerJogou();
  void onRodadaEncerrada();
}

class Partida {
  Jogador dealer;
  Jogador jogador;
  Baralho baralho;

  final List<PartidaObserver> _observadores = [];

  Partida({
    required this.dealer,
    required this.jogador,
    required this.baralho,
  });

  // Método para adicionar observadores
  void adicionarObservador(PartidaObserver observador) {
    _observadores.add(observador);
  }

  // Método para remover observadores
  void removerObservador(PartidaObserver observador) {
    _observadores.remove(observador);
  }

  // Método para notificar todos os observadores
  void _notificarObservadores(void Function(PartidaObserver) callback) {
    for (var observador in _observadores) {
      callback(observador);
    }
  }

  // Método para iniciar uma nova rodada
  void iniciarRodada() {
    // Verifica se há cartas suficientes no baralho
    if (baralho.cartas.length < 4) {
      throw PartidaException(
          'Não há cartas suficientes para iniciar uma nova rodada.');
    }

    // Limpa as mãos dos jogadores
    jogador.limparMao();
    dealer.limparMao();

    // Distribui duas cartas para cada jogador
    for (int i = 0; i < 2; i++) {
      jogador.receberCarta(baralho.pegarCarta());
      dealer.receberCarta(baralho.pegarCarta());
    }

    // Notifica os observadores sobre o início da rodada
    _notificarObservadores((observador) => observador.onRodadaIniciada());
  }

  // Método para o jogador receber uma carta
  void jogadorReceberCarta() {
    jogador.receberCarta(baralho.pegarCarta());

    // Notifica os observadores sobre o jogador receber uma carta
    _notificarObservadores((observador) => observador.onJogadorRecebeuCarta());
  }

  // Método para realizar a jogada do dealer
  void dealerJogar() {
    while (dealer.obterPontuacao() < 17) {
      dealer.receberCarta(baralho.pegarCarta());
    }

    // Notifica os observadores sobre o dealer jogar
    _notificarObservadores((observador) => observador.onDealerJogou());
  }

  // Método para encerrar a rodada e determinar o vencedor
  void encerrarRodada() {
    // Notifica os observadores sobre o encerramento da rodada
    _notificarObservadores((observador) => observador.onRodadaEncerrada());
  }
}
