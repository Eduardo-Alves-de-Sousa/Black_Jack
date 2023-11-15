import 'package:jogo/models/cartas.dart';

class Baralho {
  late List<Cartas> cartas;

  // Construtor da classe Baralho
  Baralho() {
    cartas = _gerarBaralho();
  }

  // Método privado para gerar um baralho completo
  List<Cartas> _gerarBaralho() {
    List<Cartas> baralho = [];
    List<String> naipes = ['Copas', 'Ouros', 'Paus', 'Espadas'];
    List<String> valores = [
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

    // Loop aninhado para criar cartas para cada combinação de naipe e valor
    for (String naipe in naipes) {
      for (String valor in valores) {
        baralho.add(Cartas(suit: naipe, rank: valor));
      }
    }

    return baralho;
  }

  // Método para embaralhar as cartas no baralho
  void embaralhar() {
    cartas = Cartas.embaralhar(cartas);
  }

  // Método para retirar uma carta do topo do baralho
  Cartas pegarCarta() {
    if (cartas.isEmpty) {
      throw Exception('Baralho vazio');
    }
    return cartas.removeAt(0);
  }

  // Método para resetar o baralho, gerando um novo baralho completo
  void resetar() {
    cartas = _gerarBaralho();
  }
}
