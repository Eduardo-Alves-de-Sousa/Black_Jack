import 'package:jogo/exceptions/baralho_exception.dart';

import 'cartas.dart';
import 'naipe.dart';

class Baralho {
  final List<Cartas> cartas;
  final List<Cartas> cartasIniciais;

  Baralho()
      : cartas = _criarBaralho(),
        cartasIniciais = _criarBaralho();

  static List<Cartas> _criarBaralho() {
    final List<Naipe> naipes = [
      const Naipe('Copas', '❤️'),
      const Naipe('Ouros', '♦️'),
      const Naipe('Espadas', '♠️'),
      const Naipe('Paus', '♣️'),
    ];

    final List<String> ranks = [
      'Ás',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
      '10',
      'Valete',
      'Dama',
      'Rei'
    ];

    final List<Cartas> baralho = [];

    for (Naipe naipe in naipes) {
      for (String rank in ranks) {
        baralho.add(Cartas(suit: naipe.nome, rank: rank, emoji: naipe.emoji));
      }
    }

    return baralho;
  }

  void embaralhar() {
    cartas.shuffle();
  }

  Cartas pegarCarta() {
    if (cartas.isEmpty) {
      throw BaralhoVazioException('O baralho está vazio');
    }
    return cartas.removeAt(0);
  }

  void resetar() {
    cartas.clear();
    cartas.addAll(cartasIniciais);
    embaralhar();
  }
}
