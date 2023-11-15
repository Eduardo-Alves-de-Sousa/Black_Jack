import 'package:jogo/models/baralho.dart';
import 'package:jogo/models/jogador.dart';
import 'package:jogo/models/partida.dart';

class PartidaController {
  Partida partida;

  // Construtor da classe PartidaController
  PartidaController({required this.partida});

  // Método para iniciar uma nova rodada
  void iniciarRodada() {
    partida.iniciarRodada();
  }

  // Método para o jogador receber uma carta
  void jogadorReceberCarta() {
    partida.jogadorReceberCarta();
  }

  // Método para realizar a jogada do dealer
  void dealerJogar() {
    partida.dealerJogar();
  }

  // Método para encerrar a rodada e determinar o vencedor
  void encerrarRodada() {
    partida.encerrarRodada();
    // Lógica adicional conforme necessário
  }
}

// Exemplo de uso
void main() {
  Baralho baralho = Baralho();
  Jogador jogador =
      Jogador(nome: 'Jogador', mao: [], carteira: 1000, aposta: 0);
  Jogador dealer = Jogador(nome: 'Dealer', mao: [], carteira: 10000, aposta: 0);

  Partida partida = Partida(dealer: dealer, jogador: jogador, baralho: baralho);
  PartidaController partidaController = PartidaController(partida: partida);

  // Iniciar uma nova rodada
  partidaController.iniciarRodada();

  // Jogador recebe uma carta
  partidaController.jogadorReceberCarta();

  // Dealer realiza sua jogada
  partidaController.dealerJogar();

  // Encerrar a rodada
  partidaController.encerrarRodada();
}
