import 'package:jogo/exceptions/baralho_exception.dart';

import 'cartas.dart';

// Interface para os diferentes estados do baralho
abstract class EstadoBaralho {
  void embaralhar(Baralho baralho);
  Cartas pegarCarta(Baralho baralho);
  void resetar(Baralho baralho);
}

class BaralhoNormal implements EstadoBaralho {
  @override
  void embaralhar(Baralho baralho) {
    baralho.cartas.shuffle();
  }

  @override
  Cartas pegarCarta(Baralho baralho) {
    if (baralho.cartas.isEmpty) {
      throw BaralhoVazioException('O baralho está vazio');
    }
    return baralho.cartas.removeAt(0);
  }

  @override
  void resetar(Baralho baralho) {
    baralho.cartas.clear();
    baralho.cartas.addAll(baralho.cartasIniciais);
    embaralhar(baralho);
  }
}

class BaralhoVazio implements EstadoBaralho {
  @override
  void embaralhar(Baralho baralho) {
    // Não faz nada quando o baralho está vazio
  }

  @override
  Cartas pegarCarta(Baralho baralho) {
    throw BaralhoVazioException('O baralho está vazio');
  }

  @override
  void resetar(Baralho baralho) {
    baralho.cartas.clear();
    baralho.cartas.addAll(baralho.cartasIniciais);
    baralho.mudarEstado(BaralhoNormal());
  }
}

class Baralho {
  late EstadoBaralho _estado;
  final List<Cartas> cartas;
  final List<Cartas> cartasIniciais;

  Baralho()
      : cartas = _criarBaralho(),
        cartasIniciais = _criarBaralho() {
    _estado = BaralhoNormal();
  }

  static List<Cartas> _criarBaralho() {
    final List<String> naipes = ['Copas', 'Ouros', 'Espadas', 'Paus'];
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

    for (String naipe in naipes) {
      for (String rank in ranks) {
        final emoji = _calcularEmoji(naipe);
        baralho.add(Cartas(suit: naipe, rank: rank, emoji: emoji));
      }
    }

    return baralho;
  }

  static String _calcularEmoji(String naipe) {
    switch (naipe) {
      case 'Copas':
        return '❤️';
      case 'Ouros':
        return '♦️';
      case 'Espadas':
        return '♠️';
      case 'Paus':
        return '♣️';
      default:
        return '';
    }
  }

  void embaralhar() {
    _estado.embaralhar(this);
  }

  Cartas pegarCarta() {
    return _estado.pegarCarta(this);
  }

  void resetar() {
    _estado.resetar(this);
  }

  // Adicione um método para alterar o estado do baralho
  void mudarEstado(EstadoBaralho novoEstado) {
    _estado = novoEstado;
  }
}
