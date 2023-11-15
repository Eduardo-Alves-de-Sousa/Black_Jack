import 'package:jogo/models/cartas.dart';

class CartasController {
  // Método para criar uma lista de cartas com um naipe específico
  static List<Cartas> criarBaralhoComNaipe(String naipe) {
    List<String> ranks = [
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
      'Rei',
      'Ás'
    ];

    List<Cartas> baralho = [];

    for (String rank in ranks) {
      baralho.add(Cartas(suit: naipe, rank: rank));
    }

    return baralho;
  }

  // Método para criar um baralho completo
  static List<Cartas> criarBaralhoCompleto() {
    List<String> naipes = ['Copas', 'Ouros', 'Paus', 'Espadas'];
    List<Cartas> baralhoCompleto = [];

    for (String naipe in naipes) {
      baralhoCompleto.addAll(criarBaralhoComNaipe(naipe));
    }

    return baralhoCompleto;
  }

  // Método para embaralhar um baralho
  static List<Cartas> embaralharBaralho(List<Cartas> cartas) {
    cartas.shuffle();
    return cartas;
  }
}
