// ignore: file_names
import 'package:jogo/models/baralho.dart';
import 'package:jogo/models/cartas.dart';

class BaralhoController {
  late Baralho _baralho;

  // Construtor da classe BaralhoController
  BaralhoController() {
    _baralho = Baralho();
  }

  // Método para iniciar uma nova rodada, embaralhando o baralho
  void iniciarRodada() {
    _baralho.embaralhar();
  }

  // Método para distribuir uma carta a um jogador
  Cartas distribuirCarta() {
    return _baralho.pegarCarta();
  }

  // Método para resetar o baralho para uma nova rodada
  void resetarBaralho() {
    _baralho.resetar();
  }
}
