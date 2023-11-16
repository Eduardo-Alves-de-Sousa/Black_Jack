import 'package:flutter_test/flutter_test.dart';
import 'package:jogo/models/cartas.dart';

void main() {
  group('Cartas', () {
    test('Construtor deve criar instância válida', () {
      final carta = Cartas(suit: 'Copas', rank: 'Ás', emoji: '❤️');
      expect(carta, isA<Cartas>());
      expect(carta.suit, 'Copas');
      expect(carta.rank, 'Ás');
      expect(carta.emoji, '❤️');
    });
    test('Método toString deve retornar representação correta', () {
      final carta = Cartas(suit: 'Copas', rank: 'Ás', emoji: '❤️');
      final resultadoToString = carta.toString();
      expect(resultadoToString, 'Ás de Copas ❤️');
    });

    test('Método estático embaralhar deve retornar lista embaralhada', () {
      final cartas = [
        Cartas(suit: 'Copas', rank: 'Ás', emoji: '❤️'),
        Cartas(suit: 'Ouros', rank: '2', emoji: '♦️'),
        Cartas(suit: 'Espadas', rank: 'Valete', emoji: '♠️'),
      ];

      final cartasEmbaralhadas = Cartas.embaralhar(cartas);

      expect(cartasEmbaralhadas, isA<List<Cartas>>());
      expect(cartasEmbaralhadas, isNot(equals(cartas)));
    });
  });
}
